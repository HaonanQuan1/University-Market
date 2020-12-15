package com.luv2code.DAO;

import com.luv2code.Entity.Order;
import com.luv2code.Entity.OrderDetail;

import java.util.List;

public interface OrderDetailDAO {
    public List<OrderDetail> getOrderDetails(Order order);
    public List<OrderDetail> getOrderDetails(int orderId);
    public OrderDetail getOrderDetail(int theId);
    //    public OrderDetail getOrderDetail()
    public void updateOrderDetail(OrderDetail orderDetail);
    public void deleteOrderDetail(int theId);
    public void deleteOrderDetail(OrderDetail orderDetail);
//    public void clear
    public void deleteOrderDetailByItem(int theId);
    public void deleteOrderDetailByOrdre(int theId);
}
