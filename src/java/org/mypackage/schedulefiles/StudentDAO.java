/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.schedulefiles;


import java.util.List;

/**
 *
 * @author jakesemple
 */
public interface StudentDAO {
    public void createStudent();
    public Student getStudent(int id);
    public Student getStudent(String id, String password);
//    public List<Student>  
    public void createRegistration(String studentID, String sectionID);
    

}
