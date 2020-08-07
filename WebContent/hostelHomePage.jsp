<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hostel Home Page</title>
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
			<br><br>
			<div id="contents" align="center">
					<div>
								<img src="images/welcome.gif" width="350" height="190" align="middle"><br>
								<a href='hostelProfileFormPage.jsp'><img src="images/profile.png" width="125" height="112"></a><br>
								<a href='viewFormsPage.jsp'><img src="images/application-form.jpg" width="125" height="112"></a><br><br>
								<a href='addRoomDetailsPage.jsp'><img src="images/addroom.jpeg" width="125" height="112"><br>Add Room</a><br><br>
								<a href='roomTablePage.jsp'><img src="images/roommanager.png" width="125" height="112"><br>Room Manager</a><br><br>
								<a href='shiftStudentPage.jsp'><img src="images/shiftstud.png" width="125" height="112"><br>Shift student</a><br><br>
								<a href="ChartServlet"><img src="images/analysis.jpg" width="125" height="112"></a><br><br>
								<a href='FeedbackPieChart'><img src="images/feedanalysis.jpeg" width="125" height="112"><br>Feedback Analysis</a><br><br>	
								<a href='RemoveHostel'><img src="images/leave.png" width="125" heigth="112"><br>Remove your hostel from forum</a><br><br><br>
								<a href='StudentLogout'><img src="images/logout.jpg" width="125" height="112"></a>	
					</div>
				
				</div>		
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