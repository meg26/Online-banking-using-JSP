package com.bank;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserLogin extends HttpServlet
{ 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");	
			PreparedStatement ps = conn.prepareStatement("select * from users where username=? and password=?");
			ps.setString(1, username);  
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			//System.out.println("xxx" + rs.next());
			String orig = request.getParameter("orig");
			if(rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("uid", rs.getInt("uid"));
				session.setAttribute("username", username);
				response.sendRedirect(orig);

			}
			else {
				request.setAttribute("invalid", "yes");
				request.setAttribute("orig", request.getParameter("orig"));
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}