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
    private int student_number;
    private String lastName;
    private String firstName;
    private String ClassStatus;
    private String Email;
    
    public Student(){}
    
    public void setID(int studentID){
        this.studentID = studentID;
    }
    public void setLogIn(String logInID){
        this.logInID = logInID;
    }
    
    public int getID(){
        return studentID;
    }
    public String getLogIn(){
        return logInID;
    }
}
