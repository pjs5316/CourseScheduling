<%-- 
    Document   : signin
    Created on : Apr 10, 2016, 8:33:13 PM
    Author     : jakesemple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to CourseScheduler</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <h1>Welcome to course scheduler</h1>
        <p></p>
        <p></p>
        <h2>Log in with your Username and password</h2>
        
        <%--<form name="" action="criteria.jsp">--%>
            <form method="post" action="validate.jsp">
            Username: <input type="text" name="username"> 
            Password: <input type="password" name="password">
        <button onclick="validate.jsp">Sign In</button>
        </form>
            
            <tr><td colspan="7"><a href="criteria">Select Criteria</a></td></tr>  
        
        
    </body>
</html>