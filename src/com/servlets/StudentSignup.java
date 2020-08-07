package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.DBConnect;
import com.beans.Student;

@WebServlet("/StudentSignup")
public class StudentSignup extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public StudentSignup() 
    {
        super();
    }

	public void init(ServletConfig config) throws ServletException 
	{
	}

	public void destroy() 
	{
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			Student studentSignupDetails=(Student) request.getAttribute("studentSignupDetails");
			Connection con=null;
			PrintWriter out=response.getWriter();
			String sql="select * from Student_Login where stud_username='"+studentSignupDetails.getStudentUserName()+"'";
			String sql2="insert into Student_Login values('"+studentSignupDetails.getFirstName()+"','"+studentSignupDetails.getMiddleName()+"','"+studentSignupDetails.getLastName()+"','"+studentSignupDetails.getStudentUserName()+"','"+studentSignupDetails.getStudentPassword()+"')";
		    try
		    {
		    	con=DBConnect.getConnection();
		    	Statement st=con.createStatement();
		    	ResultSet rs=st.executeQuery(sql);
		    	if(rs.next())
				{
					RequestDispatcher rd=request.getRequestDispatcher("studentSignUpPage.jsp");
					rd.include(request, response);
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("alert(\"The user already exists! Please try to retrive password! \")");
					out.println("</SCRIPT>");
				//	out.println("<font color='red'>The user already exists!<br>Please try to retrive password</font>");
				}
				else 
				{								
					st.executeUpdate(sql2);
					RequestDispatcher rd=request.getRequestDispatcher("studentLoginPage.jsp");
					rd.include(request, response);
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("alert(\"You have registered successfully! \")");
					out.println("</SCRIPT>");
				//	out.println("<h3>You have registered successfully");
				}
		    	con.close();
		    }
		    catch(Exception e)
		    {   
		    }
		    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
