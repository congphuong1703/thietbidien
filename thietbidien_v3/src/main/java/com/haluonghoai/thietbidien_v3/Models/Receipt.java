package com.haluonghoai.thietbidien_v3.Models;

import java.util.Date;

public class Receipt {
    private int id;
    private Date timeCreate;
    private String note;
    private int idUser;
    private int idSupplier;
    private Boolean statusEnter;
    private String userName;
    private String supplierName;

    public Receipt() {
    }

    public Receipt(int id, Date timeCreate, String note, int idUser, int idSupplier, Boolean statusEnter) {
        this.id = id;
        this.timeCreate = timeCreate;
        this.note = note;
        this.idUser = idUser;
        this.idSupplier = idSupplier;
        this.statusEnter = statusEnter;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTimeCreate() {
        return timeCreate;
    }

    public void setTimeCreate(Date timeCreate) {
        this.timeCreate = timeCreate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public Boolean getStatusEnter() {
        return statusEnter;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public void setStatusEnter(Boolean statusEnter) {
        this.statusEnter = statusEnter;
    }

    @Override
    public String toString() {
        return "Receipt{" +
                "id=" + id +
                ", timeCreate=" + timeCreate +
                ", note='" + note + '\'' +
                ", idUser=" + idUser +
                ", idSupplier=" + idSupplier +
                ", statusEnter=" + statusEnter +
                '}';
    }
}
