package com.luv2code.service;

import com.luv2code.Entity.ShopCart;
import com.luv2code.Entity.Student;

import java.util.List;

public interface ShopCartService {
    public void updateShopCart(ShopCart shopCart);
    public List<ShopCart> getCarts(int studentId);
    public List<ShopCart> getCarts(Student student);
    public void deleteShopCart(int theId);
    public ShopCart getShopCart(int theId);
    public void clearShopCart(Student student);
    public void clearShopCart(int studentId);
    public void deleteShopCartByItem(int theId);
//    public void deleteShopCartByStudent(int theId);

}
