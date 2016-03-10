<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : browse
    Created on : Feb 9, 2016, 1:32:21 PM
    Author     : jakesemple
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Browsing</title>
    </head>
    <body>
        <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Log Out</a></li>
      <li><a href="criteria.jsp">New Search</a></li>
      <li><a href="my_schedule.jsp">Your Schedule</a></li>
      <li><a href="my_watchlist.jsp">Your Watch List</a></li>
      
    </ul>
        <h1>Browse Courses here</h1>
        <h2>Available courses are listed below</h2>
        
        <sql:query var="Sections" dataSource="jdbc/course_schedule">
            SELECT * FROM section, course, Department
            WHERE section.campus_campus_ID = ? <sql:param value="${param.campus}"/>
            AND section.course_Course_ID = course.Course_ID
            AND course.Department_Department_ID = ? <sql:param value="${param.subject}"/>
        </sql:query>
    
        <table border="1">
            <!-- column headers -->
            <tr>
            <c:forEach var="columnName" items="${Sections.columnNames}">
                <th><c:out value="${columnName}"/></th>
            </c:forEach>
        </tr>
        <!-- column data -->
        <c:forEach var="row" items="${Sections.rowsByIndex}">
            <tr>
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
            </c:forEach>
            </tr>
        </c:forEach>
            
    </table>
    </body>
</html>
