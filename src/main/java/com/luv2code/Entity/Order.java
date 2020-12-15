package com.luv2code.Entity;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "`order`")
public class Order {

    @Id
    @Column(name = "id")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentId")
    private Student student;

    @Column(name = "totalPrice")
    private double totalPrice;

    @Column(name = "date")
    private String date;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "order", cascade = CascadeType.ALL)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<OrderDetail> detailList;

    public Order() {
    }

    public Order(Student student, double totalPrice) {
        this.student = student;
        this.totalPrice = totalPrice;
//        this.date = new Date();
        this.date = new Date().toString();
    }

    public List<OrderDetail> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<OrderDetail> detailList) {
        this.detailList = detailList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    public void addOrderDetail(OrderDetail orderDetail){
        if(detailList == null){
            detailList = new ArrayList<>();
        }
        detailList.add(orderDetail);
    }
    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", student=" + student +
                ", totalPrice=" + totalPrice +
                ", date=" + date +
                '}';
    }
}
