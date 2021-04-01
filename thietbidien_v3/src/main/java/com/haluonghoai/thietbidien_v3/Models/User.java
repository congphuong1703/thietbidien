package com.haluonghoai.thietbidien_v3.Models;

import java.sql.Date;

public class User {
    private int id;
    private String name;
    private String email;
    private String adress;
    private String phonenumber;
    private Date dateOfBirth;
    private String pass;
    private int idQuyen;

    public User() {
    }

    public User(int id, String name, String email, String adress, String phonenumber, Date dateOfBirth, String pass, int idQuyen) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.adress = adress;
        this.phonenumber = phonenumber;
        this.dateOfBirth = dateOfBirth;
        this.pass = pass;
        this.idQuyen = idQuyen;
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

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIdQuyen() {
        return idQuyen;
    }

    public void setIdQuyen(int idQuyen) {
        this.idQuyen = idQuyen;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", adress='" + adress + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", pass='" + pass + '\'' +
                ", idQuyen=" + idQuyen +
                '}';
    }
}
