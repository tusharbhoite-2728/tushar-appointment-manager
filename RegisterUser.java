package com.tushar.mini;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tushar.db.ConnectDB;

/**
 * Servlet implementation class RegisterUser
 */
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
			
			  int uid = 0;
			  String name = request.getParameter("uname");
			  String designation = request.getParameter("udesignation");
			  String department = request.getParameter("udepartment");
			  String company_name = request.getParameter("ucompanyName");
			  String contact = request.getParameter("ucontact"); 
              String address = request.getParameter("uaddress");
			  String email = request.getParameter("uemail");
			  String password = request.getParameter("upassword");

			

			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,uid);
			ps.setString(2,name);
			ps.setString(3,designation);
			ps.setString(4,department);
			ps.setString(5,company_name);
			ps.setString(6,contact);
			ps.setString(7,address);
			ps.setString(8,email);
			ps.setString(9,password);

			
			int i = ps.executeUpdate();
			if(i>0){
				response.sendRedirect("LoginUser.html");
			}
			else
			{
				response.sendRedirect("error.html");

			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
