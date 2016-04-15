/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.schedulefiles;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author jakesemple
 */
public class sectionMapper implements RowMapper {
    public Section mapRow(ResultSet rs, int rowNum) throws SQLException {
        Section section = new Section();
        section.setSectionID(rs.getInt("Section_ID"));
        section.setSectionNumber(rs.getInt("Section_Number"));
        section.setStartTime(rs.getString("Start_time"));
        section.setEndTime(rs.getString("End_time"));
        section.setCapacity(rs.getInt("Capacity"));
        section.setCurrentEnrolled(rs.getInt("Current_enrolled"));
        section.setStartDate(rs.getString("Start_Date"));
        section.setEndDate(rs.getString("End_Date"));
        section.setSemester(rs.getString("Semester"));
        section.setCampus(rs.getString("Campus"));
        section.setCourseID(rs.getInt("course_Course_ID"));
        section.setCampusID(rs.getInt("campus_campus_ID"));
        
        return section;
    }
}
