<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Room Details</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<style>
		.bordered{width: 400px;height: 230px;padding: 20px;border: 10px groove lightblue;background-color: white;}
</style>
<body>
<% 		
		String hostelName=(String)session.getAttribute("hostel");
		Connection con=DBConnect.getConnection();
		Statement st=con.createStatement();
		String sql1="select * from Hostel where hostelName='"+hostelName+"'";
		ResultSet rs=st.executeQuery(sql1);
		if(rs.next())
		{
			int two=rs.getInt(7);
			int three=rs.getInt(8);
			int four=rs.getInt(9);
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
						<li>
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
			
		<form action="AddRoom" method="post"> 
		<br><br>
		<h2 align="center"><font face="Times New Roman" color="#316e66">ADD ROOM</font></h2>
		<div class="bordered" style="position: relative;left: 250px;top:20px">
		<table align="center" border="0" cellpadding="5" cellspacing="5" bgcolor="">
			<tr>
				<td>Room Number</td>
				<td><input type="number" required="required" name="roomNo"/></td>
			</tr>
			<tr>
				<td>No of beds</td>
				<td><input type="number" min="1" required="required" name="beds"/></td>
			</tr>	
			<tr>
				<td>Hostel Name</td>
				<td><input type="text" required="required" name="hostelName" value='<%=hostelName%>' readonly/></td>
			</tr>
		</table><br><br>		
		<p align="center">
			<input type="submit"  value="Add Room">
		</p>					
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