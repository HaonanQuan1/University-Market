package com.luv2code.service.impl;

import com.luv2code.DAO.OrderDAO;
import com.luv2code.Entity.Order;
import com.luv2code.Entity.Student;
import com.luv2code.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("OrderService")
@Transactional
@EnableTransactionManagement(proxyTargetClass = true)
public class OrderServiceImpl  implements OrderService {

    @Autowired
    private OrderDAO orderDAO;
    @Override
    public void saveOrUpdate(Order order) {
        orderDAO.updateOrder(order);
    }

    @Override
    public Order getOrder(int theId) {
        return orderDAO.getOrder(theId);
    }

    @Override
    public void deleteOrder(int theId) {
        orderDAO.deleteOrder(theId);
    }

    @Override
    public void deleteOrder(Order order) {
        orderDAO.deleteOrder(order);
    }

    @Override
    public List<Order> getOrders(Student student) {
        return orderDAO.getOrders(student);
    }

    @Override
    public List<Order> getOrders(int studentId) {
        return orderDAO.getOrders(studentId);
    }

    @Override
    public List<Order> getOrders() {
        return  orderDAO.getOrders();
    }

    @Override
    public void deleteOrderByStudent(int theId) {
        orderDAO.deleteOrderByStudent(theId);
    }

}
