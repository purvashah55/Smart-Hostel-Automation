package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentLogout")
public class StudentLogout extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
  
    public StudentLogout() 
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
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		request.getRequestDispatcher("studentLoginPage.jsp").include(request, response);
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println("alert(\"You are successfully logged out! \")");
		out.println("</SCRIPT>");
		request.getSession().invalidate();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
