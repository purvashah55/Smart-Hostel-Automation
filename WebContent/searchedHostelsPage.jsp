<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hostel Searched Page</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
    <%
             Connection connection = DBConnect.getConnection();
             Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
             String hostelArea=request.getParameter("search");
		   	 String sql="select * from Hostel where hostelArea='"+hostelArea+"' or hostelCity='"+hostelArea+"'";
             ResultSet rs = statement.executeQuery(sql); 
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
						<li class="selected">
							<a href="searchHostelPage.jsp">Hostels</a>
						</li>
						<li>
							<a href="studentLoginPage.jsp">Student Login</a>
						</li>
						<li>
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
				
				<div>
					<h1 align="center">Hostels in Your Area</h1>
					<table align="center" border="02">
						<tr>
							<td><h4>Name</h4></td>
							<td><h4>Address</h4></td>
							<td><h4>Type</h4></td>
							<td><h4>Mess Facility</h4></td>
							<td><h4>Contact Number</h4></td>
						</tr>
					<%
						while(rs.next())
						{
					%>
							<tr>
								<td><%= rs.getString(1)%></td>
								<td><%= rs.getString(4)%></td>
								<td><%= rs.getString(11)%></td>
								<td><%= rs.getString(6)%></td>
								<td><%= rs.getString(10)%></td>
							</tr>
					<%
						}
					%>
					</table>
				</div>
		</div>
</div>
<div id="footer">
	<div>
 	<ul class="navigation">
						<li >
							<a href="template.jsp">Home</a>
						</li>
						<li class="active">
							<a href="searchHostelPage.jsp">Hostels</a>
						</li>
						<li>
							<a href="studentLoginPage.jsp">Student Login</a>
						</li>
						<li>
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