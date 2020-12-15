package com.luv2code.service.impl;

import com.luv2code.DAO.OrderDetailDAO;
import com.luv2code.Entity.Order;
import com.luv2code.Entity.OrderDetail;
import com.luv2code.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("OrderDetailService")
@Transactional
@EnableTransactionManagement(proxyTargetClass = true)
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailDAO orderDetailDAO;
    @Override
    public List<OrderDetail> getOrderDetails(Order order) {
        return orderDetailDAO.getOrderDetails(order);
//        return null;
    }

    @Override
    public List<OrderDetail> getOrderDetails(int orderId) {
       return orderDetailDAO.getOrderDetails(orderId);
    }

    @Override
    public OrderDetail getOrderDetail(int theId) {
        return orderDetailDAO.getOrderDetail(theId);
    }

    @Override
    public void updateOrderDetail(OrderDetail orderDetail) {
        orderDetailDAO.updateOrderDetail(orderDetail);
    }

    @Override
    public void deleteOrderDetail(int theId) {
        orderDetailDAO.deleteOrderDetail(theId);
    }

    @Override
    public void deleteOrderDetail(OrderDetail orderDetail) {
        orderDetailDAO.deleteOrderDetail(orderDetail);
    }

    @Override
    public void deleteOrderDetailByItem(int theId) {
        orderDetailDAO.deleteOrderDetailByItem(theId);
    }

    @Override
    public void deleteOrderDetailByOrder(int theId) {
        orderDetailDAO.deleteOrderDetailByOrdre(theId);
    }
}
