package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public AdminLogin() 
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
		String u=request.getParameter("adminUserName");
		String p=request.getParameter("adminPassword");
		PrintWriter out=response.getWriter();
		Connection con;
		try
		{
			con=DBConnect.getConnection();
			Statement st=con.createStatement();
			String sql="select * from Hostel where hostelName='"+u+"' and hostelPassword='"+p+"'";
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
			{
				HttpSession session=request.getSession();
				session.setAttribute("hostel",u);
				RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("hostelLoginPage.jsp");
				rd.include(request, response);
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println("alert(\"Invalid user name or password! \")");
				out.println("</SCRIPT>");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
