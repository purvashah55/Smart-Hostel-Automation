<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student FeedBack</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
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
			<%
				String hostelName="";
				Student studentLoginDetails=(Student)session.getAttribute("studentLoginDetails"); 
				Connection con=DBConnect.getConnection();
				Statement st=con.createStatement();
				String sql1="select * from RoomStudents where email='"+studentLoginDetails.getStudentUserName()+"'";
				ResultSet rs1=st.executeQuery(sql1);
				if(rs1.next())
				{
					hostelName=rs1.getString(1);
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("studentHomePage.jsp");
					rd.include(request, response);
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("alert(\"Sorry! you can't give feedback until you are alloted for any hostel \")");
					out.println("</SCRIPT>");		
				}
			%>
		
			<h1 align="center"><%= hostelName %></h1>
			<form action="StudentFeedbackHandler" method="post">
				<div align="center">
					<input type="image" name="feedback" src="images/feedback.jpg" height="112" width="118" value="like"/>
					<input type="image" name="feedback" src="images/feedback1.jpg" height="112" width="118" value="dislike"/>
				</div>
			</form>
			</div>
				</div>
<div id="footer">
	<div>
 		 <ul class="navigation">
						<li class="active">
							<a href="template.jsp">Home</a>
						</li>
						<li>
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