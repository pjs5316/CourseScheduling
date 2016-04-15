/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.schedulefiles;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
/**
 *
 * @author jakesemple
 */
public class SectionServiceImpl implements SectionService{
    @Autowired
    SectionDAO sectiondao;

    @Override
    public List<Section> getSectionList(int campusID, int departmentID) {
        return sectiondao.list(campusID, departmentID);
    }

    @Override
    public Section getSection(int SectionID) {
        return sectiondao.getSection(SectionID);
    }

    @Override
    public void addToReg(int SectionID, int StudentID) {
        sectiondao.addToReg(SectionID, StudentID);
    }

    @Override
    public void removeFromReg(int SectionID) {
        sectiondao.removeFromReg(SectionID);
    }

    @Override
    public void addToWatchList(int SectionID, int StudentID) {
        sectiondao.addToWatchList(SectionID, StudentID);
    }

    @Override
    public void removeFromWatchlist(int SectionID) {
        sectiondao.removeFromWatchlist(SectionID);
    }
    
}
