package com.luv2code.DAO.impl;

import com.luv2code.DAO.OrderDetailDAO;
import com.luv2code.Entity.Order;
import com.luv2code.Entity.OrderDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<OrderDetail> getOrderDetails(Order order) {
        Session session = sessionFactory.getCurrentSession();
        Query<OrderDetail> query = null;
        try{
            query = session.createQuery("from OrderDetail where order =: order",OrderDetail.class);
            query.setParameter("order",order);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public List<OrderDetail> getOrderDetails(int orderId) {
        Session session = sessionFactory.getCurrentSession();
        Query<OrderDetail> query = null;
        try{
            query = session.createQuery("from OrderDetail where order.id =: orderId",OrderDetail.class);
            query.setParameter("orderId",orderId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public OrderDetail getOrderDetail(int theId) {
        Session session = sessionFactory.getCurrentSession();
        OrderDetail orderDetail = session.get(OrderDetail.class,theId);
        return orderDetail;
    }

    @Override
    public void updateOrderDetail(OrderDetail orderDetail) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(orderDetail);

    }

    @Override
    public void deleteOrderDetail(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<OrderDetail> query = null;
        try{
            query = session.createQuery("delete OrderDetail where id =: theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();
    }

    @Override
    public void deleteOrderDetail(OrderDetail orderDetail) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(orderDetail);
    }

    @Override
    public void deleteOrderDetailByItem(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<OrderDetail> query = null;
        try{
            query = session.createQuery("delete from OrderDetail where item.id =: theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();;
        }
        query.executeUpdate();
    }

    @Override
    public void deleteOrderDetailByOrdre(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<OrderDetail> query = null;
        try{
            query = session.createQuery("delete from OrderDetail where order.id =: theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();
    }
}
