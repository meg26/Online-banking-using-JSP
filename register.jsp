<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,javax.servlet.*, javax.servlet.http.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");	
PreparedStatement ps = conn.prepareStatement("insert into users values (NULL, ?, ?, ?)");
%>
<html>
<style type="text/css">

table {

  position: relative;
  top:60px;
  background-color:grey;
 

}
td{
	
padding:20px;
}
.button{
	background-color:#3BAF9F;
	display:block;
	margin:20px 0px 0px 20px;
	text-align:center;
	border-radius:12px;
	border:2px solid #3666473;
	padding:14px 110px;
	outline;none;
	cursor:pointer;
	transition:0.25px;
}

</style>
    <body>
	<jsp:include page="header.html"/>
        <%
        boolean register_ok = false;
        String ok = (String) request.getParameter("ok");
        if(ok != null && ok.equals("yes")) {           
            ps.setString(1, request.getParameter("username"));
            ps.setString(2, request.getParameter("email"));
            ps.setString(3, request.getParameter("password"));
            register_ok = ps.executeUpdate() > 0;
            if(register_ok) {
        %>
                <div style="padding-left:16px">
                    Registration successful<br>
                </div>
        <%
            }
        }
        if(!register_ok) {
        %>
            <form method="post" action="register.jsp">
			<center><h1>XYZ BANK</h1></center>
            <table align="center">	
                <tr><td colspan="2"><center><h1>Registration</h1></center></td></tr>			
                <tr><td align="left">Username: </td><td><input align="left" type = "text" name = "username" pattern="[a-zA-Z]+" required><br></td></tr>
                <tr><td align="left">Email: </td><td ><input type = "email" name = "email" required><br></td></tr>
                <tr><td align="left">Password:</td><td> <input type = "password" name = "password" required><br></td></tr>
                <input type="hidden" name="ok" value="yes">
                <tr><td colspan="2"><input class="button" type = "submit" value = "Register"></td></tr>
				
				</table>
				
            </form>
			
        <%
        }
        if (ok !=null && !register_ok) {
        %>
            <strong>ERROR</strong><br>
        <%
        }
        %>
    </body>
</html>

