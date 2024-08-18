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
 * Servlet implementation class ChangePasswordUser
 */
public class ChangePasswordUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordUser() {
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
		
		
		try
		{   
			String email = GetterSetter.getUemail();
			String oldPassword = request.getParameter("OldPassword");
			String newPassword = request.getParameter("NewPassword");
			
			Connection con =ConnectDB.dbCon();
			
			PreparedStatement ps = con.prepareStatement("select * from user where uemail=? and upassword=?");
			ps.setString(1,email);
			ps.setString(2,oldPassword);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				PreparedStatement ps1 = con.prepareStatement("update user set upassword=? where uemail=?");
				ps1.setString(1,newPassword);
				ps1.setString(2,email);
				
				int i = ps1.executeUpdate();
				      
				    if(i>0){
				    	response.sendRedirect("WelcomeUser.html");
				    }
				    else
				    {
				    	response.sendRedirect("error.html");

				    }
				
			}
			else
			{
		    	response.sendRedirect("ChangePasswordUserForm.html");

			}

			

			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
