<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,javax.servlet.*, javax.servlet.http.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");	
PreparedStatement ps = conn.prepareStatement("insert into accounts values (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1000)");
%>
<html>

<head>

	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
		}

		body {
			background-image: url();
			background-position: center;
			background-size: cover;
			font-family: sans-serif;
			margin-top: 40px;
		}

		.reform {
			width: 1000px;
			background-color: rgb(0, 0, 0, 6);
			margin: auto;
			color: #FFFFFF;
			padding: 10px 0px 10px 0px;
			text-align: center;
			border-radius: 15px 15px 0px 0px;
		}

		.main {
			background-color: rgb(0, 0, 0, 0.5);
			width: 1000px;
			margin: auto;
		}

		form {
			padding: 10px;
		}

		#name {
			width: 100%;
			height: 100px;
		}

		.name {
			margin-left: 25px;
			margin-top: 30px;
			width: 125px;
			color: white;
			font-size: 18px;
			font-weight: 700;
		}

		.fname {
			position: relative;
			left: 150px;
			top: -37px;
			line-height: 40px;
			border-radius: 6px;
			padding: 0 22px;
			font-size: 16px;
		}

		.mname {
			position: relative;
			left: 130px;
			top: -37px;
			line-height: 40px;
			border-radius: 6px;
			padding: 0 22px;
			font-size: 16px;
			color: #555;

		}

		.lname {
			position: relative;
			left: 100px;
			top: -37px;
			line-height: 40px;
			border-radius: 6px;
			padding: 0 22px;
			font-size: 16px;
			color: #555;

		}

		.flabel {
			position: relative;
			color: #E5E5E5;
			text-transform: capitalize;
			font-size: 14px;
			left: 60px;
			top: -10px;
		}

		.mlabel {
			position: relative;
			color: #E5E5E5;
			text-transform: capitalize;
			font-size: 14px;
			left: 30px;
			top: -10px;
		}

		.llabel {
			position: relative;
			color: #E5E5E5;
			text-transform: capitalize;
			font-size: 14px;
			left: 16px;
			top: -10px;


		}

		.mob {
			position: relative;
			left: 150px;
			top: -37px;
			width: 840px;
			line-height: 40px;
			border-radius: 6px;
			padding: 0 22px;
			font-size: 16px;
			color: #555;
		}

		.dob {
			position: relative;
			left: 150px;
			top: -37px;
			width: 840px;
			line-height: 40px;
			border-radius: 6px;
			padding: 0 22px;
			font-size: 16px;
			color: #555;
		}

		.email {
			position: relative;
			left: 150px;
			top: -37px;
			width: 840px;
			line-height: 40px;
			border-radius: 6px;
			padding: 0 22px;
			font-size: 16px;
			color: #555;
		}


		.add {
			position: relative;
			left: 150px;
			top: -27px;
			line-height: 20px;
			width: 840px;
			border-radius: 6px;
			padding: 0 24px;
			font-size: 16px;
			color: #555;
		}

		.option {
			position: relative;
			left: 150px;
			top: -20px;
			width: 840px;
			line-height: 40px;
			border-radius: 6px;
			padding: 0 22px;
			font-size: 16px;
			color: #555;
			outline: none;
			overflow: hidden;
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
</head>

<jsp:include page="header.html" />
<%
String ok = (String) request.getParameter("ok");
boolean open_ok = false;
if(ok != null && ok.equals("yes")) {
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	Random rand = new Random();
	int random_num = 100000 + rand.nextInt(999999);
	String accno = fname.substring(0, 2) + lname.substring(0, 2) + random_num;
	accno = accno.toUpperCase();

	ps.setInt(1, (Integer) session.getAttribute("uid"));
	ps.setString(2, accno);
	ps.setString(3, fname);
	ps.setString(4, request.getParameter("mname"));
	ps.setString(5, lname);
	ps.setString(6, request.getParameter("dob"));
	ps.setString(7, request.getParameter("mobile"));
	ps.setString(8, request.getParameter("email"));
	ps.setString(9, request.getParameter("address"));
	ps.setString(10, request.getParameter("acctype"));
	open_ok = ps.executeUpdate() > 0;
	if(open_ok) {
%>
		<div style="padding-left:16px">
			Account opened successfully. Your A/C number is <b><%= accno %></b><br>
		</div>
<%
	}        
}
if(!open_ok) {
%>

	<form form="open_form" method="post" action="open.jsp">

		<div class="main">

			<div class="reform">
				<h1>OPEN ACCOUNT</h1>
			</div>

			<div id="name">
				<h2 class="name">Name:</h2>
				<input class="fname" type="text" name="fname" pattern="[A-Za-z]+" minlength="2" required />
				<label class="flabel">First Name</label>
				<input type="text" class="mname" name="mname" pattern="[A-Za-z]+" />
				<label class="mlabel">Middle Name</label>
				<input type="text" class="lname" name="lname" pattern="[A-Za-z]+" minlength="2" required />
				<label class="llabel">Last Name</label>
			</div>

			<h2 class="name">DoB: </h2><input type="date" class="dob" name="dob" required />
			<h2 class="name">Mobile num: </h2><input class="mob" type="text" name="mobile" pattern="[0-9]{10}"
				maxlength="10" required />
			<h2 class="name">Email: </h2><input type="email" class="email" name="email" required />
			<h2 class="name">Address:</h2><textarea type="text" class="add" rows="8" cols="20" name="address"
				required></textarea>
			<input type="hidden" name="ok" value="yes"></td>
			</tr>
			<h2 class="name">Account Type:</h2><select class="option" name="acctype" required>
				<option>Savings Account</option>
				<option>Current Account</option>
			</select>
			<center><button type="submit" class="button" >Submit</button></center>
		</div>
	</form>
<%
}
if (ok !=null && !open_ok) {
%>
	<div style="padding-left:16px">
		ERROR<br>
	</div>
<%
}
%>
</body>

</html>