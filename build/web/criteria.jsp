<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : criteria
    Created on : Feb 9, 2016, 1:46:16 PM
    Author     : jakesemple
--%>
<sql:query var="campus" dataSource="jdbc/course_schedule">
    SELECT campus_name FROM campus ORDER BY campus_name
</sql:query>
<sql:query var="subject" dataSource="jdbc/course_schedule">
    SELECT course_subject FROM Department ORDER BY Course_Subject
</sql:query>    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Course Criteria</title>
    </head>
    <body>
        <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Log Out</a></li>
      <li><a href="criteria.jsp">New Search</a></li>
      <li><a href="my_schedule.jsp">Your Schedule</a></li>
      <li><a href="my_watchlist.jsp">Your Watch List</a></li>
      
    </ul>
        <h1>Welcome to your course scheduler</h1>
        
        <table border="0">
            <thead>
                <tr>
                    <h2>Please Select your course criteria</h2>
                    
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><form action="browse.jsp">
                        <strong> Select your campus: </strong>
                        <select name="campus">
                            <option>Choose a Campus</option>
                            <c:forEach var="row" items="${campus.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${columnName}"/>"><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td><strong> Select your semester: </strong>
                        <select name="semester">
                            <option>Choose a Semester</option>
                            <option>SU16</option>
                            <option>FA16</option>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td><strong> Select your subject: </strong>
                        <select name="subject">
                            <option>Choose a Subject</option>
                            <c:forEach var="row" items="${subject.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${columnName}"/>"><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                            <option>Math</option>
                        </select>
                    </td>
                    <td>
                        <button onclick="browse.jsp">Search</button>
                    </td>
                </tr>
                </form>
            </tbody>
        </table>

    </body>
</html>
