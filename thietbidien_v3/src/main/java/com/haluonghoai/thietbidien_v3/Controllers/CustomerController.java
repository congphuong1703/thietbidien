package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.CustomerDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CustomerDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping(value = "/search")
    public String find(@QueryParam("name") String name,
                       @QueryParam("phoneNumber") String phoneNumber,
                       @QueryParam("email") String email,
                       @QueryParam("address") String address,
                       Model model) throws SQLException, ClassNotFoundException {

        if (name == null || name == "")
            name = "";
        if (phoneNumber == null || phoneNumber == "")
            phoneNumber = "";
        if (email == null || email == "")
            email = "";
        if (address == null || address == "")
            address = "";

        List<Customer> customers = customerDao.search(name, phoneNumber, email, address);
        model.addAttribute("customers", customers);

        return "quan_ly_khach_hang";
    }

}