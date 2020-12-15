package com.luv2code.service.impl;

import com.luv2code.DAO.ItemDAO;
import com.luv2code.Entity.Item;
import com.luv2code.Entity.Student;
import com.luv2code.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("ItemService")
@EnableTransactionManagement(proxyTargetClass = true)
@Transactional
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemDAO itemDAO;
    @Override
    public Item getItem(int theId) {
        return itemDAO.getItem(theId);
    }

    @Override
    public List<Item> getItemsByStudent(Student student) {
        return itemDAO.getItemsByStudent(student);
    }

    @Override
    public List<Item> getItems() {
        return itemDAO.getItems();
    }

    @Override
    public List<Item> getItems(String itemName) {
        return itemDAO.getItems(itemName);
    }

    @Override
    public void deleteItem(int theId) {
        itemDAO.deleteItem(theId);
    }

    @Override
    public void updateItem(Item item) {
        itemDAO.updateItem(item);
    }

    @Override
    public List<Item> getItemsNoStudent(Student student) {
        return itemDAO.getItemNoStudent(student);
    }

    @Override
    public List<Item> getItemsByTag(String tag) {
        return itemDAO.getItemsByTag(tag);
    }
}
