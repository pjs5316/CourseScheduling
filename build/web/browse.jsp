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

        <sql:query var="Sections" dataSource="jdbc/courseSchedule">
            SELECT Course_Code, Description, Credits, Pre_req, Semester, 
            Start_Date, End_Date, Campus, Section_Number, Start_time, End_time,
            Capacity, Current_enrolled FROM section, course
            WHERE section.campus_campus_ID = ? <sql:param value="${param.campus}"/>
            AND section.course_Course_ID = course.Course_ID
            AND course.Department_Department_ID = ? <sql:param value="${param.subject}"/>
        </sql:query>

        <table border="0">
            <!-- column headers -->
            <tr>
                    <th><c:out value="Course Code"/></th>
                    <th><c:out value="Description"/></th>
                    <th><c:out value="Credits"/></th>
                    <th><c:out value="Prerequisites"/></th>
                    <th><c:out value="Semester "/></th>
                    <th><c:out value="End Date "/></th>
                    <th><c:out value="End Date "/></th>
                    <th><c:out value="Campus "/></th>
                    <th><c:out value="Section Number "/></th>
                    <th><c:out value="Start Time "/></th>
                    <th><c:out value="End Time "/></th>
                    <th><c:out value="Capacity "/></th>
                    <th><c:out value="Currently Enrolled "/></th>
                    
                    
            </tr>
            <!-- column data -->
            <td>
                <form action="browse.jsp">
                    <c:forEach var="row" items="${Sections.rowsByIndex}">

                        <tr>
                            <c:forEach var="column" items="${row}">

                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>

                </form>

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
            <c:forEach var="section" items="${listSections}">
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
                        <a href="/AddSection?id=${section.sectionID}">Register</a>
                        <a href="/AddtoWatchlist?id=${section.sectionID}">Add to Watch List</a></td>
                </tr>
            </c:forEach>

        </table>    
    </form>
</body>
</html>
