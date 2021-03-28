package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.OrderDao;
import com.haluonghoai.thietbidien_v3.DAO.OrderDetailDao;
import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDetailDao_Impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.OrderDetails;
import com.haluonghoai.thietbidien_v3.Models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reportRevenue")
public class ReportRevenueController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_doanh_thu";
    }

    private OrderDao orderDao = new OrderDao_impl();
    private OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();
    private ProductDao productDao = new ProductDao_impl();


    @GetMapping
    public String go(ModelMap model) throws Exception {
        List<Map<String, String>> list = new ArrayList<>();
        Map<String, String> map = new HashMap<>();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        DecimalFormat format = new DecimalFormat("#,##0");

        List<Order> orders = orderDao.findAll();
        long totalRevenue = 0;
        for (Order order : orders) {
            int totalProduct = 0;
            int revenue = 0;
            List<OrderDetails> orderDetailsList = orderDetailDao.seeDetails(order.getId());
            for (OrderDetails orderDetails : orderDetailsList) {
                Product product = productDao.findById(orderDetails.getIdProduct());
                totalProduct += orderDetails.getAmount();
                revenue += product.getPrice() * orderDetails.getAmount();
                totalRevenue += revenue;
            }

            map.put("idOrder", String.valueOf(order.getId()));
            map.put("totalProduct", String.valueOf(totalProduct));
            map.put("date", simpleDateFormat.format(order.getTimecreate()));
            map.put("totalProduct", format.format(totalProduct));
            map.put("revenue", format.format(revenue));
            list.add(map);
        }

        model.addAttribute("listReport", list);
        model.addAttribute("total", format.format(totalRevenue));
        return "thong_ke_doanh_thu";
    }

}