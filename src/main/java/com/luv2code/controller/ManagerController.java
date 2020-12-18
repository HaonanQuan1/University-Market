package com.luv2code.controller;

import com.luv2code.Entity.*;
import com.luv2code.service.*;
import com.luv2code.util.Paging;
import com.luv2code.util.PagingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.ManyToOne;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private PagingUtil pagingUtil;
    @GetMapping("/login")
    public String showLogin(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        Student student = (Student) session.getAttribute("student");
        if(manager == null && student != null){
            return "customer-home";
        }
        return "manager-login";
    }
    @PostMapping("/loginForm")
    public String login(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager != null){
            return "redirect:/manager/home";
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Manager manager1 = managerService.getManager(username,password);
        if(manager1 == null){
            model.addAttribute("message","Invalid Username or Password");
            return "manager-login";
        }
        session.setAttribute("manager",manager1);
        return "redirect:/manager/home";
    }
    @GetMapping("/home")
    public String home(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
         if(session.getAttribute("student")!=null){
             session.removeAttribute("student");
         }
        if(manager == null){
            return "redirect:/manager/login";
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
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        String action = request.getParameter("action");
        if(action.equals("view")){
            List studentList = studentService.getStudents();
            Map<String,Object> map = pagingUtil.createPage(studentList,request.getParameter("page"));
//            request.setAttribute("");
            model.addAttribute("paging",map.get("paging"));
            Paging page = (Paging) map.get("paging");
//            System.out.println("total pa");
            System.out.println("total page "+page.getTotalPageNum());
            System.out.println("end page "+page.getEndpage());
            System.out.println("paging "+map.get("paging"));
            List<Student> pageList = (List<Student>) map.get("list");
            System.out.println("list "+pageList);
            model.addAttribute("studentList",pageList);
            return "student-list";
        }else if(action.equals("create")){
            Student student = new Student();
            model.addAttribute("student",student);
            studentService.updateStudent(student);
            return "student-detail";
        }
        return "manager-home";
    }
//    @GetMapping("/deleteStudent/{id}")
//    public String deleteStudent(@PathVariable("id") int id, HttpServletRequest request){
//        if(request.getAttribute("unsafe_request") == "true") {
//            return "error";
//        }
//        HttpSession session = request.getSession();
//        Manager manager = (Manager) session.getAttribute("manager");
//        if(manager == null){
//            return "redirect:/user/show";
//        }
//        List<Order> orders = orderService.getOrders(id);
//        for(Order order:orders){
//            orderDetailService.deleteOrderDetailByOrder(order.getId());
//        }
//        orderService.deleteOrderByStudent(id);
////        shopCartService.deleteShopCart();
//        shopCartService.clearShopCart(id);
//        studentService.deleteStudent(id);
//        return "Success";
//    }
    @PostMapping("/deleteStudent")
    public String deleteStudent(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
        String[] ids = request.getParameterValues("check");
        for(int i = 0 ; i < ids.length; i++){
            int theId = Integer.parseInt(ids[i]);
            List<Order> orders = orderService.getOrders(theId);
            for(Order order:orders){
                orderDetailService.deleteOrderDetailByOrder(order.getId());
            }
            orderService.deleteOrderByStudent(theId);
            shopCartService.clearShopCart(theId);
            studentService.deleteStudent(theId);
        }
        return "success";
    }
    @GetMapping("/editStudent/{id}")
    public String editStudent(@PathVariable("id") int id, HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
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
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
        Student student = studentService.getStudent(id);
        student.setFirstName(request.getParameter("firstname"));
        student.setLastName(request.getParameter("lastname"));
        student.setPhoneNumber(request.getParameter("phone"));
        student.setEmail(request.getParameter("email"));
        student.setAddress(request.getParameter("address"));
        student.setCollege(request.getParameter("college"));
//        student.setBalance(Double.parseDouble(request.getParameter("balance")));
//        student.setUserName(request.getParameter("username"));
        student.setPassword(request.getParameter("password"));
        studentService.updateStudent(student);
        return "Success";
    }

    @GetMapping("/items")
    public String getItems(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
        List itemList = itemService.getItems();
        Map<String,Object> map = pagingUtil.createPage(itemList,request.getParameter("page"));
        List<Item> pageList = (List<Item>) map.get("list");
        System.out.println("item list "+pageList);
        model.addAttribute("paging",map.get("paging"));
        model.addAttribute("itemList",pageList);
        return "item-list";
    }
    @PostMapping("/deleteItem")
    public String deleteItem( HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
//        OrderDetail orderDetail = orderDetailService.get
        String[] ids = request.getParameterValues("check");
//        List<Item> = itemService.getItem();
        for(int i = 0 ;i < ids.length; i++){
            int id = Integer.parseInt(ids[i]);
            orderDetailService.deleteOrderDetailByItem(id);
            itemService.deleteItem(id);
        }
//        orderDetailService.deleteOrderDetailByItem(id);
//        itemService.deleteItem(id);
        return "Success";
    }
    @GetMapping("/orders")
    public String orders(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
        List orders = orderService.getOrders();
        Map<String,Object> map = pagingUtil.createPage(orders,request.getParameter("page"));
        List<Order> orderList = (List<Order>)map.get("list");
//        model.addAttribute("orders",orders);
        model.addAttribute("paging",map.get("paging"));
        model.addAttribute("orders",orderList);
        return "order-list";
    }
    @GetMapping("/orderDetail/{id}")
    public String orderDetail(@PathVariable("id") int id,HttpServletRequest request, Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
        List<OrderDetail> orderDetails = orderDetailService.getOrderDetails(id);
        model.addAttribute("orderDetails",orderDetails);
        return "manage-order-detail";
    }
    @PostMapping("/deleteOrder")
    public String deleteOrder( HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
//        orderDetailService.de
        String[] ids = request.getParameterValues("check");
        for(int i = 0; i < ids.length; i++){
            int id = Integer.parseInt(ids[i]);
            orderDetailService.deleteOrderDetailByOrder(id);
            orderService.deleteOrder(id);
        }
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
    @GetMapping("/profile")
    public String getProfile(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
        return "manager-profile";
    }
    @PostMapping("/changePassword")
    public String chagePassword(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(session.getAttribute("student")!=null){
            session.removeAttribute("student");
        }
        if(manager == null){
            return "redirect:/manager/login";
        }
        String old = request.getParameter("old");
        String newP = request.getParameter("new");
        if(!manager.getPassword().equals(old)){
            model.addAttribute("mes","Wrong Password");
            return "manager-profile";
        }
        manager.setPassword(newP);
        managerService.updateManager(manager);
        model.addAttribute("mes","change successful");
        return "manager-profile";
    }
}
