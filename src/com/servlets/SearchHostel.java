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

@WebServlet("/SearchHostel")
public class SearchHostel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SearchHostel() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		    PrintWriter out=response.getWriter();
		    Connection con=null;
		    try
		    {
		    	con=DBConnect.getConnection();
		    	Statement st=con.createStatement();
		    	String hostelArea=request.getParameter("search");
                                String sql1="create or replace view new_view as hostelName,hostelAddress,hostelCity,messFacility,phoneNo from Hostel  where hostelArea='"+hostelArea+"'";
                                st.executeQuery(sql1);
				String sql="select * from new_view";
				ResultSet rs=st.executeQuery(sql);
		 	    RequestDispatcher rd=request.getRequestDispatcher("searchedHostelsPage.jsp");
				rd.forward(request, response);
				
		 	    con.close();
		 	    System.out.println("Connection closed");
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