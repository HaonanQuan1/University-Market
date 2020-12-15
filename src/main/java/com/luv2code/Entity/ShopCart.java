package com.luv2code.Entity;

import javax.persistence.*;

@Entity
@Table(name = "shopCart")
public class ShopCart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "num")
    private int num;

    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.DETACH,CascadeType.MERGE})
    @JoinColumn(name = "studentId")
    private Student student;

    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.DETACH,CascadeType.MERGE})
    @JoinColumn(name = "itemId")
    private Item item;

    public ShopCart() {
    }

    public ShopCart(int num, Student student, Item item) {
        this.num = num;
        this.student = student;
        this.item = item;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "ShopCart{" +
                "id=" + id +
                ", num=" + num +
                ", student=" + student +
                ", item=" + item +
                '}';
    }
}
