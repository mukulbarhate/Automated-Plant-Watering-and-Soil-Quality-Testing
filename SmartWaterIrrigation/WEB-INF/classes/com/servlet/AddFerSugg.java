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
 * Servlet implementation class AddFerSugg
 */

public class AddFerSugg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFerSugg() {
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
		String cname=request.getParameter("cnameTxt");
		String sugg=request.getParameter("suggTxt");

		String sql=null;
		PreparedStatement ps1=null;

		Connection conn=DBconnect.getConnect();
		try {
			
			
			HttpSession session = request.getSession(true); // reuse existing
			
			session.setAttribute("user",id);
		
			ps1=conn.prepareStatement("insert into fersugg values(?,?,?)");
				ps1.setInt(1, id);
				ps1.setString(2, cname);
				ps1.setString(3, sugg);
				
				int n= ps1.executeUpdate();
				System.out.println("Recort inserted");
				if(n>=1)
				{
					request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
					response.sendRedirect("addFerSugg.jsp"); 
				}
				else
				{
					request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
					response.sendRedirect("addFerSugg.jsp"); 
				}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
}
