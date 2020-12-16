package com.luv2code.DAO.impl;

import com.luv2code.DAO.ShopCartDAO;
import com.luv2code.Entity.ShopCart;
import com.luv2code.Entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShopCartDAOImpl implements ShopCartDAO {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public void updateShopCart(ShopCart shopCart) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(shopCart);
    }

    @Override
    public void deleteShopCart(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<ShopCart> query = null;
        try{
            query = session.createQuery("delete from ShopCart where id =: theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();

    }

    @Override
    public void deleteShopCart(ShopCart shopCart) {
        Session session = sessionFactory.getCurrentSession();
//        Query<ShopCart> query = null;
//        try{
//            query = session.createQuery()
//        }
        session.delete(shopCart);
    }

    @Override
    public List<ShopCart> getShopCarts(int studentId) {
        Session session = sessionFactory.getCurrentSession();

        Query<ShopCart> query = null;

        try{
            query = session.createQuery("from ShopCart where student.id =: theId",ShopCart.class);
            query.setParameter("theId",studentId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public List<ShopCart> getShopCarts(Student student) {
        Session session = sessionFactory.getCurrentSession();

        Query<ShopCart> query = null;

        try{
            query = session.createQuery("from ShopCart where student =: student",ShopCart.class);
            query.setParameter("student",student);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public void clearShopCart(int studentId) {
        Session session = sessionFactory.getCurrentSession();
        Query<ShopCart> query = null;
        try{
            query = session.createQuery("delete from ShopCart where student.id =: studentId");
            query.setParameter("studentId",studentId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();
    }

    @Override
    public void clearShopCart(Student student) {
        Session session = sessionFactory.getCurrentSession();
        Query<ShopCart> query = null;
        try{
            query = session.createQuery("delete from ShopCart where student =: student");
            query.setParameter("student",student);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();
    }

    @Override
    public ShopCart getShopCart(int theId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(ShopCart.class,theId);
    }

    @Override
    public void deleteShopCartByItem(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<ShopCart> query = null;
        try{
            query = session.createQuery("delete from ShopCart where item.id =: theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();
    }

//    @Override
//    public void deleteShopCartByStudent(int theId) {
//        Session session = sessionFactory.getCurrentSession();
//        Query<ShopCart> query = null;
//        try{
//            query = session.createQuery("delete from Sho")
//        }
//    }


}
