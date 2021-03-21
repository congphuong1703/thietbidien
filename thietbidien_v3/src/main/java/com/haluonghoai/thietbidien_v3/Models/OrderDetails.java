package com.haluonghoai.thietbidien_v3.Models;

public class OrderDetails {
    private int idOrder;
    private int idProduct;
    private int amount;

    public OrderDetails() {
    }

    public OrderDetails(int idOrder, int idProduct, int amount) {
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.amount = amount;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "OrderDetails{" +
                "idOrder=" + idOrder +
                ", idProduct=" + idProduct +
                ", amount=" + amount +
                '}';
    }
}
