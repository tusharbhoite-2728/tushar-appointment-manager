<%@ page import="java.sql.*" %>
<%@ page import="com.tushar.db.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/Style.css">
        <link rel="stylesheet" href="css/AddEmployee.css">
</head>
<body>

           
           <header>
   <h1>Approved  Appointment</h1><br>
 
   <nav>
            <ul>
               <li><a href="ViewAppointmentByEmployee.jsp"> View All Appointments</a></li>
              <li> <a href="ViewTodayAllAppointmentByEmployee.jsp"> View Todays Appointments</a></li>
               <li><a href="ViewAllApprovedAppointment.jsp"> View All Approved Appointments</a></li>
               <li><a href="ViewAllDisApprovedAppointment.jsp"> View All Disapproved Appointments</a></li>
                <li><a href="ChangePasswordEmployeeForm.html"> Change Password</a></li>
            </ul>
        </nav>
     </header>

        <main class="content">       
               
  
  <table>
         <tr>
              <th>ID</th>
              <th>Employee Id</th>
              <th>UserId</th>
              <th>Name</th>
              <th>Designation</th>
              <th>Department</th>
              <th>Company</th>
              <th>Contact No.</th>
              <th>Address</th>
              <th>Purpose</th>
              <th>Description</th>
              <th>Date</th>
              <th>Time</th>
              <th>Email</th>
              <th>Status</th>
             
         </tr>
         
          <%
            try{
            	Connection con = ConnectDB.dbCon();
            	PreparedStatement ps = con.prepareStatement("select * from appointmment where status=?");
            	ps.setString(1,"Approve");
            	ResultSet rs = ps.executeQuery();
            	
            	while(rs.next())
            	{%>
            	<tr> 
            	     <td><%= rs.getInt(1) %></td>
            	     <td><%= rs.getInt(2) %></td>
            	     <td><%= rs.getInt(3) %></td>
            	     <td><%= rs.getString(4) %></td>
            	     <td><%= rs.getString(5) %></td>
            	     <td><%= rs.getString(6) %></td>
            	     <td><%= rs.getString(7) %></td>
            	     <td><%= rs.getString(8) %></td>
            	     <td><%= rs.getString(9) %></td>
            	     <td><%= rs.getString(10) %></td>
            	     <td><%= rs.getString(11) %></td>
            	     <td><%= rs.getString(12) %></td>
            	     <td><%= rs.getString(13) %></td>
            	     <td><%= rs.getString(14) %></td>
            	     <td><%= rs.getString(15) %></td>
        
            	     
        </tr>
            	
           <% 
            		
            	}
}
         catch(Exception e){
        	 e.printStackTrace();
         }
         %>
  </table>
  </main>
  
  <footer>
        <p>&copy; 2024 Employee Management System. All rights reserved.</p>
    </footer>      
      
         

</body>
</html>