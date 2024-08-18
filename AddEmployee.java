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
 * Servlet implementation class AddEmployee
 */
public class AddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployee() {
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
		  
		 

		
		try{
			
			  int eid = 0;
			  String name = request.getParameter("name");
			  String designation = request.getParameter("designation");
			  String department = request.getParameter("department");
			  String contact = request.getParameter("contact"); 
			  String email = request.getParameter("email");
			  String password = request.getParameter("password");

			

			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("insert into employee values(?,?,?,?,?,?,?)");
			ps.setInt(1,eid);
			ps.setString(2, name);
			ps.setString(3,designation);
			ps.setString(4,department);
			ps.setString(5,contact);
			ps.setString(6,email);
			ps.setString(7,password);
			
			int i = ps.executeUpdate();
			if(i>0){
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
