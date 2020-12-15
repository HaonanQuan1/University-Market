package com.luv2code.Entity;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Item")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private String price;

    @Column(name = "description")
    private String description;

    @Column(name = "tag")
    private String tag;

    @Column(name = "pic")
    private String pic;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "item")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<OrderDetail> orderDetail;

    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.DETACH,CascadeType.MERGE})
    @JoinColumn(name = "studentId")
    private Student student;


    @OneToMany(cascade = CascadeType.ALL,mappedBy = "item")
    private List<ShopCart> shopCarts;

//    @OneToOne(cascade = CascadeType.ALL)
//    private OrderDetail orderDetail;

    @Column(name = "num")
    private int num;
    public Item() {
    }

    public Item(String name, String price, String description) {
        this.name = name;
        this.price = price;
        this.description = description;
    }

    public String getTag() {
        return tag;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public List<ShopCart> getShopCarts() {
        return shopCarts;
    }

    public void setShopCarts(List<ShopCart> shopCarts) {
        this.shopCarts = shopCarts;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
