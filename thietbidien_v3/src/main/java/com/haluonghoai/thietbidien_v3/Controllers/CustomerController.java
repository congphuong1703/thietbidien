package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.CustomerDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CustomerDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Category;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.ws.rs.QueryParam;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_khach_hang";
    }

    CustomerDao customerDao = new CustomerDao_impl();

    @GetMapping
    public String go(Model model) {
        try {
            model.addAttribute("customers", customerDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_khach_hang";
    }

}