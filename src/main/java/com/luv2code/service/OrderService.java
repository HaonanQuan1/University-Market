package com.luv2code.service;

import com.luv2code.Entity.Order;
import com.luv2code.Entity.Student;

import java.util.List;

public interface OrderService {
    public void saveOrUpdate(Order order);
//    public Order getOrderByStudent(Student student);
//    public Order getOrderByStudent(int studentId);
    public Order getOrder(int theId);
    public void deleteOrder(int theId);
    public void deleteOrder(Order order);
    public List<Order> getOrders(Student student);
    public List<Order> getOrders(int studentId);
    public List<Order> getOrders();
    public void deleteOrderByStudent(int theId);
}
