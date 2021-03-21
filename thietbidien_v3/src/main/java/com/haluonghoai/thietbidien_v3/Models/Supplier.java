package com.haluonghoai.thietbidien_v3.Models;

public class Supplier {
    private int id;
    private String name;
    private String sdt;
    private String email;
    private String adress;

    public Supplier() {
    }

    public Supplier(int id, String name, String sdt, String email, String adress) {
        this.id = id;
        this.name = name;
        this.sdt = sdt;
        this.email = email;
        this.adress = adress;
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

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sdt='" + sdt + '\'' +
                ", email='" + email + '\'' +
                ", adress='" + adress + '\'' +
                '}';
    }
}
