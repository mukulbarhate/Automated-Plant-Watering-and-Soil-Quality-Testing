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
 * Servlet implementation class FarmerAdd
 */
public class FarmerAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FarmerAdd() {
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
		int id=0;
		String name=request.getParameter("nameTxt");
		System.out.println(name);
		
		String email=request.getParameter("emailTxt");
		System.out.println(email);
		
		String contact=request.getParameter("contactTxt");
		System.out.println(contact);
		
		String password=request.getParameter("passwordTxt");
		System.out.println(password);
		
		String gender=request.getParameter("genderDDL");
		System.out.println(gender);
		
		String temp = "0";
		String hum = "0";
		String soilmoist = "0";
		String ph = "0";
		String motorStatus = "0";
		 
		

		String sql=null;
		PreparedStatement ps1=null;

		Connection conn=DBconnect.getConnect();
		sql="select id from farmer where id='"+id+"'";
		try {
			ps1=conn.prepareStatement("insert into farmer values(?,?,?,?,?,?,?,?,?,?,?)");
			
			HttpSession session = request.getSession(true); // reuse existing
			
			session.setAttribute("user",id);
		
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet r= ps.executeQuery();
		
			if(r.next())
			{
				request.getSession().setAttribute("msg", "Duplicate ID, Records Already Exist..!!");
        		response.sendRedirect("addFarmer.jsp"); 
			}else
			{
				ps1.setInt(1, id);
				ps1.setString(2, name);
				ps1.setString(3, email);
				ps1.setString(4, contact);
				ps1.setString(5, password);
				ps1.setString(6, gender);
				ps1.setString(7, temp);
				ps1.setString(8, hum);
				ps1.setString(9, soilmoist);
				ps1.setString(10, ph);
				ps1.setString(11, motorStatus);
				
				int n= ps1.executeUpdate();
				System.out.println("Recort inserted");
				if(n>=1)
				{
					request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
					response.sendRedirect("adminhome.jsp"); 
				}
				else
				{
					request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
					response.sendRedirect("addHospital.jsp"); 
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
}
