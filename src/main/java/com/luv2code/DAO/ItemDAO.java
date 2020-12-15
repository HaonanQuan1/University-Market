package com.luv2code.DAO;

import com.luv2code.Entity.Item;
import com.luv2code.Entity.Student;

import java.util.List;

public interface ItemDAO {
    public Item getItem(int theId);
    public List<Item> getItemsByStudent(Student student);
    public List<Item> getItems();
    public List<Item> getItems(String itemName);
    public void deleteItem(int theId);

    public void updateItem(Item item);
    public List<Item> getItemNoStudent(Student student);
    public List<Item> getItemsByTag(String tag);
}
