<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : my_registration
    Created on : Feb 15, 2016, 7:27:56 PM
    Author     : jakesemple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="watch" dataSource="jdbc/courseSchedule">
        SELECT * FROM watchlist, section Where watchlist.section_Section_ID= section.Section_ID
    </sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Watch List</title>
    </head>
    <body>
        <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Log Out</a></li>
      <li><a href="criteria.jsp">New Search</a></li>
      <li><a href="my_schedule.jsp">Your Schedule</a></li>
      <li><a href="my_watchlist.jsp">Your Watch List</a></li>
      
    </ul>
        <h1>This is your watch list:</h1>
        
        
    
    <table border="0">
        <!-- column headers -->
        <tr>
        <c:forEach var="columnName" items="${watch.columnNames}">
            <th><c:out value="${columnName}"/></th>
        </c:forEach>
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${watch.rowsByIndex}">
        <tr>
        <c:forEach var="column" items="${row}">
            <td><c:out value="${column}"/></td>
        </c:forEach>
        </tr>
    </c:forEach>
</table>
        
         <form:hidden path="sectionID" >
        <table border="0">

            <tr>
                <td> Course </td>
                <td> Prerequisite/s </td>
                <td> Campus </td>
                <td> Section </td>
                <td> Semester </td>
                <td> Start Date </td>
                <td> End Date </td>
                <td> Start Time </td>
                <td> End Time </td>
                <td> Currently Enrolled </td>
                <td> Capacity </td>
                

            </tr>
            <c:forEach var="section" items="${sectionList}">
                <tr>
                    <td>${section.courseID}</td>
                    <td>${section.prereq}</td>
                    <td>${section.campus}</td>
                    <td>${section.sectionNumber}</td>
                    <td>${section.semester}</td>
                    <td>${section.startDate}</td>
                    <td>${section.endDate}</td>
                    <td>${section.startTime}</td>
                    <td>${section.endTime}</td>
                    <td>${section.currentEnrolled}</td>
                    <td>${section.capacity}</td>
                    <td>
                        <a href="/deleteSection?id=${section.sectionID}">Remove</a>
                    </td>
                </tr>
            </c:forEach>

        </table>    
    </form>
    </body>
</html>
