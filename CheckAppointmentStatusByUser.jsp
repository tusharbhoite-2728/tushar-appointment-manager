<%@ page import="java.sql.*" %>
<%@ page import="com.tushar.db.*" %>
<%@ page import="com.tushar.mini.*" %>

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
 <h1>  Appointment Status</h1>
 <br>
      
       <nav>
            <ul>
               <li><a href="ViewEmployeeByUsers.jsp"> View Employee</a></li>
              <li> <a href="ChangePasswordUserForm.html"> Change Password</a></li>
               <li><a href="ViewTodayAllAppointmentByUser.jsp"> ViewTodayAllAppointment</a></li>
               <li><a href="CheckAppointmentStatusByUser.jsp">ViewAppointmentStatus</a></li>
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
              <th>Date</th>s
              <th>Time</th>
              <th>Email</th>
              <th>Status</th>
         </tr>
         
          <%
            try{
            	int uid = GetterSetter.getUid();
            	Connection con = ConnectDB.dbCon();
            	PreparedStatement ps = con.prepareStatement("select * from appointmment where uid=?");
            	ps.setInt(1,uid);
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