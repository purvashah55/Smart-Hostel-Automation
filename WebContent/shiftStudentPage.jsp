<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Shift Page</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<style>
		.bordered{width: 400px;height: 230px;padding: 20px;border: 10px groove lightblue;background-color: white;}
</style>
<body>
<% 		
		String hostelName=(String)session.getAttribute("hostel");
		Connection con=DBConnect.getConnection();
		Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String sql1="select roomNo from Room where hostelName='"+hostelName+"'";
		String sql2="select * from AllotedApplications where hostelName='"+hostelName+"'";
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
			
		<form action="ShiftStudent" method="post"> 
		<br><br>
		<h2 align="center"><font face="Times New Roman" color="#316e66">SHIFT STUDENT</font></h2>
		<div class="bordered" style="position: relative;left: 250px;top:20px">
		<table align="center" border="0" cellpadding="5" cellspacing="5" bgcolor="">
			<tr>
				<td>Hostel Name</td>
				<td><input type="text" required="required" name="hostelName" value='<%=hostelName%>' readonly/></td>
			</tr>
			<tr>
				<td>Student Name</td>
				<td>
					<select name="email">
					<%
						ResultSet rs2=st.executeQuery(sql2);	
						while(rs2.next())
						{
					%>
							<option  value='<%= rs2.getString(4) %>'><%= rs2.getString(1)+" "+rs2.getString(3) %>
					<%
						}
					%>
														
					</select>
				</td>
			</tr>
			<tr>
				<td>Room Number</td>
				<td>
					<select name="roomNo">
					<%
						ResultSet rs=st.executeQuery(sql1);
						while(rs.next())
						{
					%>
							<option  value='<%= rs.getString(1) %>'><%= rs.getString(1) %>
					<%
						}
					%>
														
					</select>
				</td>
			</tr>			
		</table><br><br>		
		<p align="center">
			<input type="submit"  value="Shift">
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