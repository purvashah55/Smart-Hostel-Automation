<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>HOSTEL MANAGMENET SYSTEM</title>
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
						<li class="selected">
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
			</div>
			<div id="contents">
				<div id="adbox">
					<img src="images/room.jpg" alt="Img" width="852" height="425">
					<h1>Enjoy the Experience with Us!</h1>
					<p>
						Many Students consider quality of life as one of the important factors while choosing a College/University. We provide you a decent stay and the best possible learning environment.The stay would certainly provide a wealth of experience by developing qualities such as comradeship and social responsibility.We provide service to the student for almost all corners of Maharashtra.
					</p>
					<p>
					   Want to enjoy the wonderful experience need to now how to join us then<a href="contact.jsp"><img src="images/click.gif" width="60" height="50"></a>
					 </p>
				</div>
				<div id="main">
					<div class="box">
						<div>
							<div>
								<h3>Latest Updates</h3>
										
									<a href="studentLoginPage.jsp"><font align="centre">Application Form 2018</font> <img  src="images/new.gif" width="50" height="50"></a>
							</div>
						</div>
					</div>
					
						<div>
							
						</div>
					
				</div>
				<div id="sidebar">
					<div class="section">
						<a href="rooms.html"><img src="images/rooms.png" alt="Img"></a>
					</div>
					<div class="section">
						<a href="studentLoginPage.jsp"><img src="images/joinus.jpg" width="285" height="144"></a>
					</div>
					<div class="section">
						<a href="foods.html"><img src="images/food.png" alt="Img"></a>
					</div>
				</div>
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
	</div>
</body>
</html>