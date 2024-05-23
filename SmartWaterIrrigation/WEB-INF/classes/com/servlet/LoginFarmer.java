package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.waterirrigation.DBconnect;


/**
 * Servlet implementation class LoginFarmer
 */
public class LoginFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public LoginFarmer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		Connection con= DBconnect.getConnect();
		ResultSet rs =null;
		String email=request.getParameter("email");
		String password=request.getParameter("password");

			    try
			    {
				    PreparedStatement pstmt=((Connection) con).prepareStatement("select * from farmer where email=? and password=? ");
					pstmt.setString(1, email);
					pstmt.setString(2, password);
					 rs = pstmt.executeQuery();
				    if(rs.next())
					{
				    	
				    	
				    	FarmerGetSet.setId(rs.getInt(1));
				    	FarmerGetSet.setName(rs.getString(2));
				    	FarmerGetSet.setEmail(rs.getString(3));
				    	FarmerGetSet.setTemp(rs.getString(7));
				    	FarmerGetSet.setHum(rs.getString(8));
				    	FarmerGetSet.setSoil(rs.getString(9));
				    	FarmerGetSet.setPh(rs.getString(10));
				    	
				    	response.sendRedirect("farmerhome.jsp");
						
				    }
				    else
				    {
				    	request.getSession().setAttribute("msg", "Wrong User Credentials..!!");
						response.sendRedirect("home.jsp");
						
				    	
				    	
				    }
				    
			    }
			    
			    catch(Exception e)
			    {
			    	System.out.println(e.getMessage());
			    }
		    	    
		   
	}

}
