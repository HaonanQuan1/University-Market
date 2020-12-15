package com.luv2code.DAO.impl;

import com.luv2code.DAO.OrderDAO;
import com.luv2code.Entity.Order;
import com.luv2code.Entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public void updateOrder(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(order);
    }

    @Override
    public void deleteOrder(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Order> query = null;
        try{
            query = session.createQuery("delete from Order where id =: theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();
    }

    @Override
    public void deleteOrder(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(order);
    }

    @Override
    public Order getOrder(int theId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Order.class,theId);
//        return null;
    }

    @Override
    public List<Order> getOrders(int studentId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Order> query = null;
        try{
            query = session.createQuery("from Order where student.id =: theId",Order.class);
            query.setParameter("theId",studentId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public List<Order> getOrders(Student student) {
        Session session = sessionFactory.getCurrentSession();
        Query<Order> query = null;
        try{
            query = session.createQuery("from Order where student =: student",Order.class);
            query.setParameter("student",student);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public List<Order> getOrders() {
        Session session = sessionFactory.getCurrentSession();
        Query<Order> query = null;
        try{
            query = session.createQuery("from Order",Order.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public void deleteOrderByStudent(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Order> query = null;
        try{
            query = session.createQuery("delete from Order where student.id =:theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();
    }
}
