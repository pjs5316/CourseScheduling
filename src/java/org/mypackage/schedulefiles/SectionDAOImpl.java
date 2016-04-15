/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.schedulefiles;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author jakesemple
 */
public class SectionDAOImpl implements SectionDAO {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplateObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);
    }


    @Override
    public List<Section> list(int campusID, int departmentID) {
        String SQL = "SELECT * FROM section, course WHERE "
                + "section.campus_campus_ID =  " + campusID
                + "AND section.course_Course_ID = course.Course_ID "
                + "AND course.Department_Department_ID = " + departmentID;
        List<Section> listSections = jdbcTemplateObject.query(SQL, new RowMapper<Section>() {

            @Override
            public Section mapRow(ResultSet rs, int i) throws SQLException {
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

        });
        return listSections;
    }

    public void addToReg(int SectionID, int StudentID) {
        String SQL = "insert into watchlist (student_Student_ID,section_Section_ID) VALUES(?,?)";
        jdbcTemplateObject.update(SQL, new Object[]{SectionID, StudentID});
    }

    @Override
    public Section getSection(int SectionID) {
        String SQL = "select * from Student where id = ?";
      Section section = (Section) jdbcTemplateObject.queryForObject(SQL, 
                        new Object[]{SectionID}, new sectionMapper());
      return section;
    }

    @Override
    public void removeFromReg(int SectionID) {
        String SQL = "delete * from registration where id = ?";
        jdbcTemplateObject.update(SQL,SectionID);
    }

    @Override
    public void addToWatchList(int SectionID, int StudentID) {
        String SQL = "insert into watchlist (student_Student_ID,section_Section_ID) VALUES(?,?)";
        jdbcTemplateObject.update(SQL, new Object[]{SectionID, StudentID});
    }

    @Override
    public void removeFromWatchlist(int SectionID) {
       String SQL = "delete * from watchlist where id = ?";
        jdbcTemplateObject.update(SQL,SectionID);
    }

   
}
