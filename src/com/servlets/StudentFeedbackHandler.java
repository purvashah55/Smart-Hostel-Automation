package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.DBConnect;
import com.beans.Student;


@WebServlet("/StudentFeedbackHandler")
public class StudentFeedbackHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentFeedbackHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection con=null;
		PrintWriter out=response.getWriter();
		String req=request.getParameter("feedback");
		HttpSession session=request.getSession();
    	Student s=(Student)session.getAttribute("studentLoginDetails");
    	String email=s.getStudentUserName();
    	try
    	{
    		con=DBConnect.getConnection();
        	Statement st=con.createStatement();
        	String sql="update RoomStudents set feedback='"+req+"' where email='"+email+"'";
        	st.executeUpdate(sql);
        	request.getRequestDispatcher("studentHomePage.jsp").include(request, response);
    		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
    		out.println("alert(\"Your feedback updated successfully! \")");
    		out.println("</SCRIPT>");
    	}
    	catch(Exception e)
    	{
    		
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
