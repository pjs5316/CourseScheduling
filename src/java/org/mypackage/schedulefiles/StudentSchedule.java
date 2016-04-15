/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.schedulefiles;

/**
 *
 * @author jakesemple
 */
public class StudentSchedule {
    
    private Student student;
    private Section section;

    StudentSchedule() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }


    
//    public StudentSchedule(Student student, Sections section) {
//        this.student = student;
//        this.section = section;
//    }
    
}
