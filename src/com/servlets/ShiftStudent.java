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

@WebServlet("/ShiftStudent")
public class ShiftStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShiftStudent() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String roomToAllot=request.getParameter("roomNo");
		HttpSession session=request.getSession();
		String hostelName=(String) session.getAttribute("hostel");
		Connection con;
		int roomNo=0,allotedBeds = 0,allotedBeds2=0;
		try
		{
			con=DBConnect.getConnection();
			Statement st=con.createStatement();
			
			String sql1="select roomNo from RoomStudents where email='"+email+"'";
			String sql2="select * from Room where roomNo=? and hostelName=?";	
			String sql3="update Room set allotedBeds=? where roomNo=?" ;
			String sql4="update RoomStudents set roomNo=? where email=?";
			String sql5="select * from RoomStudents where email='"+email+"'";
			PreparedStatement stmt1=(PreparedStatement) con.prepareStatement(sql2);
			PreparedStatement stmt2=(PreparedStatement) con.prepareStatement(sql3);
			PreparedStatement stmt3=(PreparedStatement) con.prepareStatement(sql4);
			ResultSet rs4=st.executeQuery(sql5);
			if(rs4.next())
			{
				if(rs4.getInt(7)!=0)
				{
					RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
					rd.include(request, response);
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("alert(\"Student had already paid for this room So can't be shifted! \")");
					out.println("</SCRIPT>");
				}
				else
				{
					ResultSet rs1=st.executeQuery(sql1);
					
					if(rs1.next())
					{
						roomNo=rs1.getInt(1);
						if(rs1.getString(1).equals(roomToAllot))
						{
							RequestDispatcher rd=request.getRequestDispatcher("shiftStudentPage.jsp");
							rd.include(request, response);
							out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
							out.println("alert(\"Entered room is already alloted to this student! \")");
							out.println("</SCRIPT>");
						}			
						else
						{
							stmt1.setString(1,roomToAllot);
							stmt1.setString(2,hostelName);
							ResultSet rs2=stmt1.executeQuery();
							if(rs2.next())
							{
								allotedBeds2=rs2.getInt(5);
								if(rs2.getInt(5) < rs2.getInt(4))
								{
									stmt1.setInt(1,roomNo);
									stmt1.setString(2,hostelName);
									ResultSet rs3=stmt1.executeQuery();
									if(rs3.next())
									{
									allotedBeds=rs3.getInt(5);							
									allotedBeds--;
									stmt2.setInt(1,allotedBeds);
									stmt2.setInt(2,roomNo);
									stmt2.executeUpdate();
									allotedBeds2++;
									stmt2.setInt(1,allotedBeds2);
									stmt2.setString(2,roomToAllot);
									stmt2.executeUpdate();
									stmt3.setString(1,roomToAllot);
									stmt3.setString(2,email);
									stmt3.executeUpdate();
									RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
									rd.include(request, response);
									out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
									out.println("alert(\"Room shifted successfully! \")");
									out.println("</SCRIPT>");
									}
								}	
								else
								{
									RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
									rd.include(request, response);
									out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
									out.println("alert(\"No sufficient beds! \")");
									out.println("</SCRIPT>");
								}
							}
							
						}
					}
				}
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
