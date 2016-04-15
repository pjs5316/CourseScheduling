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
public interface SectionDAO {
    /*
        Provides list of sections
    */
    public List<Section> list(int campusID, int departmentID);
    /*
        Returns a student object
    */
    public Section getSection(int SectionID);
    /*
        Adds course to schedule
    */
    public void addToReg(int SectionID, int StudentID);
    /*
        Removes course from schedule
    */
    public void removeFromReg(int SectionID);
    /*
        Adds course to watch list
    */
    public void addToWatchList(int SectionID, int StudentID);
    /*
        Removes course from schedule
    */
    public void removeFromWatchlist(int SectionID);
}
