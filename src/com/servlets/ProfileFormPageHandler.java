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

@WebServlet("/ProfileFormPageHandler")
public class ProfileFormPageHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ProfileFormPageHandler() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		  PrintWriter out=response.getWriter();
		  Connection con=null;
		    try
		    {
		    	HttpSession session=request.getSession();
		    	con=DBConnect.getConnection();
		    	Statement st=con.createStatement();
		    	Student s=(Student)session.getAttribute("studentLoginDetails");
		    	String sql1="insert into Profile values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		    		PreparedStatement stmt=(PreparedStatement) con.prepareStatement(sql1);
		    		stmt.setString(1,request.getParameter("firstName"));
		    		stmt.setString(2,request.getParameter("middleName"));
		    		stmt.setString(3,request.getParameter("lastName"));
		    		stmt.setString(4,request.getParameter("age"));
		    		stmt.setString(5,request.getParameter("sex"));
		    		stmt.setString(6,request.getParameter("dateOfBirth"));
		    		stmt.setString(7,request.getParameter("phoneNo"));
		    		stmt.setString(8,request.getParameter("email"));
		    		stmt.setString(9,request.getParameter("nationality"));
		    		stmt.setString(10,request.getParameter("address"));
		    		stmt.setString(11,request.getParameter("city"));
		    		stmt.setString(12,request.getParameter("pincode"));
		    		stmt.setString(13,request.getParameter("course"));
		    		stmt.setString(14,request.getParameter("courseYear"));
		    		stmt.setString(15,request.getParameter("college"));
		    		stmt.setString(16,request.getParameter("parentsFirstName"));
		    		stmt.setString(17,request.getParameter("parentsLastName"));
		    		stmt.setString(18,request.getParameter("occupation"));
		    		stmt.setString(19,request.getParameter("parentsPhoneNo"));
		    		stmt.executeUpdate();
		    		RequestDispatcher rd=request.getRequestDispatcher("studentHomePage.jsp");
					rd.include(request, response);
		 	    con.close();
		 	    System.out.println("Connection closed");
		    }
		    catch(Exception e)
		    {   
		    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
