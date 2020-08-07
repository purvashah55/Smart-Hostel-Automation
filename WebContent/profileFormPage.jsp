<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile Form </title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<% Student studentLoginDetails=(Student)session.getAttribute("studentLoginDetails"); %>
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
						<div class="body">
							<h1 align="center">Create Profile</h1><br><br>
							<form name="form2" action="ProfileFormPageHandler" method="post" onsubmit="return Validate()" style="border-color:  #316e66;border-style: outset;border-width: 5px">
								<table align="center" border="0" cellpadding="5" cellspacing="5" ><br><br>
									<tr>
										<td>Name</td>
										<td><input required="required" type="text" placeholder="First Name" value='<%=studentLoginDetails.getFirstName()%>' name="firstName" readonly/></td>
										<td><input required="required" type="text" placeholder="Middle Name" value='<%=studentLoginDetails.getMiddleName()%>'name="middleName" readonly/></td>
										<td><input required="required" type="text" placeholder="Last Name" value='<%=studentLoginDetails.getLastName()%>'name="lastName" readonly/></td>
									</tr>
									<tr>
										<td>Age</td>
										<td><input type="number" min="15" max="45" value="15" requred="required" onkeydown="return false" name="age"/></td>
									</tr>
									<tr>
										<td>Sex</td>
										<td><input type="radio" checked name="sex" value="male">Male</td>
										<td><input type="radio" name="sex" value="female">Female</td>		
									</tr>
									<tr>
										<td>Date Of Birth</td>
										<td><input type="text"required="required" name="dateOfBirth" placeholder="DD/MM/YYYY"></td>
									</tr>
									<tr>
										<td>Mobile No</td>
										<td><input required="required" type="text" name="phoneNo" size="20"></td>
										<td align="right">Email address</td>
										<td><input required="required" type="text" placeholder="abcd@gmail.com" value='<%=studentLoginDetails.getStudentUserName()%>'name="email" readonly/></td>
									</tr>
									<tr>
										<td>Nationality</td>
										<td><input required="required" type="text" placeholder="eg.Indian" name="nationality"/></td>
									</tr>
									<tr>
										<td>Permanant Address</td>
										<td><textarea required="required" rows="4" cols="20" name="address"></textarea></td>
									</tr>
									<tr>
										<td>City</td>
										<td>
											<select name="city">
												<option value="pune">Pune</option>
												<option value="mumbai">Mumbai</option>
												<option value="satara">Satara</option>				
											</select>
										</td>
										<td align="right">Pin code</td>
										<td><input required="required" type="text" name="pincode"/></td>
									</tr>
									<tr>
										<td>Course</td>
										<td><input required="required" type="text" name="course" placeholder="eg.Computer Engineering"/> </td>
										<td align="right">Course year</td>
										<td><input required="required" type="number" name="courseYear" value="1" min="1" max="5" onkeydown="return false"/> </td>
									</tr>
									<tr>
										<td>College Name</td>
										<td><input required="required" type="text" placeholder="college name" name="college"/></td>
									</tr>
									<tr>
										<td>Parents Name</td>
										<td><input required="required" type="text" placeholder="First Name"  value='<%=studentLoginDetails.getMiddleName()%>' name="parentsFirstName" readonly/></td>
										<td><input required="required" type="text" placeholder="Last Name" value='<%=studentLoginDetails.getLastName()%>' name="parentsLastName" readonly/></td>
									</tr>
									<tr>
										<td>Occupation</td>
										<td><input required="required" type="text" placeholder="Occupation" name="occupation"/></td>				
									</tr>
									<tr>
										<td>Mobile No</td>
										<td><input required="required" type="text" name="parentsPhoneNo"></td>
									</tr>
								</table><br><br>	
								<p align="center">
										<input type="submit"  value="submit" style="background-color:#316e66; color:white;  padding:15px 32px; font-size:16px">
								</p>							
							</form>
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
                	var mobileNo=document.forms["form2"]["phoneNo"]
                	var parentsMobileNo=document.forms["form2"]["parentsPhoneNo"]
                	var pincode=document.forms["form2"]["pincode"]
                	
                	var phoneFormat=/^\d{10}$/;
                	var pinFormat=/^\d{6}$/;
                	
                    if (mobileNo.value.match(phoneFormat) && parentsMobileNo.value.match(phoneFormat))
                     {
                    	 mobileNo.focus()
                     }
                    else
                     {
                         alert("You have entered an invalid mobile number!")
                         return (false)
                     }  
                    if (pincode.value.match(pinFormat))
                    {
                   		 pincode.focus()
                    }
                    else
                    {
                    	 alert("You have entered an invalid pin code!")
                  	     return (false)
                    }  
                	 return (true)
                }
                
                // --> 
  </SCRIPT>

</body>
</html>