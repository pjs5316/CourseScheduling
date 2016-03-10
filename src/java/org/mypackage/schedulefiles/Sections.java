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
public class Sections {
    private String campus;
    private String semester;
    private String subject;
    
    public void setCampus(String campus){
        this.campus = campus;
    }
    public void setSemester(String semester){
        this.semester = semester;
    }
    public void setSubject(String subject){
        this.subject = subject;
    }
    public String getCampus(){
        return campus;
    }
    public String getSemester(){
        return semester;
    }
    public String getSubject(){
        return subject;
    }
    
}
