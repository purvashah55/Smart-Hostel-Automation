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
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/AddRoom")
public class AddRoom extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
       public AddRoom() {
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
		
		String hostelName=request.getParameter("hostelName");
		String roomNo=request.getParameter("roomNo");
		String noOfbeds=request.getParameter("beds");
		String price = null;
		PrintWriter out=response.getWriter();
		try
		{
			Connection con=DBConnect.getConnection();
			Statement st=con.createStatement();
			String sql="insert into Room values(?,?,?,?,?)";
			String sql2="select * from Room where hostelName=? and roomNo=?";
			String sql3="select * from Hostel where hostelName='"+hostelName+"'";
			PreparedStatement stmt1=(PreparedStatement) con.prepareStatement(sql2);
			ResultSet rs3=st.executeQuery(sql3);
			if(rs3.next())
			{
				if(noOfbeds.equals("2"))
				{
					price=rs3.getString(7);
				}
				else if(noOfbeds.equals("3"))
				{
					price=rs3.getString(8);
				}
				else
				{
					price=rs3.getString(9);
				}
			}
			stmt1.setString(1,hostelName);
			stmt1.setString(2,roomNo);
		//	stmt1.setString(3,price);
		//	stmt1.setString(4,noOfbeds);	
			ResultSet rs=stmt1.executeQuery();
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
				rd.include(request, response);
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println("alert(\"Room already exists! \")");
				out.println("</SCRIPT>");
			}
			else
			{
				PreparedStatement stmt=(PreparedStatement) con.prepareStatement(sql);
				stmt.setString(1,hostelName);
				stmt.setString(2,roomNo);
				stmt.setString(3,price);
				stmt.setString(4,noOfbeds);	
				stmt.setInt(5,0);	
				stmt.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
				rd.include(request, response);
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println("alert(\"Room added successfully! \")");
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