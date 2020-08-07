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

import com.beans.DBConnect;
import com.beans.Student;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/PageDirector")
public class PageDirector extends HttpServlet 
{	
	private static final long serialVersionUID = 1L;
       
    public PageDirector() {
        super();
    }
    
	public void init(ServletConfig config) throws ServletException {
	}
	
	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Student studentLoginDetails=(Student) request.getAttribute("studentLoginDetails");
		PrintWriter out=response.getWriter();
		try
		{
			Connection con=DBConnect.getConnection();
			Statement st=con.createStatement();
			String sql="insert into Room values(?,?,?,?,?)";
			String sql1="select * from Profile where email='"+studentLoginDetails.getStudentUserName()+"'";
			ResultSet rs=st.executeQuery(sql1);
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("studentHomePage.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("profileFormPage.jsp");
				rd.forward(request, response);
			}			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
