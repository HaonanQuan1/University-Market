package com.luv2code.DAO;

import com.luv2code.Entity.Order;
import com.luv2code.Entity.Student;

import java.util.List;

public interface OrderDAO {
    public void updateOrder(Order order);
    public void deleteOrder(int theId);
    public void deleteOrder(Order order);
    public Order getOrder(int theId);
    public List<Order> getOrders(int studentId);
    public List<Order> getOrders(Student student);
    public List<Order> getOrders();
    public void deleteOrderByStudent(int theId);
}
