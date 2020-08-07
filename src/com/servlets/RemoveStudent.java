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
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/RemoveStudent")
public class RemoveStudent extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public RemoveStudent() 
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
	//	out.println("Inside remove student");
		String email=request.getParameter("email");
		HttpSession session=request.getSession();
		String hostelName=(String) session.getAttribute("hostel");
//		out.println(email);
		Connection con;
		int roomNo=0,allotedBeds = 0;
		try
		{
			con=DBConnect.getConnection();
			Statement st=con.createStatement();
			String sql="delete from AllotedApplications where hostelName='"+hostelName+"' and email='"+email+"'and Profile.email=AllotedApplication.email'";
			String sql2="select * from RoomStudents where email='"+email+"' and Profile.email=RoomStudents.email and Hostel.hostelName=RoomStudents.hostelName'";
			String sql3="delete from RoomStudents where email='"+email+"' and Profile.email=RoomStudents.email and Hostel.hostelName=RoomStudents.hostelName'";
			String sql4="select * from Room where roomNo=? and hostelName=?";
			String sql5="update Room set allotedBeds=? where roomNo=? and hostelName=? and Hostel.hostelName=Room.hostelName";
			PreparedStatement stmt1=(PreparedStatement) con.prepareStatement(sql5);
			PreparedStatement stmt2=(PreparedStatement) con.prepareStatement(sql4);
			st.executeUpdate(sql);
			ResultSet rs=st.executeQuery(sql2);
			if(rs.next())
			{
				roomNo=rs.getInt(2);			
				stmt2.setInt(1,roomNo);
				stmt2.setString(2,hostelName);
				ResultSet rs1=stmt2.executeQuery();
				if(rs1.next())
				{
					allotedBeds=rs1.getInt(5);
					out.println(allotedBeds);
					allotedBeds=allotedBeds-1;
					stmt1.setInt(1,allotedBeds);
					stmt1.setInt(2,roomNo);
					stmt1.setString(3,hostelName);
					stmt1.executeUpdate();
					st.executeUpdate(sql3);
					RequestDispatcher rd=request.getRequestDispatcher("roomTablePage.jsp");
					rd.forward(request, response);
				}
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