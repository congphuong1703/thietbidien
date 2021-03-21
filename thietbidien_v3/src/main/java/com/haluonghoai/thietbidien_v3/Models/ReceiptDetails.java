package com.haluonghoai.thietbidien_v3.Models;

public class ReceiptDetails {
    private int idReceipt;
    private int idProduct;
    private int amount;
    private float price;

    public ReceiptDetails() {
    }

    public ReceiptDetails(int idReceipt, int idProduct, int amount, float price) {
        this.idReceipt = idReceipt;
        this.idProduct = idProduct;
        this.amount = amount;
        this.price = price;
    }

    public int getIdReceipt() {
        return idReceipt;
    }

    public void setIdReceipt(int idReceipt) {
        this.idReceipt = idReceipt;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ReceiptDetails{" +
                "idReceipt=" + idReceipt +
                ", idProduct=" + idProduct +
                ", amount=" + amount +
                ", price=" + price +
                '}';
    }
}
