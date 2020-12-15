package com.luv2code.controller;

import com.luv2code.Entity.*;
import com.luv2code.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private ShopCartService shopCartService;
    @GetMapping("/home")
    public String home(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        return "manager-home";
    }
    @GetMapping("/student")
    public String handleStudent(HttpServletRequest request, Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        String action = request.getParameter("action");
        if(action.equals("view")){
            List<Student> studentList = studentService.getStudents();
            model.addAttribute("studentList",studentList);
            return "student-list";
        }else if(action.equals("create")){
            Student student = new Student();
            model.addAttribute("student",student);
            studentService.updateStudent(student);
            return "student-detail";
        }
        return "manager-home";
    }
    @GetMapping("/deleteStudent/{id}")
    public String deleteStudent(@PathVariable("id") int id, HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        List<Order> orders = orderService.getOrders(id);
        for(Order order:orders){
            orderDetailService.deleteOrderDetailByOrder(order.getId());
        }
        orderService.deleteOrderByStudent(id);
//        shopCartService.deleteShopCart();
        shopCartService.clearShopCart(id);
        studentService.deleteStudent(id);
        return "Success";
    }
    @GetMapping("/editStudent/{id}")
    public String editStudent(@PathVariable("id") int id, HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        Student student = studentService.getStudent(id);
        model.addAttribute("student",student);
        return "student-detail";
    }
    @PostMapping("/updateStudent/{id}")
    public String saveStudent(@PathVariable("id") int id,HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        Student student = studentService.getStudent(id);
        student.setFirstName(request.getParameter("firstname"));
        student.setLastName(request.getParameter("lastname"));
        student.setPhoneNumber(request.getParameter("phone"));
        student.setEmail(request.getParameter("email"));
        student.setAddress(request.getParameter("address"));
        student.setCollege(request.getParameter("college"));
        student.setBalance(Double.parseDouble(request.getParameter("balance")));
        student.setUserName(request.getParameter("username"));
        student.setPassword(request.getParameter("password"));
        studentService.updateStudent(student);
        return "Success";
    }
//    @GetMapping("/viewStudent/{id}")
//    public  String getStudent(@PathVariable("id") int id, HttpServletRequest request,Model model){
//        HttpSession session = request.getSession();
//        Manager manager = (Manager) session.getAttribute("manager");
//        if(manager == null){
//            return "redirect:/user/show";
//        }
//        Student student = studentService.getStudent(id);
//        model.addAttribute("student",student);
//        return "student-detail";
//    }

    @GetMapping("/items")
    public String getItems(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        List<Item> list = itemService.getItems();
        model.addAttribute("itemList",list);
        return "item-list";
    }
    @GetMapping("/deleteItem/{id}")
    public String editItem(@PathVariable("id") int id, HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
//        OrderDetail orderDetail = orderDetailService.get
        orderDetailService.deleteOrderDetailByItem(id);
        itemService.deleteItem(id);
        return "Success";
    }
    @GetMapping("/orders")
    public String orders(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders",orders);
        return "order-list";
    }
    @GetMapping("/orderDetail/{id}")
    public String orderDetail(@PathVariable("id") int id,HttpServletRequest request, Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
        List<OrderDetail> orderDetails = orderDetailService.getOrderDetails(id);
        model.addAttribute("orderDetails",orderDetails);
        return "order-detail";
    }
    @GetMapping("/deleteOrder/{id}")
    public String deleteOrder(@PathVariable("id") int id, HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            return "redirect:/user/show";
        }
//        orderDetailService.de
        orderDetailService.deleteOrderDetailByOrder(id);
        orderService.deleteOrder(id);
        return "Success";
    }
//    @GetMapping("/managers")
//    public String getManagers(HttpServletRequest request,Model model){
//        HttpSession session = request.getSession();
//        Manager manager = (Manager) session.getAttribute("manager");
//        if(manager == null){
//            return "redirect:/user/show";
//        }
//        List<Manager> managers = managerService.getManagers();
//        model.addAttribute("managers",managers);
//        return "manager-list";
//    }
}
