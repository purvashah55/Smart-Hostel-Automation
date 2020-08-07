package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{
	static Connection con;
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/hostel_management_system","root","root");
			System.out.println("Connection established");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
		
	}
}
