<%@ page import="java.sql.*" %>
<%@ page import="com.tushar.db.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

      
        <%
          String aid = request.getParameter("id");
          Connection con = ConnectDB.dbCon();
          String status= "Approve"; 
          PreparedStatement ps = con.prepareStatement("update appointmment set status=? where aid=?");
          ps.setString(1,status);
          ps.setString(2,aid);
          
          int i = ps.executeUpdate();
          
          if(i>0){
        	  response.sendRedirect("ViewAppointmentByEmployee.jsp");
          }
          else
          {
        	  response.sendRedirect("error.html");
          }
          %>
      

</body>
</html>