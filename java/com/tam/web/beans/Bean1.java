package com.tam.web.beans;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class Bean1 {

    private List<Item> items;

    @PostConstruct
    public void init() {
        items = new ArrayList<Item>();
        add();
    }

    public void add() {
        items.add(new Item());
    }

    public void remove(Item item) {
        items.remove(item);
    }

    public void save() {
        System.out.println("items: " + items);
    }

    public List<Item> getItems() {
        return items;
    }

}