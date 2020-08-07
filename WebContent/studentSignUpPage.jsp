<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Sign Up </title>
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
			<div id="main" align="center">
			
			<div>
			<div>
			
	<form action="StudentSignup" name="form1" method="post" onsubmit="return Validate()"> 
				<h1  style="color: #316e66;font: 30px/30px " align="center"> Sign up </h1> 
				<p> 
					Student name
					<input required="required" type="text" name="firstName" placeholder="first"/>
					<input required="required" type="text" name="middleName" placeholder="middle"/> 
					<input required="required" type="text" name="lastName" placeholder="last"/>  
				</p>
				<p> 
					Your email id
					<input required="required" type="email" name="studentUserName" placeholder="mysuperusername690"/>
				</p>
				<p> 
					Your password
					<input required="required" type="password" name="studentPassword" placeholder="eg. X8df!90EO"/>
				</p>
				<p> 
					Please confirm your password
					<input required="required" type="password" name="studentConfirmPassword"placeholder="eg. X8df!90EO"/>
				</p>
				<p> 
					<input type="submit" value="Sign up" style="height: 26px;width: 60px;" /> 
				</p>
				<p>  
					Already a member ?
					<a href="studentLoginPage.jsp"> Go and log in </a>
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


  <SCRIPT LANGUAGE="JavaScript">
                <!--
         
                function Validate()
                {
                	var password=document.forms["form1"]["studentPassword"]
                	var confirmPassword=document.forms["form1"]["studentConfirmPassword"]
                	var mail=document.forms["form1"]["studentUserName"]
                	var mailformat=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    if (mail.value.match(mailformat))
                     {
                    	 mail.focus()
                     }
                    else
                     {
                       alert("You have entered an invalid email address!")
                       return (false)
                     }  
                	
                	 if (password.value.match(confirmPassword.value))
                     {
                		 password.focus()
                     }
                    else
                     {
                       alert("Password mismatch occured")    
                       return (false)
                     }  
                	 return (true)
                }
                
                // --> 
  </SCRIPT>

</body>
</html>