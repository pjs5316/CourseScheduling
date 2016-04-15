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
public class StudentDAOImpl implements StudentDAO {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplateObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    @Override
    public void createStudent() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    

    @Override
    public Student getStudent(int id) {
        String SQL = "select * from Student where id = ?";
      Student student = jdbcTemplateObject.queryForObject(SQL, 
                        new Object[]{id}, new StudentMapper());
      return student;
   }
    

    @Override
    public Student getStudent(String id, String password) {
        String SQL = "select * from Student where id = ? and password = ?";
        Student student = jdbcTemplateObject.queryForObject(SQL, 
                        new Object[]{id, password}, new StudentMapper());
      return student;
    }

    @Override
    public void createRegistration(String studentID, String sectionID) {
        
    }

    

}
