package com.luv2code.DAO;

import com.luv2code.Entity.ShopCart;
import com.luv2code.Entity.Student;

import java.util.List;

public interface ShopCartDAO {
    public void updateShopCart(ShopCart shopCart);
    public void deleteShopCart(int theId);
    public void deleteShopCart(ShopCart shopCart);
    public List<ShopCart> getShopCarts(int studentId);
    public List<ShopCart> getShopCarts(Student student);
    public void clearShopCart(int studentId);
    public void clearShopCart(Student student);
    public ShopCart getShopCart(int theId);
//    public void deleteShopCartByStudent(int theId);
}
