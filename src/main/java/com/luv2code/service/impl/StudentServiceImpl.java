package com.luv2code.service.impl;

import com.luv2code.DAO.StudentDAO;
import com.luv2code.Entity.Student;
import com.luv2code.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("StudentService")
@EnableTransactionManagement(proxyTargetClass = true)
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDAO studentDAO;

    @Override
    @Transactional
    public List<Student> getStudents() {
        return studentDAO.getStudents();
    }

    @Override
    @Transactional
    public void updateStudent(Student student) {
        studentDAO.updateStudent(student);
    }

    @Override
    @Transactional
    public void deleteStudent(int theId) {
        studentDAO.deleteStudent(theId);
    }

    @Override
    @Transactional
    public Student getStudent(int theId) {
        return studentDAO.getStudent(theId);
    }

    @Override
    @Transactional

    public Student getStudent(String userName, String password) {
        return studentDAO.getStudent(userName,password);
    }

    @Override
    @Transactional
    public boolean checkStudent(String username) {
        return studentDAO.checkStudent(username);
    }
}
