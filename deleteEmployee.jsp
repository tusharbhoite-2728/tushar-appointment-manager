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
          String eid = request.getParameter("id");
          Connection con = ConnectDB.dbCon();
          PreparedStatement ps = con.prepareStatement("delete from employee where eid=?");
          ps.setString(1,eid);
          
          int i = ps.executeUpdate();
          
          if(i>0){
        	  response.sendRedirect("ViewEmployee.jsp");
          }
          else
          {
        	  response.sendRedirect("error.html");
          }
          %>

</body>
</html>