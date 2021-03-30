package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.*;
import com.haluonghoai.thietbidien_v3.DAO.imp.*;
import com.haluonghoai.thietbidien_v3.Models.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.QueryParam;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_don_hang";
    }

    OrderDao orderDao = new OrderDao_impl();

    CustomerDao customerDao = new CustomerDao_impl();

    OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();

    ProductDao productDao = new ProductDao_impl();


    @GetMapping(value = "/orderDetail")
    public String orderDetail(Model model, @RequestParam("id") int id) {
        try {
            int total = 0;
            List<Map<String, Object>> list = new ArrayList<>();
            Order order = orderDao.findById(id);
            Customer customer = customerDao.findById(order.getIdCustomer());
            List<OrderDetails> orderDetailsList = new ArrayList<>(orderDetailDao.seeDetails(order.getId()));
            for (OrderDetails orderDetails : orderDetailsList) {
                Map<String, Object> map = new HashMap<>();
                long money = 0;
                Product product = productDao.findById(orderDetails.getIdProduct());

                money += product.getPrice() * orderDetails.getAmount();
                map.put("money", money);
                map.put("productId", product.getId());
                map.put("productName", product.getName());
                map.put("amount", orderDetails.getAmount());
                map.put("price", product.getPrice());
                map.put("productIncrease", product.getIncreaseId());

                total += orderDetails.getAmount() * product.getPrice();
                list.add(map);
            }
            model.addAttribute("list", list);
            model.addAttribute("orderDetailsModel", new OrderDetails());
            model.addAttribute("order", order);
            model.addAttribute("products", productDao.findAllByStock());
            model.addAttribute("customer", customer);
            model.addAttribute("total", total);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "chi_tiet_don_hang";
    }

    @PostMapping(value = "/addOrderDetails")
    public String addOrderDetails(Model model,
                                  @ModelAttribute("orderDetailsModel") OrderDetails orderDetails) {
        try {
            OrderDetails orderDetails1 = orderDetailDao.findByOrderIdAndProductId(orderDetails.getIdOrder(), orderDetails.getIdProduct());
            if (orderDetails1 == null) {
                orderDetailDao.insert(orderDetails);
            } else {
                orderDetailDao.update(orderDetails);
                model.addAttribute("updateSuccess", true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("fail", true);
        }
        return "redirect:/order/orderDetail?id=" + orderDetails.getIdOrder();
    }

    @GetMapping(value = "/deleteByOrderDetailsId")
    public String delete(Model model,
                         @RequestParam("idOrder") int idOrder,
                         @RequestParam("idProduct") int idProduct) throws SQLException, ClassNotFoundException {
        try {
            OrderDetails orderDetails = orderDetailDao.findByOrderIdAndProductId(idOrder, idProduct);
            Order order = orderDao.findById(idOrder);
            if(order.getIdOrderstatus() != 1) {
                Product product = productDao.findById(idProduct);
                int amount = product.getAmount() + orderDetails.getAmount();
                product.setAmount(amount);
                productDao.update(product);
            }
            orderDetailDao.deleteByOrderIdAndProductId(idOrder, idProduct);
            model.addAttribute("deleteSuccess", true);
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }
        return "redirect:/order/orderDetail?id=" + idOrder;
    }


    @GetMapping
    public String go(Model model) {
        try {
            model.addAttribute("orders", orderDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_don_hang";
    }


}