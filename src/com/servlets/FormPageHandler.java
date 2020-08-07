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

@WebServlet("/FormPageHandler")
public class FormPageHandler extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public FormPageHandler() {
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
	    Connection con=null;
	    try
	    {
	    	HttpSession session=request.getSession();
	    	con=DBConnect.getConnection();
	    	Statement st=con.createStatement();
	    	Student s=(Student)session.getAttribute("studentLoginDetails");
	    	String sql1="select * from ApplicationForms where email='"+s.getStudentUserName()+"' and hostelName='"+request.getParameter("hostelName")+"'";
	    	String sql2="insert into ApplicationForms values(?,?,?,?,?,?)";
	    	ResultSet rs=st.executeQuery(sql1);
	    	if(rs.next())
	    	{
	    		RequestDispatcher rd=request.getRequestDispatcher("hostelApplicationForm.jsp");
				rd.include(request,response);
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println("alert(\"You have already submitted the form for this hostel! \")");
				out.println("</SCRIPT>");
	    	}
	    	else
	    	{
	    		PreparedStatement stmt=(PreparedStatement) con.prepareStatement(sql2);
	    		stmt.setString(1,request.getParameter("firstName"));
	    		stmt.setString(2,request.getParameter("middleName"));
	    		stmt.setString(3,request.getParameter("lastName"));
	    		stmt.setString(4,request.getParameter("email"));
	    		stmt.setString(5,request.getParameter("hostelName"));
	    		stmt.setString(6,request.getParameter("messFacility"));
	    		stmt.executeUpdate();
	    		RequestDispatcher rd=request.getRequestDispatcher("studentHomePage.jsp");
	    		rd.include(request,response);
	    		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println("alert(\"Your form submittted successfully...! \")");
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
