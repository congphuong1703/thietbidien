package com.haluonghoai.thietbidien_v3.DTO;

import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.OrderDetails;
import com.haluonghoai.thietbidien_v3.Models.Product;

import java.util.List;

public class OrderDTO {

    private Order order;
    private List<OrderDetails>  orderDetailsList;

    public OrderDTO(Order order, List<OrderDetails> orderDetailsList) {
        this.order = order;
        this.orderDetailsList = orderDetailsList;
    }

    public OrderDTO() {
    }

    public List<OrderDetails> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetails> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
