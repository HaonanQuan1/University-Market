package com.luv2code.Entity;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "student")
public class Student{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "balance")
    private double balance;

    @Column(name = "address")
    private String address;

    @Column(name = "username")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "college")
    private String college;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "student", cascade = CascadeType.ALL)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<Item> myItems;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "student", cascade = CascadeType.ALL)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<Order> orders;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "student")
//    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<ShopCart> shopCarts;

    public Student() {
    }

    public Student(String userName, String password, String email) {
        this.userName = userName;
        this.password = password;
        this.email = email;
//        this.firstName = firstName;
//        this.lastName = lastName;
    }
    public void addMyItem(Item item){
        if(myItems == null){
            myItems = new ArrayList<>();
        }
        myItems.add(item);
        item.setStudent(this);
    }
    public void addCart(ShopCart cart){
        if(shopCarts == null){
            shopCarts = new ArrayList<>();
        }
        shopCarts.add(cart);
    }
    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public List<ShopCart> getShopCarts() {
        return shopCarts;
    }

    public void setShopCarts(List<ShopCart> shopCarts) {
        this.shopCarts = shopCarts;
    }

    public List<Item> getMyItems() {
        return myItems;
    }

    public void setMyItems(List<Item> myItems) {
        this.myItems = myItems;
    }

    public int getId() {
        return id;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void addOrders(Order order){
        if(orders == null){
            orders = new ArrayList<>();
        }
        orders.add(order);
    }
    @Override
    public String toString() {
        return "Student{" +
                "balance=" + balance +
                ", address='" + address + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", college='" + college + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}
