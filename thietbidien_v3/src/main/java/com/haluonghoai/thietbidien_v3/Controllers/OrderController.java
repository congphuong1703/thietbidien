package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.CustomerDao;
import com.haluonghoai.thietbidien_v3.DAO.OrderDao;
import com.haluonghoai.thietbidien_v3.DAO.OrderDetailDao;
import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CustomerDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDetailDao_Impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.OrderDetails;
import com.haluonghoai.thietbidien_v3.Models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.ws.rs.QueryParam;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_don_hang";
    }

    OrderDao orderDao = new OrderDao_impl();

    CustomerDao customerDao = new CustomerDao_impl();

    OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();

    ProductDao productDao = new ProductDao_impl();

    @GetMapping(value="/order/detail")
    public String orderDetail(Model model, @RequestParam("id") int id) {
        try {
            int total = 0;
            List<Product> products = new ArrayList<>();
            Order order = orderDao.findById(id);
            Customer customer = customerDao.findById(order.getIdCustomer());
            List<OrderDetails> orderDetailsList = orderDetailDao.seeDetails(order.getId());
            for (OrderDetails orderDetails : orderDetailsList) {
                Product product = productDao.findById(orderDetails.getIdProduct());
                total += product.getAmount() * product.getPrice();
                product.setTotal((int) (product.getAmount() * product.getPrice()));
                products.add(product);
            }
            model.addAttribute("order", order);
            model.addAttribute("products", products);
            model.addAttribute("customer", customer);
            model.addAttribute("total", total);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "chi_tiet_don_hang";
    }

    @RequestMapping("/order")
    public String go(Model model) {
        try {
            model.addAttribute("orders", orderDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_don_hang";
    }

    @GetMapping(value = "/order/findById")
    public String findById(@QueryParam("id") int id, Model model) {
        List<Order> orders = new ArrayList<>();
        try {
            orders.add(orderDao.findById(id));
            model.addAttribute("orders",orders );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_don_hang";
    }


}