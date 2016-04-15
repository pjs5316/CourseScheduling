
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : criteria
    Created on : Feb 9, 2016, 1:46:16 PM
    Author     : jakesemple
--%>
<sql:query var="campus" dataSource="jdbc/courseSchedule">
    SELECT campus_ID, campus_name FROM campus ORDER BY campus_name
</sql:query>
<sql:query var="subject" dataSource="jdbc/courseSchedule">
    SELECT Department_ID, course_subject FROM Department ORDER BY Course_Subject
    
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
      <li class="active"><a href="index.htm">Log Out</a></li>
      <li><a href="criteria.jsp">New Search</a></li>
      <li><a href="my_schedule.jsp">Your Schedule</a></li>
      <li><a href="my_watchlist.jsp">Your Watch List</a></li>
      
    </ul>
        <c:forEach var="student" items="${student}">          
            <h1>Welcome ${student.firstname},to your course scheduler</h1>
        </c:forEach>
        <table border="0">
            <thead>
                <tr>
                    <h2>Please Select your course criteria</h2>
                    
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><form:form method="post" action="browse.jsp">
                        <strong> Select your campus: </strong>
                        <select name="campus">
                            <option>Choose a Campus</option>
                            <c:forEach var="row" items="${campus.rows}">
                                <option value="${row.campus_ID}">${row.campus_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td><strong> Select your semester: </strong>
                        <select name="semester">
                            <option>Choose a Semester</option>
                            <option>SP16</option>
                            <option>FA16</option>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td><strong> Select your subject: </strong>
                        <select name="subject">
                            <option>Choose a Subject</option>
                            <c:forEach var="row" items="${subject.rows}">
                                <option value="${row.Department_ID}">${row.course_subject}</option>
                            </c:forEach>
                        </select>
                    </td>
                    
                    <td>
                        <button onclick="browse.jsp">Search</button>
                    </td>
                    <td><a href="getList?campusID=${param.campus},departmentID=${param.subject}">Add</a></td>
                </tr>
                </table>
                </form:form>
                
                 <form:form method="post" action="/getList">  
                     <table border = "0">
                         <tr>
                             <select name="altCampus">
                            <option>Choose a Campus</option>
                            <c:forEach var="row" items="${map.campusList}">
                                <option value="${row}">${map.campusList}</option>
                            </c:forEach>
                        </select>  
                         </tr>
                     </table>
                 </form:form>     
            </tbody> 
        

    </body>
</html>
