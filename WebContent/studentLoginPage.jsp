<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Login Page</title>
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
			<br><br>
			<div id="main">
			
			<div>
			<div>
			
				<form  action="StudentLogin" method="post" align="center"> 
				<h1 style="color: #316e66;font: 60px/60px ">Log in</h1> 
				<p> 
					UserName 
					<input required="required" type="text" placeholder="myusername" name="studentUserName"/>
				</p>
				<p> 
					Password 
					<input required="required" type="password" placeholder="eg. X8df!90EO" name="studentPassword"/> 
				</p>
				<p> 
					<input type="submit" value="Login" style="height: 26px;width: 60px;border: 1"/> 
				</p>
				<p>
					Not a member yet ?
					<a href="studentSignUpPage.jsp"><img src="images/register.png" width="65" height="65"></a>
				</p>
			</form>
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