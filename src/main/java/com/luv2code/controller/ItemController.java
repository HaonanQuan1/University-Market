package com.luv2code.controller;

import com.luv2code.Entity.Item;
import com.luv2code.Entity.Student;
import com.luv2code.service.ItemService;
import com.luv2code.service.OrderDetailService;
import com.luv2code.service.ShopCartService;
import com.luv2code.util.Paging;
import com.luv2code.util.PagingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemService itemService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private ShopCartService shopCartService;
    @Autowired
    private PagingUtil pagingUtil;
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
        List<Item> items = new ArrayList<>();
        for(Item item1 :list){
            if(item1.getId() != item.getId()){
                items.add(item1);
            }
        }
//        model.addAttribute("list",list);/
        request.setAttribute("list",items);
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
//        System.out.println("name "+name);
        List searchResult = itemService.getItems(name);
        Map<String,Object> map = pagingUtil.createPage(searchResult,request.getParameter("page"));
        List<Item> result = (List<Item>) map.get("list");
        Paging paging = (Paging) map.get("paging");
//        System.out.println("total "+paging.getTotalPageNum());
//        System.out.println(map.get("paging"));
        model.addAttribute("paging",paging);
//        session.setAttribute("searchResult",result);
//        System.out.println(searchResult);
//        if(searchResult.size() > 10)searchResult = searchResult.subList(0,10);
        model.addAttribute("searchResult",searchResult);
        model.addAttribute("paging",map.get("paging"));
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
    public String uploadItem(HttpServletRequest request, @RequestParam("pic")MultipartFile multipartFile){
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
//        String pic = request.getParameter("pic");
        int num = Integer.parseInt(request.getParameter("num"));
        Item item = new Item();
        item.setName(name);
        item.setPrice(price);
        item.setDescription(description);
        item.setStudent(student);
        item.setNum(num);
        item.setTag(request.getParameter("tag"));
        itemService.updateItem(item);
//        item = itemService.get
        String fileName = "";
        System.out.println("start upload pic");
        try {
            if (multipartFile != null && !multipartFile.isEmpty()) {
//                String fileRealPath = request.getSession().getServletContext().getRealPath("/resource/img/item");
                String fileRealPath = new String("/Users/quanhaonan/Documents/Neu courses/Web Tools/Final Project/Final/src/main/webapp/resource/img/item");
                System.out.println("fileRealPath "+fileRealPath);
                int id = item.getId();
                fileName = String.valueOf(id) + ".png";
                System.out.println("fileName "+fileName);
                File fileFolder = new File(fileRealPath);
                System.out.println("fileRealPath=" + fileRealPath + "/" + fileName);
                if (!fileFolder.exists()) {
                    fileFolder.mkdirs();
                }
//                if(f)
                System.out.println("start to make a file");
                File file = new File(fileFolder, fileName);
                if(file.exists()){
                    file.delete();
                    file = new File(fileFolder,fileName);
                }
                multipartFile.transferTo(file);

                System.out.println("finish file upload");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        item.setPic(fileName);
        itemService.updateItem(item);
        return "redirect:/student/home";

    }
    @PostMapping("/delete")
    public String deleteItems(HttpServletRequest request){
        if(request.getAttribute("unsafe_request") == "true") {
            return "error";
        }
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student == null){
            return "redirect:/user/show";
        }
        String[] ids = request.getParameterValues("select");
//        int[] theIds = new int[ids.length];
        int id = -1;
        for(int i = 0; i < ids.length; i++){
//            theIds[i] = Integer.parseInt(ids[i])
            id = Integer.parseInt(ids[i]);
            if(id < 0) break;
//            shopCartService.
            shopCartService.deleteShopCartByItem(id);
            orderDetailService.deleteOrderDetailByItem(id);
            itemService.deleteItem(id);
        }
        return "profile";
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
    public String editItem(HttpServletRequest request,@RequestParam("pic") MultipartFile multipartFile){
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
        String tag = request.getParameter("tag");
        String pic = request.getParameter("pic");
        item.setNum(num);
        item.setDescription(description);
        item.setPrice(price);
        item.setName(name);
        item.setTag(tag);
        String fileName = "";
        try {
            if (multipartFile != null && !multipartFile.isEmpty()) {
//                String fileRealPath = request.getSession().getServletContext().getRealPath("/resource/img/item");
                String fileRealPath = new String("/Users/quanhaonan/Documents/Neu courses/Web Tools/Final Project/Final/src/main/webapp/resource/img/item");
                System.out.println("fileRealPath "+fileRealPath);
//                int id = item.getId();
                fileName = String.valueOf(id) + ".png";
                System.out.println("fileName "+fileName);
                File fileFolder = new File(fileRealPath);
                System.out.println("fileRealPath=" + fileRealPath + "/" + fileName);
                if (!fileFolder.exists()) {
                    fileFolder.mkdirs();
                }
//                if(f)
                File file = new File(fileFolder, fileName);
                if(file.exists()){
                    file.delete();
                    file = new File(fileFolder,fileName);
                }
                multipartFile.transferTo(file);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        itemService.updateItem(item);
        return "redirect:/user/profile";
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
