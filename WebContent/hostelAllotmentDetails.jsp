<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hostel Allotment Details</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<style>
		.bordered{width: 400px;height: 300px;padding: 20px;border: 10px groove lightblue;background-color: white;}
</style>
<body>
<%
	String hostelName="";
	int roomNo=0,price=0,paidFee=0,remainingFee=0;
	Student studentLoginDetails=(Student)session.getAttribute("studentLoginDetails"); 
	Connection con=DBConnect.getConnection();
	Statement st=con.createStatement();
	String sql1="select * from RoomStudents where email='"+studentLoginDetails.getStudentUserName()+"'";
	String sql2="select price from Room where roomNo=? and hostelName=?";
	PreparedStatement stmt1=(PreparedStatement) con.prepareStatement(sql2);
	ResultSet rs1=st.executeQuery(sql1);
	if(rs1.next())
	{
		hostelName=rs1.getString(1);
		roomNo=rs1.getInt(2);
		price=rs1.getInt(6);
		paidFee=rs1.getInt(7);
		remainingFee=rs1.getInt(8);
	/*	stmt1.setInt(1,roomNo)
		stmt1.setString(2,hostelName);
		ResultSet rs2=stmt1.executeQuery();
		if(rs2.next())
		{
			price=rs2.getInt(1);	
		}*/
	}
%>

<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<img src="images/newlogo.jpg" alt="LOGO" height="112" width="118">
				</div>
				<div id="navigation">
					<ul>
						<li >
							<a href="template.jsp">Home</a>
						</li>
						<li>
							<a href="searchHostelPage.jsp">Hostels</a>
						</li>
						<li>
							<a href="studentLoginPage.jsp">Student Login</a>
						</li>
						<li class="selected">
							<a href="hostelLoginPage.jsp">Hostel Login</a>
						</li>
						<li>
							<a href="contact.jsp">Contact</a>
						</li>
						<li>
							<a href="studentFeedbackPage.jsp">FeedBack</a>
						</li>
					</ul>
				</div>
			</div>
			<br><br>
	<form action="" method="post"> 
		<br><br>
		<h2 align="center"><font face="Times New Roman" color="#316e66">Allotment Status</font></h2>
		<div class="bordered" style="position: relative;left: 250px;top:20px">
		<table align="center" border="0" cellpadding="5" cellspacing="5" bgcolor="">
			<tr>
				<td>Hostel Name</td>
				<td><input type="text" required="required" name="hostelName" value='<%= hostelName %>' readonly/></td>
			</tr>
			<tr>
				<td>roomNo</td>
				<td><input type="number"  required="required" name="roomNo" value='<%= roomNo %>' readonly/></td>
			</tr>	
			<tr>
				<td>Total Fees</td>
				<td><input type="text" required="required" name="price" readonly value='<%= price %>' readonly/></td>
			</tr>
			<tr>
				<td>Paid Fees</td>
				<td><input type="text" required="required" name="paidFee" readonly value='<%=paidFee %>' readonly/></td>
			</tr>
			<tr>
				<td>Remaining Fees</td>
				<td><input type="text" required="required" name="remainingFee" readonly value='<%= remainingFee %>' readonly/></td>
			</tr>
		</table><br><br>					
		</div>
	</form>
			
	</div>
</div>
<div id="footer">
	<div>
				<ul class="navigation">
						<li >
							<a href="template.jsp">Home</a>
						</li>
						<li>
							<a href="searchHostelPage.jsp">Hostels</a>
						</li>
						<li>
							<a href="studentLoginPage.jsp">Student Login</a>
						</li>
						<li class="active">
							<a href="hostelLoginPage.jsp">Hostel Login</a>
						</li>
						<li>
							<a href="contact.jsp">Contact</a>
						</li>
						<li>
							<a href="studentFeedbackPage.jsp">FeedBack</a>
						</li>
					</ul>
			</div>
			<p align="center">
			Last visited:<%= new java.util.Date() %>
			</p>
		</div>
</body>
</html>