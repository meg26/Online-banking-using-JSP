<html>
<head>
<style type="text/css">

table {
 text-align:center;
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
        <form method="post" action="AccountWithdraw">
		<center><h1>XYZ BANK</h1></center>
		<table align="center">
		<tr><td colspan="2"><center><h1>WITHDRAW</h1></center></td></tr>
            <tr><td align="left">A/C number: </td><td><input type = "text" name = "accno" pattern="[a-zA-Z0-9]+" required><br></td></tr>
          <tr><td align="left">  Value: </td><td><input type = "number" min = "1" name = "amount" required><br></td></tr>
<tr><td align="left">Password: </td><td><input type = "password" name = "password" required><br></td></tr>
        <tr><td colspan="2">    <input class="button" type = "submit" value = "Withdraw"></td></tr>
		</table>
        </form>
        <%
        String invalid_amt = (String) request.getAttribute("invalid_amt");
        String invalid_acc = (String) request.getAttribute("invalid_acc");
        if(invalid_amt!=null && invalid_amt.equals("yes")) {
        %>
            <div style="padding-left:16px">
                Insufficient Funds<br>
            </div>        
        <%
        }
        else if(invalid_acc!=null && invalid_acc.equals("yes")) {
        %>
            <div style="padding-left:16px">
                Invalid A/C number or password<br>
            </div>
        <%
        }
        %>
    </body>
</html>