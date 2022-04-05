<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,javax.servlet.*, javax.servlet.http.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");	
PreparedStatement ps = conn.prepareStatement("delete from accounts where accno=? and uid=(select uid from users where username=? and password=?)");
%>
<html>
    <head>
            <title>XYZ Bank</title>
    </head>
<style type="text/css">
    table {
        text-align: center;
        position: relative;
        top: 60px;
        background-color: grey;


    }

    td {

        padding: 20px;
    }

    .button {
        background-color: #3BAF9F;
        display: block;
        margin: 20px 0px 0px 20px;
        text-align: center;
        border-radius: 12px;
        border: 2px solid #3666473;
        padding: 14px 110px;
        outline;
        none;
        cursor: pointer;
        transition: 0.25px;
    }
</style>

<body>
    <jsp:include page="header.html" />
    <%
    boolean close_ok = false;
    String ok = (String) request.getParameter("ok");
    if(ok != null && ok.equals("yes")) {
        ps.setString(1, request.getParameter("accno"));
        ps.setString(2, (String) session.getAttribute("username"));
        ps.setString(3, request.getParameter("password"));
        close_ok = ps.executeUpdate() > 0;
        if(close_ok) {
    %>
            <div style="padding-left:16px">
                Account closed<br>
            </div>
    <%
        }
    }
    if(!close_ok) {
    %>
        <form method="post" action="close.jsp">
            <center>
                <h1>XYZ BANK</h1>
            </center>
            <table align="center">
                <tr>
                    <td colspan="2">
                        <center>
                            <h1>CLOSE ACCOUNT</h1>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="left"> A/C number:</td>
                    <td> <input type="text" name="accno" pattern="[a-zA-Z0-9]+" required><br></td>
                </tr>
                <tr>
                    <td align="left"> Password:</td>
                    <td> <input type="password" name="password" required><br></td>
                </tr>
                <input type="hidden" name="ok" value="yes">
                <tr>
                    <td colspan="2"> <input class="button" type="submit" value="Close Account"></td>
                </tr>
            </table>
        </form>
    <%
    }
    if (ok !=null && !close_ok) {
    %>
        <div style="padding-left:16px">
            Invalid Account<br>
        </div>
    <%
    }
    %>
</body>

</html>