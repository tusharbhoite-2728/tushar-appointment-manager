<%@ page import="java.sql.*" %>
<%@ page import="com.tushar.db.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="css/Style.css">
            <link rel="stylesheet" href="css/AddEmployee.css">
<title>Insert title here</title>
</head>
<body>
<header>
 <h1>Employee</h1><br>
 
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
              <th>Name</th>
              <th>Designation</th>
              <th>Department</th>
              <th>Contact No.</th>
               <th>Email</th>
                <th>Action</th>
         </tr>
         
         <%
            try{
            	Connection con = ConnectDB.dbCon();
            	PreparedStatement ps = con.prepareStatement("select * from employee");
            	ResultSet rs = ps.executeQuery();
            	
            	while(rs.next())
            	{%>
            	<tr> 
            	     <td><%= rs.getInt(1) %></td>
            	     <td><%= rs.getString(2) %></td>
            	     <td><%= rs.getString(3) %></td>
            	     <td><%= rs.getString(4) %></td>
            	     <td><%= rs.getString(5) %></td>
            	     <td><%= rs.getString(6) %></td>
            	     <td><a href="BookAnAppointmentForm.jsp?id=<%=rs.getInt(1)%>">Book</a></td>
            	     
            	 
            	
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