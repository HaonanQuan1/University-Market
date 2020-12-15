package com.luv2code.DAO.impl;

import com.luv2code.DAO.ManagerDAO;
import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Manager> getManagers() {
        Session session = sessionFactory.getCurrentSession();
        Query<Manager> query = session.createQuery("from Manager",Manager.class);
        List<Manager> list = query.getResultList();
        return list;
    }

    @Override
    public void updateManager(Manager manager) {
        Session session = sessionFactory.getCurrentSession();
//        Query query = session.
        session.saveOrUpdate(manager);
    }

    @Override
    public void deleteManager(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = null;
        try{
            query = session.createQuery("delete from Manager where id =: ManagerId");
            query.setParameter("ManagerId",theId);
            query.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public Manager getManager(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Manager manager = null;
        try{
            manager = session.get(Manager.class,theId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return manager;
    }

    @Override
    public Manager getManager(String userName, String password) {
        Session session = sessionFactory.getCurrentSession();
        Query<Manager> query = null;
        Manager manager = null;
        try{
            if(userName.endsWith(".edu")){
                query = session.createQuery("from Manager where email=:userName and password=:passWord",Manager.class);
            }else{
                query = session.createQuery("from Manager where userName=:userName and password=:passWord",Manager.class);
            }
            query.setParameter("userName",userName);
            query.setParameter("passWord",password);
            manager = query.uniqueResult();
        }catch (Exception e){
            e.printStackTrace();
        }
        return manager;
    }

    @Override
    public boolean checkManager(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query<Manager> query = null;
        boolean exist = false;
        try{
            if(username.endsWith(".edu")){
                query = session.createQuery("from Manager where  email =: username",Manager.class);
//                query.setParameter("email",username);
            }else{
                query = session.createQuery("from Manager where  userName =: username",Manager.class);
            }
            query.setParameter("username",username);
            Manager manager = query.uniqueResult();
            if(manager != null){
                exist = true;
            }
//            if(query.uniqueResult())
        }catch (Exception e){
            e.printStackTrace();
        }
        return exist;
    }

}
