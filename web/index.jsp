<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!-- will need to add DB Report with either session scope or application scope-->
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
        
        
    </body>
</html>
