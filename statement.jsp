<html>
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
        <form method="post" action="statement_final.jsp">
		<center><h1>XYZ BANK</h1></center>
		<table align="center">
            <tr>
                <td colspan="2"><center><h1>MONTHLY STATEMENT</h1></center></td>
            </tr>
            <tr>
                <td align="left">  <label for="accno">A/C number:</label> </td>
                <td align="left">
                    <input type = "text" name = "accno"  pattern="[a-zA-Z0-9]+" required><br></td>
                </tr>
            <tr>
                <td align="left"> <label for="sdate">From:</label></td>
                <td  align="left"  >
                    <input  type="date" name="sdate"><br>
                </td>
            </tr>
           <tr>
               <td align="left">  
                   <label for="edate">To:</label></td>
               <td align="left">
                    <input align="left" type="date" name="edate"><br>
                </td>
            </tr>       
            <tr>
                <td colspan="2">  
                    <input class="button" type = "submit" value = "Generate Report">
                </td>
            </tr>
        </form>
        <%
        String invalid = (String) request.getAttribute("invalid");
        if (invalid!=null && invalid.equals("Yes")) {
        %>
            <div style="padding-left:16px">
                Invalid Account number
            </div>
        <%
        }
        %>
    </body>
</html>