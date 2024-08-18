
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
 * Servlet implementation class BookAnAppointment
 */
public class BookAnAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAnAppointment() {
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
			  int aid = 0;
			  String status = "pending";
			  int uid = GetterSetter.getUid();
			  String email = GetterSetter.getUemail();
			  int empid = GetterSetter.getEmpId();
			  String purpose = request.getParameter("purpose");
			  String description = request.getParameter("description");
			  String date = request.getParameter("date");
			  String time = request.getParameter("time");
			  String designation = request.getParameter("designation");
			  String address = request.getParameter("address");
              String company_name = request.getParameter("companyName");
			  String name = request.getParameter("name");
			  String contact = request.getParameter("contact"); 
			  String department = request.getParameter("department");

			

			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("insert into appointmment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,aid);
			ps.setInt(2,empid);
			ps.setInt(3,uid);
			ps.setString(4,name);
			ps.setString(5,designation);
			ps.setString(6,department);
			ps.setString(7,company_name);
			ps.setString(8,contact);
			ps.setString(9,address);
			ps.setString(10,purpose);
			ps.setString(11,description);
			ps.setString(12,date);
			ps.setString(13,time);
			ps.setString(14,email);
			ps.setString(15,status);

		

			
			int i = ps.executeUpdate();
			if(i>0){
				response.sendRedirect("WelcomeUser.html");
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
