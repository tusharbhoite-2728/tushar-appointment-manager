package com.tushar.mini;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tushar.db.ConnectDB;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		
		
		  String email = request.getParameter("email");
		  String password = request.getParameter("password");

		
		try{
			

			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("select * from admin where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2,password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				response.sendRedirect("welcome.html");
			}
			else
			{
				response.sendRedirect("error.html");

			}
			
		}
		catch(Exception e)
		{
			
		}
	}

}
