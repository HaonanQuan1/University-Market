package com.luv2code.service.impl;

import com.luv2code.DAO.ManagerDAO;
import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;
import com.luv2code.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.transaction.Transactional;
import java.util.List;

@Service("ManagerService")
@EnableTransactionManagement(proxyTargetClass = true)

public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDAO managerDAO;
    @Override
    @Transactional
    public List<Manager> getManagers() {

        return managerDAO.getManagers();
    }

    @Override
    @Transactional
    public void updateManager(Manager manager) {
        managerDAO.updateManager(manager);
    }

    @Override
    @Transactional
    public void deleteManager(int theId) {
        managerDAO.deleteManager(theId);
    }

    @Override
    @Transactional
    public Manager getManager(int theId) {

        return managerDAO.getManager(theId);
    }

    @Override
    @Transactional
    public Manager getManager(String userName, String password) {
        return managerDAO.getManager(userName,password);
    }

    @Override
    @Transactional
    public boolean checkManager(String username) {
        return managerDAO.checkManager(username);
    }
}
