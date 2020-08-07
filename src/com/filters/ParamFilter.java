package com.filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.beans.Student;
import java.util.regex.Matcher; 
import java.util.regex.Pattern; 

@WebFilter({"/StudentLogin","/StudentSignup"})
public class ParamFilter implements Filter 
{
    public ParamFilter() 
    {
    }
    
	public void destroy() 
	{
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest httpRequest=(HttpServletRequest)request;
		System.out.println("Inside Param filter for "+httpRequest.getServletPath());
		if(httpRequest.getServletPath().equals("/StudentLogin"))
		{
			String studentUserName=request.getParameter("studentUserName");
			String studentPassword=request.getParameter("studentPassword");
			Student studentLoginDetails=new Student(studentUserName,studentPassword);
			request.setAttribute("studentLoginDetails",studentLoginDetails);
			chain.doFilter(request, response);
		}
		else if(httpRequest.getServletPath().equals("/StudentSignup"))
		{	
			System.out.println("Inside Param filter for "+httpRequest.getServletPath());
			String firstName=request.getParameter("firstName");
			String middleName=request.getParameter("middleName");
			String lastName=request.getParameter("lastName");
			String studentUserName=request.getParameter("studentUserName");
			String studentPassword=request.getParameter("studentPassword");
			String studentConfirmPassword=request.getParameter("studentConfirmPassword");
			Student studentSignupDetails=new Student(firstName,middleName,lastName,studentUserName,studentPassword);
			request.setAttribute("studentSignupDetails",studentSignupDetails);
			chain.doFilter(request, response);
		}	
		
	}
	
	public void init(FilterConfig fConfig) throws ServletException 
	{
	}
	public static boolean isValid(String email) 
	{ 
	        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+"[a-zA-Z0-9_+&*-]+)*@"+"(?:[a-zA-Z0-9-]+\\.)+[a-z" + "A-Z]{2,7}$"; 
	        Pattern pat = Pattern.compile(emailRegex); 
	        if (email == null) 
	            return false; 
	        return pat.matcher(email).matches(); 
	} 
}
