package com.luv2code.Entity;

import javax.persistence.*;
public class MyItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

//    @Column(name = "itemId")
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "itemId")
    private Item item;

    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name = "studentId")
    private Student student;

    @Column(name = "num")
    private int num;

    public MyItem() {
    }

    public MyItem(Item item, Student student) {
        this.item = item;
        this.student = student;
        this.num = 1;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
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

    @Override
    public String toString() {
        return "MyItem{" +
                "id=" + id +
                ", item=" + item +
                ", student=" + student +
                ", num=" + num +
                '}';
    }
}
