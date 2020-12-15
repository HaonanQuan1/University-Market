package com.luv2code;

import com.luv2code.Entity.Student;
import com.luv2code.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
@Controller
public class Test {
    @Autowired
    private  StudentServiceImpl studentService;


    public static void main(String[] args) {
//        SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Item.class)
//                .addAnnotatedClass(MyItem.class)
//                .addAnnotatedClass(Student.class).buildSessionFactory();

//        Session session = factory.getCurrentSession();

//        try{
//            System.out.println("Creating a student");
//            Student student = new Student("Jack","123","82@qq.com");
//            Item item1 = new Item("box3","123","23");
//            Item item2 = new Item("box1","123","23");
//            Item item3 = new Item("box2","123","23");
//            MyItem myItem1 = new MyItem(item1,student);
//            MyItem myItem2 = new MyItem(item2,student);
//            MyItem myItem3 = new MyItem(item3,student);
////            student.addMyItem(myItem1);
////            student.addMyItem(myItem2);
////            student.addMyItem(myItem3);
//            session.beginTransaction();
//
//            System.out.println("Saving " + myItem1 +" "+myItem2+" "+ myItem3);
//            Student st = session.get(Student.class,2);
//            List<MyItem> list = st.getMyItems();
//            for(MyItem item : list){
//                System.out.println(item);
//            }
////            session.save(student);
////            session.save(myItem1);
////            session.save(myItem2);
////            session.save(myItem3);
//            session.getTransaction().commit();
//
//        }catch (Exception e){
//            e.printStackTrace();
//        }finally {
//            factory.close();
//        }
        Test test = new Test();
        List<Student> list = test.getStudents();
        for(Student s : list){
            System.out.println(s);
        }

    }
    public  List<Student> getStudents(){

        List<Student> list = studentService.getStudents();
        return list;
    }
}
