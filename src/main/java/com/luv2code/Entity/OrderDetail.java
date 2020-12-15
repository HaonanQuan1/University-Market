package com.luv2code.Entity;

import javax.persistence.*;

@Entity
@Table(name = "orderDetail")
public class OrderDetail {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.DETACH,CascadeType.MERGE})
    @JoinColumn(name = "itemId")
    private Item item;

    @Column(name = "num")
    private int num;

    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.DETACH,CascadeType.MERGE})
    @JoinColumn(name = "orderId")
    private Order order;

    public OrderDetail() {
    }

    public OrderDetail(Item item, int num, Order order) {
        this.item = item;
        this.num = num;
        this.order = order;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", item=" + item +
                ", num=" + num +
                ", order=" + order +
                '}';
    }
}
