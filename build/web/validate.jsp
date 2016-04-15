<%@page import="org.mypackage.schedulefiles.Student"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : validate
    Created on : Feb 15, 2016, 8:14:22 PM
    Author     : jakesemple
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<%@page import = "java.sql.*, java.io.*, java.util.*" %>


<%-- This will be a try-catch block with the 
prepared statement to validate the user's login credentials. 
The validate page will also establish a session--%>

<%
    PreparedStatement student = null;
    
    try{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String JDBCuser = "root";
        String JDBCpass = "password";

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_schedule_db?",JDBCuser,JDBCpass); 
        PreparedStatement pst = conn.prepareStatement("Select Student_Login, Password from student where Student_Login=? and Password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery();
        
        
        if(rs.next()){
            out.println("valid");
            response.sendRedirect("criteria.jsp");
            //StudentDAOImpl SDI = (StudentDAOImpl);
            Student ns = new Student();
            
            session.setAttribute(username, ns);
            ns.setFirstName(rs.getString("firstName"));
        }
        else
            out.println("invalid");
    }
    catch(Exception E){
        out.println("Something went wrong");
    }
    %>