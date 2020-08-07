<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.beans.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<%	String hostelName=(String) session.getAttribute("hostel"); 
	Connection con=DBConnect.getConnection();
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
				<h1 align="center">APPLICATION FORM</h1> 
			<FORM NAME="form1" ACTION="viewFormsPage.jsp" METHOD="POST" onsubmit="submitButton.disabled=true;return true;" style="border-color:  #316e66;border-style: outset;border-width: 5px">           
          <%
         	 int current = 1;
             if(request.getParameter("hidden") != null) 
             {          
            	 current = Integer.parseInt(request.getParameter("hidden"));
             }
             String url="jdbc:mysql://localhost:3306/hostel_management_system";
             Connection connection = DriverManager.getConnection(url,"root","root");
             Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
             ResultSet rs = statement.executeQuery("select * from ApplicationForms where hostelName='"+hostelName+"'"); 
             if(!rs.next())
             {
            	 RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
				 rd.include(request,response);
             }
             if(current < 1)
             {
                  current = 1;
             }
             rs.last();
             int rows = rs.getRow();
             if(current <= rows)
             {
                 rs.absolute(current);
             }      
         %>
         <%
         	String email=rs.getString(4);
       	    Statement st=connection.createStatement();
       	    ResultSet rs1=st.executeQuery("select * from Profile where email='"+email+"'");
       	    if(rs1.next())
       	    {
         %>
   
         		 <table align="center" border="0" cellpadding="5" cellspacing="5" bgcolor="">
					<tr>
						<td>Name</td>
						<td><input required="required" type="text" placeholder="First Name" value='<%= rs1.getString(1) %>' name="firstName" readonly/></td>
						<td><input required="required" type="text" placeholder="Middle Name" value='<%= rs1.getString(2) %>'name="middleName" readonly/></td>
						<td><input required="required" type="text" placeholder="Last Name" value='<%= rs1.getString(3) %>'name="lastName" readonly/></td>
					</tr>
					<tr>
						<td>Age</td>
						<td><input type="number" min="15" max="45"  requred="required" onkeydown="return false" name="age" value='<%= rs1.getString(4) %>' readonly/></td>
					</tr>
					<tr>
						<td>Sex</td>
						<td><input type="text" name="sex" value='<%= rs1.getString(5) %>' readonly></td>
					</tr>
					<tr>
						<td>Date Of Birth</td>
						<td><input type="text" name="dateOfBirth" placeholder="DD/MM/YYYY" value='<%= rs1.getString(6) %>' readonly></td>
					</tr>
					<tr>
						<td>Mobile No</td>
						<td><input type="text" name="phoneNo" onkeypress="return isNumber(event)"  size="10" value='<%= rs1.getString(7) %>' readonly/></td>
						<td align="right">Email address</td>
						<td><input required="required" type="text" placeholder="abcd@gmail.com" value='<%= rs1.getString(8) %>'name="email" readonly/></td>
					</tr>
					<tr>
						<td>Nationality</td>
						<td><input required="required" type="text" placeholder="eg.Indian" name="nationality" value='<%= rs1.getString(9) %>' readonly/></td>
					</tr>
					<tr>
						<td>Permanant Address</td>
						<td><textarea required="required" rows="4" cols="15" name="address" readonly><%= rs1.getString(10) %></textarea></td>
					</tr>
					<tr>
						<td>City</td>
						<td><input required="required" type="text" placeholder="eg.Pune " name="city" value='<%= rs1.getString(11) %>' readonly/></td>
						<td>Pin code</td>
						<td><input required="required" type="text" name="pincode" value='<%= rs1.getString(12) %>' readonly/></td>
					</tr>
					<tr>
						<td>Course</td>
						<td><input required="required" type="text" name="course" placeholder="eg.Computer Engineering" value='<%= rs1.getString(13) %>' readonly/> </td>
						<td align="right">Course year</td>
						<td><input required="required" type="number" name="courseYear" min="1" max="5" onkeydown="return false" value='<%= rs1.getString(14) %>' readonly/> </td>
					</tr>
					<tr>
						<td>College Name</td>
						<td><input required="required" type="text" placeholder="college name" name="college" value='<%= rs1.getString(15) %>' readonly/></td>
					</tr>
					<tr>
						<td>Parents Name</td>
						<td><input required="required" type="text" placeholder="First Name" name="parentsFirstName" value='<%= rs1.getString(16) %>' readonly/></td>
						<td><input required="required" type="text" placeholder="Last Name" name="parentsLastName" value='<%= rs1.getString(17) %>' readonly/></td>
					</tr>
					<tr>
						<td>Occupation</td>
						<td><input required="required" type="text" placeholder="Occupation" name="occupation" value='<%= rs1.getString(18) %>' readonly/></td>				
						<td align="right">Mobile No</td>
						<td><input type="text" name="parentsPhoneNo" size="10" value='<%= rs1.getString(19) %>' readonly/></td>
				    </tr>
				    <tr>			
						<td>Hostel Name that you want to apply</td>
						<td><input required="required" type="text" placeholder="Hostel name" name="hostelName" value='<%= rs.getString(5) %>' readonly/></td>								
					</tr>
					<tr>
						<td>Do you want mess facility? </td>
						<td><input required="required" type="text" placeholder="mess facility" name="messFacility" value='<%= rs.getString(6) %>' readonly/></td>				
					</tr>	
				 </table> 
         <%
       	    }
         %>
         		 <BR>
          		  <p align="center">
            			<INPUT TYPE="HIDDEN" NAME="hidden" VALUE="<%= current %>"/>
            			<INPUT TYPE="BUTTON" VALUE="&laquo Previous" ONCLICK="movePrevious()" style="background-color:#f1f1f1; color:black;padding: 12px 20px;"/>
     	        		<input type="submit" name="submitButton" value="Allot" formaction="AllotRoom" style="background-color:#f44336;padding: 12px 20px;"/>   
        	   			 <INPUT TYPE="BUTTON" VALUE="Next &raquo" ONCLICK="moveNext()" style="background-color:#4CAF50; color:white;padding: 12px 20px;"/>           	
           		 </p>  
          </FORM>
  
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
</div>
	
	     <SCRIPT LANGUAGE="JavaScript">
                <!--
                function moveNext()
                {
                    var counter = 0
              counter = parseInt(document.form1.hidden.value) + 1
                    document.form1.hidden.value = counter
                    form1.submit()
                }    
                function movePrevious()
                {
                    var counter = 0
                    counter = parseInt(document.form1.hidden.value) - 1
                    document.form1.hidden.value = counter
                    form1.submit()
                }      
                // --> 
            </SCRIPT>
	
</body>
</html>