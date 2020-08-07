<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Home Page</title>
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
						<li class="selected">
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
				<div id="contents">
				<div class="box">
					<div>
						<div class="body" align="center">
								<h1 align="center"><img src="images/hi.gif" height="500">
									<%  
										Student s=(Student)session.getAttribute("studentLoginDetails");
										out.println(s.getFirstName());
									%>
								</h1>
								<a href='profileFormPage2.jsp'><img src="images/pro.png"></a><br>
								 
								<a href='FormDirector'><img src="images/apply.gif"></a><br>
								<a href='hostelAllotmentDetails.jsp'><img src="images/allot.png" width="200" height="203"></a><br><br>
								<a href='studentFeedbackPage.jsp'><img src="images/givefeedback.jpg" width="200" height="203"></a><br><br><br>
								<a href='StudentLogout'><img src="images/lgout.jpg" width="200" height="203"></a>	
						</div>
					</div>
				</div>
				</div>	
		</div>
</div>
<div id="footer">
	<div>
 		<ul class="navigation">
						<li>
							<a href="template.jsp">Home</a>
						</li>
						<li>
							<a href="searchHostelPage.jsp">Hostels</a>
						</li>
						<li class="active">
							<a href="studentLoginPage.jsp">Student Login</a>
						</li>
						<li>
							<a href="hostelLoginPage.jsp">Hostel Login</a>
						</li>
						<li>
							<a href="contact.jsp">Contact</a>
						</li>
						<li>
							<a href="studentFeedbackPage.jspl">FeedBack</a>
						</li>
					</ul>
			</div>
			<p align="center">
			Last visited:<%= new java.util.Date() %>
			</p>	
	</div>
</body>
</html>