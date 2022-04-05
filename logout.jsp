<html>
<head>
    <title>Logout</title>
</head>
    <body>
        <% session.invalidate(); %>
        You have successfully logged out<br>
        <a href="login.jsp">Login</a>
    </body>
</html>