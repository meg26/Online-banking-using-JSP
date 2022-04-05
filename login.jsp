<!DOCTYPE html>
<html>
<head>
<style>
	body {font-family: Arial, Helvetica, sans-serif;}
	
	.imgcontainer {
		text-align: center;
		margin: 24px 0 12px 0;}
	.container {
		padding: 16px;
		}
		table {
 text-align:center;
  position: relative;
  top:60px;
  background-color:grey;
 

}
td{
	
padding:20px;
}
.button {
	background-color:#3BAF9F;
	display:block;
	margin:20px 0px 0px 20px;
	text-align:center;
	border-radius:12px;
	border:2px solid #3666473;
	padding:14px 110px;
	outline: none;
	cursor:pointer;
	transition:0.25px;
}
.p { padding:3px; }
	
</style>
</head>
    <body>
		<jsp:include page="header.html"/>
        <%
		String orig = (String) request.getAttribute("orig");
		if(session.getAttribute("uid") != null) {
			response.sendRedirect("home.jsp");
		}
        %>
		
		<h1 style="text-align:center">Login</h1>
        <form method="post" action="UserLogin">
			<div class="imgcontainer">
				<!-- <img src="log.png" alt="Avatar" class="avatar"> -->
			</div>
			<div class="container"><center>
			<table align="center">
				<tr>
					<td align="left">Name: </td>
					<td align="right"><input type = "text" name = "username" required></td>
				</tr>
				<tr>
					<td align="left">Password: </td>
					<td> <input type = "password" name = "password" required></td>
				</tr>
				<input type="hidden" name="orig" value="<%= orig %>">
				
				<tr>
					<td class="p" colspan="2">
						<button class="button" type="submit">Login</button>
					</td>
				</tr>
				<!--
				<tr>
					<td class="p" colspan="2">
						<button onclick="location.href='register.jsp'" type=button class="button">Register</button>
					</td>
				</tr>
				-->
		</table>
        </form>
			
			
		
        <%
		String invalid = (String) request.getAttribute("invalid");
		if (invalid!=null && invalid.equals("yes")) {
        %>
            <div style="padding-left:16px">
                Invalid username and/or password<br>
            </div>
        <%        
		}
        %>
		
    </body>
</html>