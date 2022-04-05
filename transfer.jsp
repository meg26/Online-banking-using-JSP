<html>
    <head><style type="text/css">

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
        <script>
            function validateForm() {
                var x = document.forms["tform"]["saccno"].value;
                var y = document.forms["tform"]["raccno"].value;
                if (x == y) {
                  alert("Sender and Receiver account must be different");
                  return false;
                }
                return true;
              }
        </script>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <form name="tform" method="post" action="BankTransfer" onsubmit="return validateForm()">
		<center><h1>XYZ BANK</h1></center>
		<table align="center">
		<tr><td colspan="2"><center><h1>TRANSFER</h1></center></td></tr>
               <tr><td align="left"> Your A/C number: </td><td> <input type = "text" name = "saccno"  pattern="[a-zA-Z0-9]+" required><br></td></tr>
               <tr><td align="left"> Recipient A/C number: </td><td> <input type = "text" name = "raccno"  pattern="[a-zA-Z0-9]+" required><br></td></tr>
               <tr><td align="left"> Amount:  </td><td><input type = "number" min = "1" name = "amount" required><br></td></tr>
               <tr><td align="left"> Password: </td><td><input type = "password" name = "password" required><br></td></tr>
                <tr><td colspan="2"><input class="button" type = "submit" value = "Deposit"></td></tr>
                
				</table>
        </form>
        <%
        String invalid_amt = (String) request.getAttribute("invalid_amt");
        String invalid_sacc = (String) request.getAttribute("invalid_sacc");
        String invalid_racc = (String) request.getAttribute("invalid_racc");
        if(invalid_amt != null && invalid_amt.equals("yes")) {
        %>
            <div style="padding-left:16px">
                Insufficient Funds<br>
            </div>
        <%
        }
        if(invalid_sacc!=null && invalid_sacc.equals("yes")) {
        %>
            <div style="padding-left:16px">
                Invalid Sender A/C number or password<br>
            </div>
        <%
        }
        if(invalid_racc!=null && invalid_racc.equals("yes")) {
        %>
            <div style="padding-left:16px">
                Invalid Recipient A/C number<br>
            </div>
        <%
        }
        %>
    </body>
</html>