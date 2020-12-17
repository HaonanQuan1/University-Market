package com.luv2code.controller;

import com.luv2code.Entity.*;
import com.luv2code.service.*;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private ShopCartService shopCartService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private ItemService itemService;

    @GetMapping("/home")
    public String getHome(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
        List<Item> list = itemService.getItemsNoStudent(student);
        list =  list.subList(0,list.size()/2);
        session.setAttribute("list",list);
//        List<Item> studentlist = itemService.getItemsByStudent(student);

//        for()
//        model.addAttribute("list",list);

        return "customer-home";
    }

    @GetMapping("/shopCarts")
    public String shopCarts(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
//        System.out.println(student);
        List<ShopCart> list = shopCartService.getCarts(student);
        model.addAttribute("cart",list);
        return "shopCarts";
    }
    @GetMapping("/updateShopCarts/{id}")
    public String shopCarts(@PathVariable("id") int id, HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
        shopCartService.deleteShopCart(id);
        List<ShopCart> list = shopCartService.getCarts(student);
//        for(int i = 0; i < list.size(); i++){
//            System.out.println(list.get(i));
//        }
        model.addAttribute("cart",list);
        return "shopCarts";
    }
    @GetMapping("/place")
    public String placeOrder(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
        List<ShopCart> list = shopCartService.getCarts(student);
        double price = 0;
        Order order = new Order();
        order.setStudent(student);
        String date = new Date().toString();
        order.setDate(date);
        order.setTotalPrice(0.0);
        orderService.saveOrUpdate(order);
        for(ShopCart cart: list){
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setNum(cart.getNum());
            orderDetail.setItem(cart.getItem());
            orderDetailService.updateOrderDetail(orderDetail);
//            orderDetails.add(orderDetail);
            price += Double.parseDouble(cart.getItem().getPrice())*cart.getNum();
        }
        order.setTotalPrice(price);
        orderService.saveOrUpdate(order);
        List<OrderDetail> orderDetails = orderDetailService.getOrderDetails(order);
        model.addAttribute("order",order);
        model.addAttribute("orderDetails",orderDetails);
        return "place-order";
    }

    @PostMapping("/finishOrder/{id}")
    public String finishOrder(@PathVariable("id") int id,HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
//        Double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
        Order order = orderService.getOrder(id);
//        student.setBalance(student.getBalance() - order.getTotalPrice());
        String save = request.getParameter("save");
        if(save!=null){
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String address = request.getParameter("address1");
            student.setFirstName(firstName);
            student.setLastName(lastName);
            student.setAddress(address);
            studentService.updateStudent(student);
        }
        List<OrderDetail> list = orderDetailService.getOrderDetails(order);

//        for(OrderDetail detail:list){
//            Item item = itemService.getItem(detail.getItem().getId());
//            int num = detail.getNum();
//            int remain = item.getNum() - num;
//            System.out.println("remain "+remain);
//            if(remain <= 0){
//                System.out.println(item.getId());
//                itemService.deleteItem(item.getId());
//                System.out.println("delete successfully ");
//            }else{
//                item.setNum(remain);
//                itemService.updateItem(item);
//                System.out.println("update num successfully");
//            }
//        }
        shopCartService.clearShopCart(student);
//        System.out.println("finish Order!");
        return "finish";
    }
    @GetMapping("/orders")
    public String viewOrder(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
//        List<Order> list = student.getOrders();
        List<Order> list = orderService.getOrders(student);
//        System.out.println(list);
        List<Order> orderList = new ArrayList<>();
        for(int i = list.size() - 1; i >= 0; i--){
            orderList.add(list.get(i));
        }
        model.addAttribute("orderList",orderList);
        return "order-history";
    }

    @GetMapping("/viewOrders/{id}")
    public String viewOrderDetails(@PathVariable("id")int id,Model model,HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
        List<OrderDetail> list = orderDetailService.getOrderDetails(id);
        model.addAttribute("orderDetailList",list);
        return "order-details";
    }

    @GetMapping("/addCart/{id}")
    public String addToCart(@PathVariable("id") int id, HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
//        ShopCart cart = shopCartService.get
        ShopCart shopCart = new ShopCart();
        Item item = itemService.getItem(id);
//        if(item.getStudent() == student){
//            return "success";
//        }
        shopCart.setItem(item);
        shopCart.setStudent(student);
        shopCart.setNum(1);
        shopCartService.updateShopCart(shopCart);
        return "redirect:/student/home";
    }




//    public boolean checkStudent(HttpServletRequest request){
//        HttpSession session = request.getSession();
//        Student student = (Student) session.getAttribute("student");
//        boolean res = true;
//        if(student == null){
//            res = false;
//        }
//        return res;
//    }

//    @GetMapping("/getStudent/{id}")
//    public String getStudent(@PathVariable("id") int id,HttpServletRequest request,Model model){
//
//    }






/**
 * For Test Part
 */
    @GetMapping("/student/test")
    public String test(Model model){
        Student student = studentService.getStudent(2);
        model.addAttribute("student",student);
        return "test";
    }
    @GetMapping("/test2")
    public String test2(Model model){
        Student student = studentService.getStudent(2);
        System.out.println(student);
        List<ShopCart> list = shopCartService.getCarts(student);
//        System.out.println(student.getShopCarts().get(0));
        System.out.println(list);
        model.addAttribute("list",list);
        System.out.println("end");
        return "test";
    }

    @PostMapping("/test3")
    public String test3(HttpServletRequest request){
        String num = request.getParameter("test");
        System.out.println("num "+num);
        return "test";
    }
    @GetMapping("/test4")
    public String test4(){
        return "customer-home";
    }


}
