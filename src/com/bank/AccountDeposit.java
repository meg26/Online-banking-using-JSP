package com.bank;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AccountDeposit extends HttpServlet
{ 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher rd = request.getRequestDispatcher("deposit.jsp");
		try
		{
			Integer amount = Integer.parseInt(request.getParameter("amount"));
			String accno = request.getParameter("accno");
			if(amount <= 0) {
				request.setAttribute("invalid_amt", "yes");
				rd.forward(request, response);
			}
			HttpSession session = request.getSession(false);
			Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");
            PreparedStatement ps = conn.prepareStatement("update accounts set balance=balance+? where accno=? and uid=(select uid from users where username=? and password=?)");
            ps.setInt(1, amount);
			ps.setString(2, accno);
			ps.setString(3, (String) session.getAttribute("username"));
            ps.setString(4, request.getParameter("password"));

            if(ps.executeUpdate() > 0) {
				ps = conn.prepareStatement("insert into transactions values(NULL, (select aid from accounts where accno=?), ?, ?, ?, ?, curdate(), ?)");
				ps.setString(1, accno);
				ps.setString(2, accno);
				ps.setString(3, accno);
				ps.setString(4,"CREDIT");
				ps.setInt(5, amount);
				ps.setString(6,"Fund Deposit");
				ps.executeUpdate();
				request.setAttribute("type", "CREDIT");
				request.setAttribute("amt", amount);
				request.setAttribute("accno", accno);
				rd = request.getRequestDispatcher("receipt.jsp");
				rd.forward(request, response);

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