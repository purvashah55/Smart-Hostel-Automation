package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.DBConnect;
import com.beans.Student;

@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public StudentLogin() 
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
	    Student studentLoginDetails=(Student) request.getAttribute("studentLoginDetails");
	    PrintWriter out=response.getWriter();
	    Connection con=null;
	    try
	    {
	    	con=DBConnect.getConnection();
	    	Statement st=con.createStatement();
			String sql="select * from Student_Login where stud_username='"+studentLoginDetails.getStudentUserName()+"' and stud_password='"+studentLoginDetails.getStudentPassword()+"'";
			ResultSet rs=st.executeQuery(sql);
	 	    if(rs.next())
	 	    {
	 	    	HttpSession session=request.getSession();
				studentLoginDetails.setFirstName(rs.getString(1));
				studentLoginDetails.setMiddleName(rs.getString(2));
				studentLoginDetails.setLastName(rs.getString(3));
				session.setAttribute("studentLoginDetails",studentLoginDetails);
				RequestDispatcher rd=request.getRequestDispatcher("PageDirector");
				rd.forward(request, response);
	 	    }
	 	    else
	 	    {
	 	    	RequestDispatcher rd=request.getRequestDispatcher("studentLoginPage.jsp");
				rd.include(request, response);
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println("alert(\"Invalid user name or password! \")");
				out.println("</SCRIPT>");
	 	    }
	 	    con.close();
	 	    System.out.println("Connection closed");
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
