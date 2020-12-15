package com.luv2code.service;

import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;

import java.util.List;

public interface ManagerService {
    public List<Manager> getManagers();

    public void updateManager(Manager manager);

    public void deleteManager(int theId);

    public Manager getManager(int theId);

    public Manager getManager(String userName, String password);

    public boolean checkManager(String username);
}
