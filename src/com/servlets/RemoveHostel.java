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

@WebServlet("/RemoveHostel")
public class RemoveHostel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveHostel() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
			String hostelName=(String) session.getAttribute("hostel");
			Connection con;
			int roomNo=0,allotedBeds = 0;
			try
			{
				con=DBConnect.getConnection();
				Statement st=con.createStatement();
				String sql1="delete from Hostel where hostelName='"+hostelName+"'";
				String sql2="delete from AllotedApplications where hostelName='"+hostelName+"' and Profile.email=AllotedApplication.email";
				String sql3="delete from ApplicationForms where hostelName='"+hostelName+"'and Profile.email=ApplicationForms.email and Hostel.hostelName=AppliactionForms.hostelName";
				String sql4="delete from Room where hostelName='"+hostelName+"' and Hostel.hostelName=Room.hostelName";
				String sql5="delete from RoomStudents where hostelName='"+hostelName+"'Profile.email=RoomStudents.email and Hostel.hostelName=RoomStudents.hostelName'";
				st.executeUpdate(sql1);
				st.executeUpdate(sql2);
				st.executeUpdate(sql3);
				st.executeUpdate(sql4);
				st.executeUpdate(sql5);
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