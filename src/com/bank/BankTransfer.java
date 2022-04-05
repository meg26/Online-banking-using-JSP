package com.bank;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BankTransfer extends HttpServlet
{ 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			Integer amount = Integer.parseInt(request.getParameter("amount"));
			String saccno = request.getParameter("saccno");
			String raccno = request.getParameter("raccno");
			HttpSession session = request.getSession(false);
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");
			PreparedStatement ps = conn.prepareStatement("select balance from accounts where accno=?");
			ps.setString(1, raccno);
			ResultSet rs = ps.executeQuery();
			RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
			if(rs.next()) {
				ps = conn.prepareStatement("select * from accounts where accno=? and uid=(select uid from users where username=? and password=?)");
				ps.setString(1, saccno);
				ps.setString(2, (String) session.getAttribute("username"));
				ps.setString(3, request.getParameter("password"));
				rs = ps.executeQuery();
				if(rs.next()) {
					if(amount <= rs.getInt("balance")) {
						ps = conn.prepareStatement("update accounts set balance=balance-? where accno=?");
						ps.setInt(1, amount);
						ps.setString(2, saccno);
						int t1 = ps.executeUpdate();
	
						ps = conn.prepareStatement("update accounts set balance=balance+? where accno=?");
						ps.setInt(1, amount);
						ps.setString(2, raccno);
						int t2 = ps.executeUpdate();

						if(t1 > 0 && t2 > 0){
							ps = conn.prepareStatement("insert into transactions values(NULL, (select aid from accounts where accno=?), ?, ?, ?, ?, curdate(), ?)");
							ps.setString(1, saccno);
							ps.setString(2, saccno);
							ps.setString(3, raccno);
							ps.setString(4,"TRANSFER");
							ps.setInt(5, amount);
							ps.setString(6,"Fund Transfer");
							ps.executeUpdate();
						}
						request.setAttribute("type", "TRANSFER");
						request.setAttribute("amt", amount);
						request.setAttribute("sender", saccno);
                        request.setAttribute("receiver", raccno);
						rd = request.getRequestDispatcher("receipt.jsp");
						rd.forward(request, response);
	
					}
					else {
						request.setAttribute("invalid_amt", "yes");
						rd.forward(request, response);
					}

				}
				else {
					request.setAttribute("invalid_sacc", "yes");
					rd.forward(request, response);
				}

			}
			else {
				request.setAttribute("invalid_racc", "yes");
				rd.forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}