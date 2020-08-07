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
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/FormDirector")
public class FormDirector extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public FormDirector()
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
	    PrintWriter out=response.getWriter();
		 try
		 {
		    	HttpSession session=request.getSession();
		    	Connection con=DBConnect.getConnection();
		    	Statement st=con.createStatement();
		    	Student s=(Student)session.getAttribute("studentLoginDetails");
		    	String sql2="select * from AllotedApplications where email='"+s.getStudentUserName()+"'";
		    	ResultSet rs1=st.executeQuery(sql2);
		    	if(rs1.next())
		    	{
		    		RequestDispatcher rd=request.getRequestDispatcher("studentHomePage.jsp");
					rd.include(request, response);
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("alert(\"Hostel is already alloted for you! \")");
					out.println("</SCRIPT>");
		    	}
		    	else
		    	{
			    	RequestDispatcher rd=request.getRequestDispatcher("hostelApplicationForm.jsp");
					rd.forward(request, response);
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