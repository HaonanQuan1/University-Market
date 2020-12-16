package com.luv2code.service.impl;

import com.luv2code.DAO.ShopCartDAO;
import com.luv2code.Entity.ShopCart;
import com.luv2code.Entity.Student;
import com.luv2code.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("ShopCartService")
@EnableTransactionManagement(proxyTargetClass = true)
public class ShopCartServiceImpl implements ShopCartService {
    @Autowired
    private ShopCartDAO shopCartDAO;
    @Override
    @Transactional
    public void updateShopCart(ShopCart shopCart) {
        shopCartDAO.updateShopCart(shopCart);
    }

    @Override
    @Transactional
    public List<ShopCart> getCarts(int studentId) {

        return shopCartDAO.getShopCarts(studentId);
    }
    @Override
    @Transactional
    public List<ShopCart> getCarts(Student student) {

        return shopCartDAO.getShopCarts(student);
    }
    @Override
    @Transactional
    public void deleteShopCart(int theID) {
        shopCartDAO.deleteShopCart(theID);
    }

    @Override
    @Transactional
    public ShopCart getShopCart(int theId) {
        return shopCartDAO.getShopCart(theId);
    }

    @Override
    @Transactional
    public void clearShopCart(Student student) {
        shopCartDAO.clearShopCart(student);
    }

    @Override
    @Transactional
    public void clearShopCart(int studentId) {
        shopCartDAO.clearShopCart(studentId);
    }

    @Override
    @Transactional
    public void deleteShopCartByItem(int theId) {
        shopCartDAO.deleteShopCartByItem(theId);
    }

//    @Override
//    public void deleteShopCartByStudent(int theId) {
//        shopCartDAO.deleteShopCartByStudent(theId);
//    }
}
