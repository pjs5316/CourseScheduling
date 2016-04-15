/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.schedulefiles;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author jakesemple
 */
@Controller
public class StudentController {

    @Autowired
    SectionService sectionService;
    @Autowired
    private StudentDAO studentDao;
    @Autowired
    private SectionDAO sectionDao;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/student", method = RequestMethod.GET)
    public ModelAndView student() {
        return new ModelAndView("student", "command", new Student());
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("SpringWeb") Student student,
            ModelMap model) {
        model.addAttribute("firstName", student.getFirstName());
        model.addAttribute("lastName", student.getLastName());

        return "result";
    }

    @RequestMapping(value = "/newStudentSchedule", method = RequestMethod.GET)
    public ModelAndView newStudentSchedule(ModelAndView model) {
        StudentSchedule newStudentSchedule = new StudentSchedule();
        model.addObject("StudentSchedule", newStudentSchedule);
        model.setViewName("my_schedule");

        return model;
    }

    //requestMapping value is the URL 
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView displayStudent() {
        String user = request.getParameter("username");
        String password = request.getParameter("password");
        Student student = studentDao.getStudent(user, password);
        ModelAndView model = new ModelAndView("criteria");
        model.addObject("student", student);

        return model;
    }

    @RequestMapping(value = "/criteria")
    public ModelAndView selectCriteria(){
        List<String> campusList = new ArrayList<String>();
        campusList.add("University Park");
        
        List<String> subjectList = new ArrayList<String>();
        subjectList.add("Math");
        
        Map<String, List> map = new HashMap<String, List>();
        map.put("campusList", campusList);
        map.put("subjectList", subjectList);
        
        return new ModelAndView("criteria", "map", map);
    }
    @RequestMapping(value = "/getList")
    public ModelAndView listSections(@RequestParam int campusID, @RequestParam int departmentID) throws IOException {

        List<Section> listSections = sectionService.getSectionList(campusID, departmentID);

        return new ModelAndView("browse", "listSections", listSections);
    }

    @RequestMapping(value = "/my_schedule")
    public ModelAndView listRegistration(@RequestParam int campusID, @RequestParam int departmentID) throws IOException {

        List<Section> listSections = sectionService.getSectionList(campusID, departmentID);

        return new ModelAndView("my_schedule", "listSections", listSections);
    }

    @RequestMapping(value = "/my_watchlist")
    public ModelAndView listWatchList(@RequestParam int campusID, @RequestParam int departmentID) throws IOException {

        List<Section> listSections = sectionService.getSectionList(campusID, departmentID);

        return new ModelAndView("my_watchlist", "listSections", listSections);
    }

    @RequestMapping(value = "/deleteSection")
    public String deleteSection(@RequestParam int id) {
        System.out.println("id = " + id);
        sectionService.removeFromReg(id);
        return "redirect:/ListRegistration";
    }

    @RequestMapping(value = "/deleteFromWatchlist")
    public String deleteFromWatchlist(@RequestParam int id) {
        System.out.println("id = " + id);
        sectionService.removeFromWatchlist(id);
        return "redirect:/ListWatchlist";
    }

    @RequestMapping(value = "/my_schedule")
    public ModelAndView addToRegistration(@RequestParam int id) {
        sectionService.addToReg(id, id);
        ModelAndView model = new ModelAndView("my_schedule");
        return model;
    }

    @RequestMapping(value = "/my_watchlist")
    public ModelAndView addToWatchlist(@RequestParam int id) {
        sectionService.addToReg(id, id);
        ModelAndView model = new ModelAndView("my_watchlist");
        return model;
    }

}
