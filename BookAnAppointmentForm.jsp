<%@ page import="com.tushar.mini.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="css/Style.css">

</head>
<body>
<header>
<h1>Book Appointment</h1>
</header>



         <%
         int eid = Integer.parseInt(request.getParameter("id"));
         GetterSetter.setEmpId(eid);
         
         %>


       
 <div id="main">
       <form action="BookAnAppointment" method="post">
               
                <input type="hidden" name="empid" value=<%=eid%> > <br><br>
                
                <input type="text" name="name" placeholder="Enter name" > <br><br>
                
                   <input type="text" name="designation" placeholder="Enter designation :" > <br><br>
             
             <input type="text" name="department" placeholder="Enter department" > <br><br>
             
             <input type="text" name="companyName" placeholder="Enter companyName" > <br><br>
             
               
             <input type="text" name="contact" placeholder="Enter contact" > <br><br>
                
            <input type="text" name="address" placeholder="Enter address" > <br><br>
                
              
             <input type="text" name="purpose" placeholder="Enter purpose" > <br><br>
             
             <input type="text" name="description" placeholder="Enter Description" > <br><br>
             
             <input type="date" name="date" placeholder="Enter appointment date" > <br><br>
             
             <input type="time" name="time" placeholder="Enter time" > <br><br>
             
             
              <input type="submit"  value="Login" > <br>
       
       </form>
         </div>
    
  
    <footer>
        <p>&copy; 2024 Login Portal. All rights reserved.</p>
    </footer>
       

</body>
</html>