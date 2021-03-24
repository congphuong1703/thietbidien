package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.CustomerDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CustomerDao_impl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_khach_hang";
    }

    CustomerDao customerDao = new CustomerDao_impl();

    @RequestMapping("/customer")
    public String go(Model model) {
        try {
            model.addAttribute("customers", customerDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_khach_hang";
    }

}