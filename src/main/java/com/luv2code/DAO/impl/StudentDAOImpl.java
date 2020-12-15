package com.luv2code.DAO.impl;

import com.luv2code.DAO.StudentDAO;
import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Queue;

@Repository
public class StudentDAOImpl implements StudentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Student> getStudents() {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> theQuery = null;
        try{
            theQuery = session.createQuery("from Student",Student.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        List<Student> list = theQuery.getResultList();
        return list;
    }

    @Override
    public void updateStudent(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(student);
    }

    @Override
    public void deleteStudent(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Student where id=:studentId");
        query.setParameter("studentId",theId);
        query.executeUpdate();
    }

    @Override
    public Student getStudent(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        // now retrieve/read from database using the primary key
        Student st = currentSession.get(Student.class, theId);
        return st;
    }

    @Override
    public Student getStudent(String username, String password) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> q = null;
        Student student = null;
        try{
            if(username.endsWith(".com")) {
                q = session.createQuery("from Student where email=:userName and password=:passWord", Student.class);
            }else{
                q = session.createQuery("from Student where userName=:userName and password=:passWord",Student.class);
            }
            q.setParameter("userName",username);
            q.setParameter("passWord",password);
            student =  q.uniqueResult();
            System.out.println(student);
        }catch (Exception e){
            e.printStackTrace();
        }

        return student;
    }

    @Override
    public boolean checkStudent(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = null;
        boolean exist = false;
        try{
            if(username.endsWith(".com")){
                query = session.createQuery("from Student where  email =: username",Student.class);
//                query.setParameter("email",username);
            }else{
                query = session.createQuery("from Student where  userName =: username",Student.class);
            }
            query.setParameter("username",username);
            Student student = query.uniqueResult();
            if(student != null){
                exist = true;
            }
//            if(query.uniqueResult())
        }catch (Exception e){
            e.printStackTrace();
        }
        return exist;
    }

//    @Override


}
