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
public class StudentMapper implements RowMapper<Student> {
   public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
      Student student = new Student();
      student.setStudentID(rs.getInt("Student_ID"));
      student.setLogInID(rs.getString("Student_Login"));
      student.setStudentPassword(rs.getString("Password"));
      student.setStudent_number(rs.getInt("Student_number"));
      student.setLastName(rs.getString("LName"));
      student.setFirstName(rs.getString("FName"));
      student.setClassStatus(rs.getInt("Class_Status"));
      student.setEmail(rs.getString("Email"));
      
      return student;
   }
}