package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminLogout")
public class AdminLogout extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
  
    public AdminLogout() 
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
		request.getRequestDispatcher("hostelLoginPage.jsp").include(request, response);
		out.println("<h3>You are successfully logged out!!</h3>");
		request.getSession().invalidate();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
