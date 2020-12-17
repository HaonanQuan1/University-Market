package com.luv2code.controller;


import com.luv2code.Entity.Item;
import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;
import com.luv2code.service.ItemService;
import com.luv2code.service.ManagerService;
import com.luv2code.service.StudentService;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private ItemService itemService;
//
//    @Autowired
//    private
//    @Autowired
//    private
    @GetMapping("/show")
    public String showLogin(){
        return "user-login";
    }

    @PostMapping("/login")
    public String Login(HttpServletRequest request, Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student exist = (Student) session.getAttribute("student");
        if(exist != null){
            return "redirect:/student/home";
        }
//        HttpSession session = request.getSession();
        Manager manager1 = (Manager) session.getAttribute("manager");
        if(manager1 != null){
            return "redirect:/manager/home";
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "Student";
//        if(role == null){
//            model.addAttribute("message","Select Your Role!");
//            return "user-login";
//        }
        session.setMaxInactiveInterval(120*60);
        try{
            if(role.equals("Student")){
                Student student = studentService.getStudent(username,password);
                System.out.println(student);
                if(student == null){
                    System.out.println("Invalid ");
                    model.addAttribute("message","Invalid Username or Password");
                    return "user-login";
                }
                session.setAttribute("student",student);
                System.out.println("student "+student);
                return "redirect:/student/home";
            }else if(role.equals("Manager")){
                Manager manager = managerService.getManager(username,password);
                if(manager == null){
                    model.addAttribute("message","Invalid Username or Password");
                    return "user-login";
                }
                session.setAttribute("manager",manager);
                return "redirect:/manager/home";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "user-login";
    }

    @GetMapping("/showRegisterForm")
    public String showRegister(){
        return "register-form";
    }

    @PostMapping("/register")
    public String register(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(password.length() < 6){
            model.addAttribute("message","Please Enter at least 6 length password");
            return "register-form";
        }
        String email = request.getParameter("Email");
        boolean emailExist = false;
        emailExist = studentService.checkStudent(email);
        if(emailExist){
            model.addAttribute("message","Email Has been used!");
            return "register-form";
        }
        boolean usernameExist = false;
        usernameExist = studentService.checkStudent(username);
        if(usernameExist){
            model.addAttribute("message","Username Has been used!");
            return "register-form";
        }
        String role = "Student";
        if(username == null || username.length() == 0){
            model.addAttribute("message","username can not be null");
            return "register-form";
        }else if(password == null || password.length() == 0){
            model.addAttribute("message","password can not be null");
            return "register-form";
        }else if(email == null || email.length() == 0){
            model.addAttribute("message","email can not be null");
            return "register-form";
        }else if(role == null){
            model.addAttribute("message","Select Your Role");
            return "register-form";
        }
        if(role != null && role.equals("Student")){
            Student student = new Student(username,password,email);
            studentService.updateStudent(student);

        }else if(role != null && role.equals("Manager")){
            if(!managerService.checkManager(email)){
                model.addAttribute("message","You Don't Have the Access to Be A Manager");
                return "register-form";
            }
            Manager manager = new Manager(username,password,email);
            managerService.updateManager(manager);

        }
        HttpSession session = request.getSession();
        try{
            Random random = new Random();
            int Random1 = random.nextInt(1000000);
            int Random2 = random.nextInt(1000000);
            String str = "http://localhost:8080/EMR/user/validateemail.htm?username=" + username + "&key1="
                    + Random1 + "&key2=" + Random2;
            session.setAttribute("key1", Random1);
            session.setAttribute("key2", Random2);

//            try {
//
////                sendEmail(username, "Click on this link to activate your account : " + str);
//            } catch (Exception e) {
//                System.out.println("Email cannot be sent");
//            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "account-created";
    }

//    public void sendEmail(String emailAddress, String message){
//        try {
//            Email email = new SimpleEmail();
//            email.setHostName("smtp.googlemail.com");
//            email.setSmtpPort(465);
//            email.setAuthenticator(new DefaultAuthenticator("contactapplication2018@gmail.com", "springmvc"));
//            email.setSSLOnConnect(true);
//            email.setFrom("no-reply@msis.neu.edu"); // This user email does not
//            // exist
//            email.setSubject("Web tools lab ");
//            email.setMsg(message); // Retrieve email from the DAO and send this
//            email.addTo(useremail);
//            email.send();
//        } catch (EmailException | EmailException e) {
//            System.out.println("Email cannot be sent");
//        }
//    }

    @GetMapping("/profile")
    public String showProfile(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "user-login";
        }
        List<Item> items = itemService.getItemsByStudent(student);
//        model.addAttribute("student",student);
        model.addAttribute("items",items);
        return "profile";
    }

    @PostMapping("/detail")
    public String editProfile(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/login";
        }
        String action = request.getParameter("action");
        if(action.equals("modify-basic")){
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String phoneNumber = request.getParameter("phone");
            if(student != null){
                String address = request.getParameter("address");
                String college = request.getParameter("college");
                String balance = request.getParameter("balance");
                student.setFirstName(firstName);
                student.setLastName(lastName);
                student.setPhoneNumber(phoneNumber);
                student.setAddress(address);
                student.setCollege(college);
                student.setBalance(Double.parseDouble(balance));
                studentService.updateStudent(student);
            }
        }
        return "profile";
    }
    @PostMapping("updateStudent")
    public String updateStudent(HttpServletRequest request, Model model, @RequestParam("pic")MultipartFile multipartFile){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "user-login";
        }
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        String college = request.getParameter("college");
        student.setFirstName(firstname);
        student.setLastName(lastname);
        student.setAddress(address);
        student.setCollege(college);
        String fileName = "";
        try{
            if(multipartFile != null && !multipartFile.isEmpty()){
                String fileRealPath = new String("/Users/quanhaonan/Documents/Neu courses/Web Tools/Final Project/Final/src/main/webapp/resource/img/student");

                int id = student.getId();
                fileName = String.valueOf(id) + ".png";
                File fileFolder = new File(fileRealPath);
                if(!fileFolder.exists()){
                    fileFolder.mkdir();
                }
                File file = new File(fileFolder,fileName);
                if(file.exists()){
                    file.delete();
//                    File fileFolder = new File(fileRealPath);
                    file = new File(fileFolder,fileName);
                }
                multipartFile.transferTo(file);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        studentService.updateStudent(student);
        return "profile";
    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        session.removeAttribute("student");
        session.removeAttribute("manager");
        return "user-login";
    }

}
