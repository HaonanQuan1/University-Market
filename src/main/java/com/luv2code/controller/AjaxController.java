package com.luv2code.controller;

import com.luv2code.Entity.Item;
import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;
import com.luv2code.service.ItemService;
import com.luv2code.service.ManagerService;
import com.luv2code.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller

public class AjaxController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private ItemService itemService;

    @PostMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        String username = request.getParameter("username");
        System.out.println("username "+username);
        if(username == null || username.length() == 0) return "Enter You Username";
//        String email = request.getParameter("email");
        boolean exist = false;

            if(username != null)exist = studentService.checkStudent(username);
//            if(email != null)exist = studentService.checkStudent(email);
//            if(exist == true){
//                res2 = "Email Has Already Been Take!";
//            }

            if(exist){
                return "UserName Has Already Been Taken!";
            }
            if(username != null)exist = managerService.checkManager(username);
//            if(email != null)exist = managerService.checkManager(email);
//            if(exist == true){
//                res4 = "Email Has Already Been Taken!";
//            }
        if(exist){
            return "UserName Has Already Been Taken!";
        }
        return "You May Use The UserName";

    }
    @PostMapping("/checkEmail")
    @ResponseBody
    public String checkEmail(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        String email = request.getParameter("email");
        if(email == null || email.length() == 0) return "Enter You Email";
        if(!email.endsWith("@northeastern.edu")){
            return "Please Enter Valid Email Address";
        }
        System.out.println("email "+email);
        boolean exist = false;
        if(email != null) exist = studentService.checkStudent(email);
//        if(email != null) exist = managerService.checkManager(email);
        if(exist){
            return "Email Has Already Been Taken";
        }
        return "You May Use the Email";
    }
    @PostMapping("/searchHint")
    @ResponseBody
    public String searchHint(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        String query = request.getParameter("search");
        System.out.println("query "+query);
//        String q = query.toLowerCase();
        String res = "";
        System.out.println("start iterate");
        List<Item> list = itemService.getItems();
        System.out.println(list);
        for(int i = 0; i < list.size(); i++){
            if(list.get(i).getName().toLowerCase().contains(query.toLowerCase())){
                res += list.get(i).getName()+",";
                System.out.println("res "+res);
            }
        }
        System.out.println("end iterate");
        return res;
    }

//    @PostMapping("/checkManagerQualify")
//    @ResponseBody
//    public String checkManager(HttpServletRequest request){
//        System.out.println(request.toString());
//        String email = request.getParameter("email");
//        String role = request.getParameter("role");
//        boolean exist = false;
//        if(role.equals("Manager")){
//            exist = managerService.checkManager(email);
//        }else{
//            return "";
//        }
//        if(!exist){
//            return "You Don't Have the Access to Register as A Manager";
//        }
//        return "You Have the Access to Register as A Manager";
//    }
}
