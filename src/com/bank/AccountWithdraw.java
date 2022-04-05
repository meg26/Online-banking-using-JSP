package com.bank;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AccountWithdraw extends HttpServlet
{ 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
		try
		{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");
            Integer amount = Integer.parseInt(request.getParameter("amount"));
            String accno = request.getParameter("accno");
            HttpSession session = request.getSession(false);

            Statement stmt = conn.createStatement();
            PreparedStatement ps = conn.prepareStatement("select balance from accounts where accno=? and uid=(select uid from users where username=? and password=?)");
            ps.setString(1, accno); 
            ps.setString(2, (String) session.getAttribute("username"));
            ps.setString(3, request.getParameter("password"));        
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                if(amount > rs.getInt("balance")) {
                    request.setAttribute("invalid_amt", "yes");
                    rd.forward(request, response);
                }
                else {

                    ps = conn.prepareStatement("update accounts set balance=balance-? where accno=?");
                    ps.setInt(1, amount);
                    ps.setString(2, accno);
                    if(ps.executeUpdate() > 0) {
                        ps = conn.prepareStatement("insert into transactions values(NULL, (select aid from accounts where accno=?), ?, ?, ?, ?, curdate(), ?)");
                        ps.setString(1, accno);
                        ps.setString(2, accno);
                        ps.setString(3, accno);
                        ps.setString(4,"DEBIT");
                        ps.setInt(5, amount);
                        ps.setString(6,"Fund Withdrawal");
                        ps.executeUpdate();
                        rd = request.getRequestDispatcher("receipt.jsp");
                        request.setAttribute("type", "DEBIT");
                        request.setAttribute("amt", amount);
                        request.setAttribute("accno", accno);
                        rd.forward(request, response);
                    }
                }

            } 
			else {
				request.setAttribute("invalid_acc", "yes");
				rd.forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}