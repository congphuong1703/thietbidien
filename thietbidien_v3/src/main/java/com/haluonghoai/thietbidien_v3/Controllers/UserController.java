package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.UserDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.UserDao_impl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_nguoi_dung";
    }

    UserDao userDao = new UserDao_impl();

    @RequestMapping("/user")
    public String go(ModelMap model) {
        try {
            model.addAttribute("users", userDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_nguoi_dung";
    }

}