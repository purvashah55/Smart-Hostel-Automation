<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hostel Application Form</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<% 		
		String hostelType="";
		Student studentLoginDetails=(Student)session.getAttribute("studentLoginDetails");  		
		Connection con=DBConnect.getConnection();
		Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String sql2="select sex from Profile where email='"+studentLoginDetails.getStudentUserName()+"'";
		ResultSet rs2=st.executeQuery(sql2);
		if(rs2.next())
		{
			if(rs2.getString(1).equals("female"))
			{
				hostelType="Girls";
			}
			else
			{
				hostelType="Boys";
			}
		}
		String sql1="select * from Hostel where hostelType='"+hostelType+"'";
		ResultSet rs=st.executeQuery(sql1);
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
				<div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1 align="center">Hostel Application</h1><br><br>
							<form name="form2" action="FormPageHandler" method="post" onsubmit="return Validate()" style="border-color:  #316e66;border-style: outset;border-width: 5px">
								<table align="center" border="0" cellpadding="5" cellspacing="5" ><br><br>
									<tr>
										<td>Name</td>
										<td><input required="required" type="text" placeholder="First Name" value='<%=studentLoginDetails.getFirstName()%>' name="firstName" readonly/></td>
										<td><input required="required" type="text" placeholder="Middle Name" value='<%=studentLoginDetails.getMiddleName()%>'name="middleName" readonly/></td>
										<td><input required="required" type="text" placeholder="Last Name" value='<%=studentLoginDetails.getLastName()%>'name="lastName" readonly/></td>
									</tr>
									<tr>
										<td>Email address</td>
										<td><input required="required" type="text" placeholder="abcd@gmail.com" value='<%=studentLoginDetails.getStudentUserName()%>'name="email" readonly/></td>
									</tr>
									<tr>
										<td>Hostel name</td>
										<td>
											<select name="hostelName">
											<%while(rs.next())
												{
											%>
													<option  value='<%= rs.getString(1) %>'><%= rs.getString(1) %>
											<%
												}
											%>
										</select>
										</td>
									</tr>
									<tr>
										<td>Mess Facility</td>
										<td><input type="radio" checked name="messFacility" value="Yes">Yes</td>
										<td><input type="radio" name="messFacility" value="No">No</td>
									</tr>
								</table><br><br>	
								<p align="center">
										<input type="submit"  value="Submit" style="background-color:#316e66; color:white;  padding:15px 32px; font-size:16px">
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