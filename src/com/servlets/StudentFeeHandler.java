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

import com.beans.DBConnect;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/StudentFeeHandler")
public class StudentFeeHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentFeeHandler() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		  PrintWriter out=response.getWriter();
		  Connection con=null;
		  int p,q,r,y,z;
		    try
		    {
		    	con=DBConnect.getConnection();
		    	Statement st=con.createStatement();
		    	String roomNo=request.getParameter("roomNo");
		    	String email=request.getParameter("email");
		    	String totalFee=request.getParameter("totalFee");
		    	String remainingFee=request.getParameter("remainingFee");
		    	String feesToPay=request.getParameter("feesToPay");
				String sql1="select * from RoomStudents where roomNo=? and email=?";
				String sql2="update RoomStudents set paidFee=?,remainingFee=? where roomNo=? and email=?";
				PreparedStatement stmt1=(PreparedStatement) con.prepareStatement(sql1);
				PreparedStatement stmt2=(PreparedStatement) con.prepareStatement(sql2);
				stmt1.setString(1,roomNo);
				stmt1.setString(2,email);
				ResultSet rs1=stmt1.executeQuery();
				if(rs1.next())
				{
					 p=Integer.parseInt(remainingFee);
					 q=Integer.parseInt(feesToPay);
					 r=Integer.parseInt(totalFee);
					
					 if(p==0)
					 {
						 	RequestDispatcher rd=request.getRequestDispatcher("roomTablePage.jsp");
							rd.include(request, response);
							out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
							out.println("alert(\"Complete fee is paid! \")");
							out.println("</SCRIPT>");
					 }
					 else
					 {
						    z=p-q; //remaining
						    y=r-z;//paid
						   
						    stmt2.setInt(1,y);
						    stmt2.setInt(2,z);
						    stmt2.setString(3,roomNo);
						    stmt2.setString(4,email);
						    stmt2.executeUpdate();
						    RequestDispatcher rd=request.getRequestDispatcher("roomTablePage.jsp");
							rd.include(request, response);
					 }
				   
				}
		 	    out.println("total Fees collected from student");
                            String sql3="select hostelName,sum(feespaid) from RoomStudents group by(hostelName) where Hostel.hostelName=RoomStudents.hostelName and Profile.email=Roomstudents.email";
			    ResultSet rs=st.executeQuery(sql3);
                            String n=rs.getString(2);
                            out.println(n);
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