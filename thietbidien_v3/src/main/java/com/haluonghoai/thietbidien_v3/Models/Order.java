package com.haluonghoai.thietbidien_v3.Models;

import java.util.Date;

public class Order {
    private int id;
    private Date timecreate;
    private String note;
    private int idUser;
    private int idCustomer;
    private int idOrderstatus;
    private boolean statusPaments; // 0 là chưa thanh toán, 1 là đã thanh toán
    private boolean payments; // 0 là thanh toán sau khi nhận hàng, 1 là chuyển khoản

    public Order() {
    }

    public Order(int id, Date timecreate, String note, int idUser, int idCustomer, int idOrderstatus, boolean statusPaments, boolean payments) {
        this.id = id;
        this.timecreate = timecreate;
        this.note = note;
        this.idUser = idUser;
        this.idCustomer = idCustomer;
        this.idOrderstatus = idOrderstatus;
        this.statusPaments = statusPaments;
        this.payments = payments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTimecreate() {
        return timecreate;
    }

    public void setTimecreate(Date timecreate) {
        this.timecreate = timecreate;
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

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public int getIdOrderstatus() {
        return idOrderstatus;
    }

    public void setIdOrderstatus(int idOrderstatus) {
        this.idOrderstatus = idOrderstatus;
    }

    public boolean isStatusPaments() {
        return statusPaments;
    }

    public void setStatusPaments(boolean statusPaments) {
        this.statusPaments = statusPaments;
    }

    public boolean isPayments() {
        return payments;
    }

    public void setPayments(boolean payments) {
        this.payments = payments;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", timecreate=" + timecreate +
                ", note='" + note + '\'' +
                ", idUser=" + idUser +
                ", idCustomer=" + idCustomer +
                ", idOrderstatus=" + idOrderstatus +
                ", statusPaments=" + statusPaments +
                ", payments=" + payments +
                '}';
    }
}
