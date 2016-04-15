/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.schedulefiles;

import java.io.Serializable;

/**
 *
 * @author jakesemple
 */
public class Student implements Serializable{
    //This will be the student object used to create a session with a student
    private int studentID;
    private String logInID;
    private String studentPassword;
    private int student_number;
    private String lastName;
    private String firstName;
    private int ClassStatus;
    private String Email;

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getLogInID() {
        return logInID;
    }

    public void setLogInID(String logInID) {
        this.logInID = logInID;
    }
    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    public int getStudent_number() {
        return student_number;
    }

    public void setStudent_number(int student_number) {
        this.student_number = student_number;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public int getClassStatus() {
        return ClassStatus;
    }

    public void setClassStatus(int ClassStatus) {
        this.ClassStatus = ClassStatus;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
   
    
}
