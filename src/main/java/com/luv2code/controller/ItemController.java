package com.luv2code.controller;

import com.luv2code.Entity.Item;
import com.luv2code.Entity.Student;
import com.luv2code.service.ItemService;
import com.luv2code.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemService itemService;
    @Autowired
    private OrderDetailService orderDetailService;

    @GetMapping("/detail/{id}")
    public String getDetail(@PathVariable("id") int id, Model model, HttpServletRequest request){
//        System.out.println("Id "+id);
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";
        }
        Item item = itemService.getItem(id);
        model.addAttribute("item",item);
        List<Item> list = itemService.getItemsByTag(item.getTag());
//        model.addAttribute("list",list);/
        request.setAttribute("list",list);
        return "item-detail";
    }
    @PostMapping("/search")
    public String search(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
        String name = request.getParameter("search");
        List<Item> searchResult = itemService.getItems(name);
        model.addAttribute("list",searchResult);
        return "search-result";
    }
    @GetMapping("/upload")
    public String upload(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
//        model.
        return "item-upload";
    }
    @PostMapping("/uploadItem")
    public String uploadItem(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";

        }
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        int num = Integer.parseInt(request.getParameter("num"));
        Item item = new Item();
        item.setName(name);
        item.setPrice(price);
        item.setDescription(description);
        item.setStudent(student);
        item.setNum(num);
        itemService.updateItem(item);
        return "redirect:/student/home";

    }

    @GetMapping("/viewStudentItem")
    public String getMyItems(HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";
        }
        List<Item> list = itemService.getItemsByStudent(student);
        model.addAttribute("list",list);
        return "my-items";
    }
    @GetMapping("/deleteItem/{id}")
    public String deleteItem(@PathVariable("id")int id,HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";
        }
        orderDetailService.deleteOrderDetailByItem(id);
        itemService.deleteItem(id);
        return "redirect:/item/viewStudentItem";
    }
    @GetMapping("/editDetail/{id}")
    public String editDetail(@PathVariable("id") int id,HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";
        }
        Item item = itemService.getItem(id);
        model.addAttribute("item",item);
        return "edit-item";
    }
    @PostMapping("/editItem")
    public String editItem(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";
        }
        int id = Integer.parseInt(request.getParameter("id"));
        Item item = itemService.getItem(id);
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        int num = Integer.parseInt(request.getParameter("num"));
        String description = request.getParameter("description");
        item.setNum(num);
        item.setDescription(description);
        item.setPrice(price);
        item.setName(name);
        itemService.updateItem(item);
        return "redirect:/item/viewStudentItem";
    }
    @GetMapping("/searchByTag/{tag}")
    public String searchByTag(@PathVariable("tag") String tag,HttpServletRequest request,Model model){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";
        }
        List<Item> list = itemService.getItemsByTag(tag);
        model.addAttribute("list",list);
        return "search-result";
    }
}
