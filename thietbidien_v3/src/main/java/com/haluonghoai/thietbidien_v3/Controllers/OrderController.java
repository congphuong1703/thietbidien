package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.OrderDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDao_impl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.QueryParam;

@Controller
@RequestMapping("/order")
public class OrderController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_don_hang";
    }

    OrderDao orderDao = new OrderDao_impl();

    @GetMapping
    public String go(Model model) {
        try {
            model.addAttribute("orders", orderDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_don_hang";
    }

    @GetMapping(value = "/findById")
    public String findById(@QueryParam("id") int id, Model model) {
        try {
            model.addAttribute("orders", orderDao.findById(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_don_hang";
    }


}