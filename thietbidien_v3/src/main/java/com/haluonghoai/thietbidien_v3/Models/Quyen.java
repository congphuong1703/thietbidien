package com.haluonghoai.thietbidien_v3.Models;

public class Quyen {
    private int id;
    private String name;

    public Quyen() {
    }

    public Quyen(int id, String name) {
        this.id = id;
        this.name = name;
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

    @Override
    public String toString() {
        return "Quyen{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
