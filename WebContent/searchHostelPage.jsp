<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hostel Search Page</title>
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
				<div style="position: relative;left: 300px;top:20px">
				<h1><font color="Brown" align="center">Looking for your area!!!</font></h1><br>
					<form action="searchedHostelsPage.jsp" method="post">
						<table align="center" border="1">
								<input name="search" placeholder="Enter the area" type="text" style="aligpadding=10px;font-size=17px;border:1px solid grey;float:left;height:53px;background:#f1f1f1"/>
								<button type="submit" name="search" ><img src="images/Search.png" width="70" height="50"></button>
						</table>					
					</form>
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