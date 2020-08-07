package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.DBConnect;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/ResetFee")
public class ResetFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetFee() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
	    Connection con=null;
		  int p,q,r,y,z;
		    try
		    {
		    	int totalFee=0;
		    	con=DBConnect.getConnection();
		    	Statement st=con.createStatement();
		    	String sql1="select totalFee from RoomStudents where email='"+email+"'";
				String sql2="update RoomStudents set paidFee=?,remainingFee=? where email=?";
	    		PreparedStatement stmt2=(PreparedStatement) con.prepareStatement(sql2);
		    	ResultSet rs1=st.executeQuery(sql1);
		    	if(rs1.next())
		    	{
		    		totalFee=rs1.getInt(1);
		    		stmt2.setInt(1,0);
		    		stmt2.setInt(2,totalFee);
		    		stmt2.setString(3,email);
		    		stmt2.executeUpdate();
		    	
		    		RequestDispatcher rd=request.getRequestDispatcher("roomTablePage.jsp");
		    		rd.include(request, response);
		    		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		    		out.println("alert(\"Fee Reset Successful! \")");
		    		out.println("</SCRIPT>");
		    	}
		    }
		    catch(Exception e)
		    {	
		    }
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
