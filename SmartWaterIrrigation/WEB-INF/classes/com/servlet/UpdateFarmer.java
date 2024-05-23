package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.waterirrigation.DBconnect;

/**
 * Servlet implementation class UpdateFarmer
 */
public class UpdateFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFarmer() {
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
		
		PrintWriter out = response.getWriter();
		{
			
		String email=FarmerGetSet.getEmail();
		System.out.println(email);
		
		String contact=request.getParameter("contactTxt");
		System.out.println(contact);
		
		String password=request.getParameter("passwordTxt");
		System.out.println(password);
		
		String ph=request.getParameter("phTxt");
		System.out.println(contact);

		String sql=null;
		PreparedStatement ps1=null;

		Connection conn=DBconnect.getConnect();

		try {
			HttpSession session = request.getSession(true); // reuse existing
			
			session.setAttribute("user",contact);
		
			ps1=conn.prepareStatement("update farmer set contact=?, password=?, ph=? where email=?");
				ps1.setString(1, contact);
				ps1.setString(2, password);
				ps1.setString(3, ph);
				ps1.setString(4, email);
				
				int n= ps1.executeUpdate();
				System.out.println("Recort inserted");
				if(n>=1)
				{
					request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
					response.sendRedirect("farmerhome.jsp"); 
				}
				else
				{
					request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
					response.sendRedirect("farmerhome.jsp"); 
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	}

}
