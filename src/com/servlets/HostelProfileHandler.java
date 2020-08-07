package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

@WebServlet("/HostelProfileHandler")
public class HostelProfileHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HostelProfileHandler() {
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
		    	String sql1="update Hostel set hostelArea=?,hostelAddress=?,hostelCity=?,messFacility=?,2BedFees=?,3BedFees=?,4BedFees=?,phoneNo=? where hostelName=?";
		    		PreparedStatement stmt=(PreparedStatement) con.prepareStatement(sql1);
		    		stmt.setString(1,request.getParameter("hostelArea"));
		    		stmt.setString(2,request.getParameter("hostelAddress"));
		    		stmt.setString(3,request.getParameter("hostelCity"));
		    		stmt.setString(4,request.getParameter("messFacility"));
		    		stmt.setString(5,request.getParameter("2BedFees"));
		    		stmt.setString(6,request.getParameter("3BedFees"));
		    		stmt.setString(7,request.getParameter("4BedFees"));
		    		stmt.setString(8,request.getParameter("phoneNo"));
		    		stmt.setString(9,request.getParameter("hostelName"));
		    		stmt.executeUpdate();
		     		RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
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
