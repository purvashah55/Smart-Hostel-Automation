package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
import javax.websocket.Session;

import com.beans.DBConnect;
import com.beans.Mailer;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/AllotRoom")
public class AllotRoom extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public AllotRoom() 
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
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
			String message;
			int flag=0;
			PrintWriter out=response.getWriter();
		    Connection con=null;
		    try
		    {
		    	con=DBConnect.getConnection();
//		    	Statement st=con.createStatement();
		    	HttpSession session=request.getSession();
		    	String hostelName=(String) session.getAttribute("hostel");
		    	String email=request.getParameter("email");
		    	
		    	String sql1="select * from Room where hostelName=? ";
		    	String sql2="insert into AllotedApplications values(?,?,?,?,?,?,?)";
		    	String sql3="delete from ApplicationForms where email=?";
		    	String sql4="update Room set allotedBeds=? where hostelName=? and roomNo=?";
		    	String sql5="insert into RoomStudents values(?,?,?,?,?,?,?,?,?)";
		    	
		    	PreparedStatement stmt1=(PreparedStatement) con.prepareStatement(sql1);
				stmt1.setString(1,hostelName);
				ResultSet rs=stmt1.executeQuery();
		    	
		    	while(rs.next())
		    	{
		    		
		    		if(rs.getInt(5) < rs.getInt(4))
					{		    			
		    			String roomNo=rs.getString(2);
		    	
						PreparedStatement stmt2=(PreparedStatement) con.prepareStatement(sql2);
//			    		response.getWriter().append("Served at: ").append(request.getContextPath());
						stmt2.setString(1,request.getParameter("firstName"));
			    		stmt2.setString(2,request.getParameter("middleName"));
			    		stmt2.setString(3,request.getParameter("lastName"));
			    		stmt2.setString(4,request.getParameter("email"));
			    		stmt2.setString(5,request.getParameter("hostelName"));
			    		stmt2.setString(6,request.getParameter("messFacility"));
			    		stmt2.setString(7,roomNo);
			    		stmt2.executeUpdate();
			    		
			    		PreparedStatement stmt3=(PreparedStatement) con.prepareStatement(sql3);
						stmt3.setString(1,request.getParameter("email"));
						stmt3.executeUpdate();
						
						PreparedStatement stmt4=(PreparedStatement) con.prepareStatement(sql4);
						int value=rs.getInt(5)+1;
						String v=Integer.toString(value);
						stmt4.setString(1,v);
						stmt4.setString(2,hostelName);
						stmt4.setString(3,roomNo);
						stmt4.executeUpdate();
								
						PreparedStatement stmt5=(PreparedStatement) con.prepareStatement(sql5);
						stmt5.setString(1,hostelName);
						stmt5.setString(2,roomNo);
						stmt5.setString(3,request.getParameter("firstName"));
						stmt5.setString(4,request.getParameter("lastName"));
						stmt5.setString(5,request.getParameter("email"));
						stmt5.setInt(6,rs.getInt(3));
						stmt5.setInt(7,0);
						stmt5.setInt(8,rs.getInt(3));
						stmt5.setString(9," ");
						stmt5.executeUpdate(); 
						
						RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
						rd.include(request, response);
						out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
						out.println("alert(\"Hostel alloted to student! \")");
						out.println("</SCRIPT>");
				       
						Mailer.send("hostelms9@gmail.com","hostelweb" ,email,"Hostel Allotment","Hostel is alloted for you. Please check details on website");
						flag=1;
						break;
					}	
		    	}
		    	if(flag!=1)
	    		{
		    		RequestDispatcher rd=request.getRequestDispatcher("hostelHomePage.jsp");
					rd.include(request, response);
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("alert(\"Room is not available at your hostel! \")");
					out.println("</SCRIPT>");
	    		}
		    	con.close();
		    }
		    catch(Exception e)
		    {   
		    }
		    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}