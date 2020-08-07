<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="com.beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Room Table Page</title>
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
			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
								<%	String hostelName=(String) session.getAttribute("hostel"); %>
								<h1 align="center"><%= hostelName %></h1>
								<table border="2" align="center" cellpadding="5" cellspacing="5">
									<tr style="border-width:1px;padding:8px;border-style:solid;border-color:#666666;">
										<td>Room NO</td>
										<td>Price</td>
										<td>No Of Beds</td>
										<td>Alloted Beds</td>
										<td>Students</td>
									</tr>

									<%
										try
										{
											Connection connection = DBConnect.getConnection();
											Statement stmt=connection.createStatement();
		
											String sql="select * from Room where hostelName='"+hostelName+"'";
											String sql2="select * from RoomStudents where hostelName=? and roomNo=?";
		
											ResultSet rs=stmt.executeQuery(sql);
		
											while(rs.next())
											{
									%>
									<%
												int value=rs.getInt(2);
												String v=Integer.toString(value);
												PreparedStatement stmt1=(PreparedStatement) connection.prepareStatement(sql2);
												stmt1.setString(1,hostelName);
												stmt1.setString(2,v);
												ResultSet rs1=stmt1.executeQuery();
									%>
									<tr>
											<td><%= rs.getInt(2) %></td>
											<td><%= rs.getInt(3) %></td>
											<td><%= rs.getInt(4) %></td>
											<td><%= rs.getInt(5) %></td>	
											<%
												while(rs1.next())
												{
											%>				 
													<td><a href="roomTableHandler.jsp?id=<%= rs1.getString(5)%>"><%= rs1.getString(3)+" "+rs1.getString(4) %></a></td><br>
											<% 		
												}
											%>			
									</tr>
								<% 		
										}		
									}
									catch(Exception e)
									{	
									}
								%>
							</table>
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
</body>
</html>