package com.servlets;

import java.awt.BasicStroke;
import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

import com.beans.DBConnect;

@WebServlet("/FeedbackPieChart")
public class FeedbackPieChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FeedbackPieChart() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
			response.setContentType("image/png");

		    OutputStream outputStream = response.getOutputStream();

		    JFreeChart chart = getChart(request);
		    int width = 500;
		    int height = 350;
		    ChartUtilities.writeChartAsPNG(outputStream, chart, width, height);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public JFreeChart getChart(HttpServletRequest request) {
	    Statement stmt = null;
	    Connection con = null;
	    JFreeChart chart = null;
	 
	    int a=0,b=0,c=0;
	    try
	    {
	    	con=DBConnect.getConnection();
			Statement st=con.createStatement();
			HttpSession session=request.getSession();
			String hostelName=(String) session.getAttribute("hostel");
			
			String sql1="select count(*) from RoomStudents where hostelName='"+hostelName+"' and feedback='dislike'";
			ResultSet rs1=st.executeQuery(sql1);
			while(rs1.next())
			{
				a=rs1.getInt(1);
			}
			String sql2="select count(*) from RoomStudents where hostelName='"+hostelName+"' and feedback='like'";
			ResultSet rs2=st.executeQuery(sql2);
			while(rs2.next())
			{
				b=rs2.getInt(1);
			}
		    DefaultPieDataset dataset = new DefaultPieDataset();
		    dataset.setValue("Likes", a);
		    dataset.setValue("Dislikes", b);
		    boolean legend = true;
		    boolean tooltips = false;
		    boolean urls = false;

		    chart = ChartFactory.createPieChart("Feedback Analysis", dataset, legend, tooltips, urls);

		    chart.setBorderPaint(Color.GREEN);
		    chart.setBorderStroke(new BasicStroke(5.0f));
		    chart.setBorderVisible(true);
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    return chart;
	}

}
