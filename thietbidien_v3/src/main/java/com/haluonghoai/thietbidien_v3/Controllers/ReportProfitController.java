package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.*;
import com.haluonghoai.thietbidien_v3.DAO.imp.*;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.Receipt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reportProfit")
public class ReportProfitController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_loi_nhuan";
    }

    private ReceiptDao receiptDao = new ReceiptDao_impl();
    private ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();
    private ProductDao productDao = new ProductDao_impl();
    private OrderDao orderDao = new OrderDao_impl();
    private OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();

    @GetMapping
    public String go(Model model) throws SQLException, ClassNotFoundException {
        List<Receipt> receipts = receiptDao.findAll();
        List<Order> orders = orderDao.findAll();
        Map<String, String> map = new HashMap<>();
        List<Map<String, String>> list = new ArrayList<>();
        List<Integer> years = receiptDao.getAllYear();
        int total = 0;
        for(Order order : orders){

        }
        return "thong_ke_loi_nhuan";
    }

}