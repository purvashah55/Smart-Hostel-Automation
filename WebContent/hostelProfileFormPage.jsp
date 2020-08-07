<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hostel Profile Form</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<% 		
		String hostelName=(String) session.getAttribute("hostel");
		Connection con=DBConnect.getConnection();
		Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String sql1="select * from Hostel where hostelName='"+hostelName+"'";
		ResultSet rs=st.executeQuery(sql1);
		rs.last();
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
				<div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1 align="center">Hostel Profile</h1><br><br>
							<form name="form2" action="HostelProfileHandler" method="post" onsubmit="return Validate()" style="border-color:  #316e66;border-style: outset;border-width: 5px">
								<table align="center" border="0" cellpadding="5" cellspacing="5" ><br><br>
									<tr>
										<td>Hostel Name </td>
										<td><input required="required" type="text"  name="hostelName" value='<%= rs.getString(1) %>' readonly/></td>								
									</tr>
									<tr>
										<td>Hostel Area</td>
										<td><input required="required" type="text"  name="hostelArea" value='<%= rs.getString(3) %>'/></td>																		
									</tr>
									<tr>
										<td>Hostel Address</td>
										<td><textarea required="required" rows="4" cols="20" name="hostelAddress"> <%= rs.getString(4) %> </textarea></td>									</tr>
									<tr>
										<td>Hostel City</td>
										<td><input required="required" type="text"  name="hostelCity" value='<%= rs.getString(5) %>'/></td>																		
									</tr>
									<tr>
										<td>Mess Facility</td>
										<td>
											<select name="messFacility">
												<option  value='<%= rs.getString(6) %>'><%= rs.getString(6) %>
												<option value="Yes">Yes</option>	
												<option value="No">No</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>Fee for room with 2 beds</td>
										<td><input required="required" type="text"  name="2BedFees" value='<%= rs.getString(7) %>' /></td>																			
									</tr>
									<tr>
										<td>Fee for room with 3 beds</td>
										<td><input required="required" type="text"  name="3BedFees" value='<%= rs.getString(8) %>' /></td>																			
									</tr>
									<tr>
										<td>Fee for room with 4 beds</td>
										<td><input required="required" type="text"  name="4BedFees" value='<%= rs.getString(9) %>' /></td>																			
									</tr>
									<tr>
										<td>Mobile number</td>
										<td><input required="required" type="text"  name="phoneNo" value='<%= rs.getString(10) %>' /></td>																			
									</tr>
									<tr>
										<td>Hostel Type</td>
										<td><input required="required" type="text"  name="hostelType" value='<%= rs.getString(11) %>' readonly/></td>																																	
									</tr>
								</table><br><br>	
								<p align="center">
										<input type="submit"  value="update" style="background-color:#316e66; color:white;  padding:15px 32px; font-size:16px">
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
                	
                	var phoneFormat=/^\d{10}$/;
                	
                    if (mobileNo.value.match(phoneFormat) && parentsMobileNo.value.match(phoneFormat))
                     {
                    	 mobileNo.focus()
                     }
                    else
                     {
                         alert("You have entered an invalid mobile number!")
                         return (false)
                     }  
                    return (true)
                }
                
                // --> 
  </SCRIPT>
	
</body>
</html>