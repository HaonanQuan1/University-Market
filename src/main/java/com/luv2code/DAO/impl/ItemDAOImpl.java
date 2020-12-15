package com.luv2code.DAO.impl;

import com.luv2code.DAO.ItemDAO;
import com.luv2code.Entity.Item;
import com.luv2code.Entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemDAOImpl implements ItemDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Item getItem(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Item item = session.get(Item.class,theId);
        return item;
    }

    @Override
    public List<Item> getItemsByStudent(Student student) {
        Session session = sessionFactory.getCurrentSession();
        Query<Item> query = null;
        try{
            query = session.createQuery("from Item where student =: student",Item.class);
            query.setParameter("student",student);
        }catch (Exception e){
            e.printStackTrace();
        }
        List<Item> list = query.getResultList();
        return list;
    }

    @Override
    public List<Item> getItems() {
        Session session = sessionFactory.getCurrentSession();
        Query<Item> query = null;
        try{
            query = session.createQuery("from Item",Item.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        List<Item> items = query.getResultList();
        return items;
    }

    @Override
    public List<Item> getItems(String itemName) {
        Session session = sessionFactory.getCurrentSession();
        Query<Item> query = null;
        try{
            query = session.createQuery("from Item where name =: itemName",Item.class);
            query.setParameter("itemName",itemName);
        }catch (Exception e){
            e.printStackTrace();
        }
        List<Item> list = query.getResultList();
        return list;
    }

    @Override
    public void deleteItem(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Item> query = null;
        try{
            query = session.createQuery("delete from Item where id=: theId");
            query.setParameter("theId",theId);
        }catch (Exception e){
            e.printStackTrace();
        }
        query.executeUpdate();

    }

    @Override
    public void updateItem(Item item) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(item);
    }

    @Override
    public List<Item> getItemNoStudent(Student student) {
        Session session = sessionFactory.getCurrentSession();
        Query<Item> query = null;
        try{
            query = session.createQuery("from Item where student.id <>: theId",Item.class);
//            System.out.println(student.getId());
            query.setParameter("theId",student.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }

    @Override
    public List<Item> getItemsByTag(String tag) {
        Session session = sessionFactory.getCurrentSession();
        Query<Item> query = null;
        try{
            query = session.createQuery("from Item where tag =: tag",Item.class);
            query.setParameter("tag",tag);
        }catch (Exception e){
            e.printStackTrace();
        }
        return query.getResultList();
    }
}
