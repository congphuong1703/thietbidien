package com.haluonghoai.thietbidien_v3.Models;

public class Product {
    private int increaseId;
    private String id;
    private String name;
    private float price;
    private String image;
    private boolean status; // false là còn hàng, true là hết hàng
    private String description;
    private int amount;
    private String specification;
    private int guarantee;
    private String unit;
    private int categoryId;
    private int total;

    public Product() {
    }

    public Product(Product product) {
        this.id = product.getId();
        this.name = product.getName();
        this.price = product.getPrice();
        this.image = product.getImage();
        this.status = product.isStatus();
        this.description = product.getDescription();
        this.amount = product.getAmount();
        this.specification = product.getSpecification();
        this.guarantee = product.getGuarantee();
        this.unit = product.getUnit();
        this.categoryId = product.getCategoryId();
    }

    public Product(int increaseId, String id, String name, float price, String image, boolean status, String description, int amount, String specification, int guarantee, String unit, int categoryId) {
        this.increaseId = increaseId;
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.status = status;
        this.description = description;
        this.amount = amount;
        this.specification = specification;
        this.guarantee = guarantee;
        this.unit = unit;
        this.categoryId = categoryId;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getIncreaseId() {
        return increaseId;
    }

    public void setIncreaseId(int increaseId) {
        this.increaseId = increaseId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public int getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(int guarantee) {
        this.guarantee = guarantee;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Product{" +
                "increaseId=" + increaseId +
                ", id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", status=" + status +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", specification='" + specification + '\'' +
                ", guarantee=" + guarantee +
                ", unit='" + unit + '\'' +
                ", categoryId=" + categoryId +
                '}';
    }
}
