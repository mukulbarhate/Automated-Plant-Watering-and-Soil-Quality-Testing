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
 * Servlet implementation class AddCropSugg
 */
public class AddCropSugg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCropSugg() {
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
		System.out.println(cname);
		
		String ltemp=request.getParameter("lowtemp");
		String htemp=request.getParameter("hightemp");
		//System.out.println(temp);
		
		String lhum=request.getParameter("lowhum");
		String hhum=request.getParameter("highhum");
		
		String lmoist=request.getParameter("lowmoist");
		String hmoist=request.getParameter("highmoist");
		
		String lph=request.getParameter("lowph");
		String hph=request.getParameter("highph");
		
		String sugg=request.getParameter("suggTxt");
		System.out.println(sugg);
		

		String sql=null;
		PreparedStatement ps1=null;

		Connection conn=DBconnect.getConnect();
		sql="select id from farmer where id='"+id+"'";
		try {
			ps1=conn.prepareStatement("insert into cropsugg values(?,?,?,?,?,?,?,?,?,?,?)");
			
			HttpSession session = request.getSession(true); // reuse existing
			
			session.setAttribute("user",id);
		
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet r= ps.executeQuery();
		
			if(r.next())
			{
				request.getSession().setAttribute("msg", "Duplicate ID, Records Already Exist..!!");
        		response.sendRedirect("addCropSugg.jsp"); 
			}else
			{
				ps1.setInt(1, id);
				ps1.setString(2, cname);
				ps1.setString(3, ltemp);
				ps1.setString(4, htemp);
				ps1.setString(5, lhum);
				ps1.setString(6, hhum);
				ps1.setString(7, lmoist);
				ps1.setString(8, hmoist);
				ps1.setString(9, lph);
				ps1.setString(10, hph);
				ps1.setString(11, sugg);
				
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
					response.sendRedirect("adminhome.jsp"); 
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}

}
