package com.luv2code.DAO;

import com.luv2code.Entity.Student;

import java.util.List;

public interface StudentDAO {
    public List<Student> getStudents();

    public void updateStudent(Student student);

    public void deleteStudent(int theId);

    public Student getStudent(int theId);

    public Student getStudent(String userName, String password);

    public boolean checkStudent(String username);
}
