package com.luv2code.service;

import com.luv2code.Entity.Student;
import org.springframework.stereotype.Service;

import java.util.List;
//@Service
public interface StudentService {
    public List<Student> getStudents();

    public void updateStudent(Student student);

    public void deleteStudent(int theId);

    public Student getStudent(int theId);

    public Student getStudent(String userName, String password);

    public boolean checkStudent(String username);

}
