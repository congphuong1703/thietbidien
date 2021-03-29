package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.UserDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.UserDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLException;

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
            model.addAttribute("userModel", new User());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_nguoi_dung";
    }

    @GetMapping("/add")
    public String add(Model model,
                      @ModelAttribute("userModel") User user) throws Exception {

        try {
            if (user.getId() == 0) {
                userDao.insert(user);
                model.addAttribute("insertSuccess", true);
            } else {
                userDao.update(user);
                model.addAttribute("updateSuccess", true);
            }
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }
        model.addAttribute("users", userDao.findAll());
        model.addAttribute("userModel", new User());
        return "quan_ly_nguoi_dung";
    }

    @GetMapping(value = "/deleteById")
    public String delete(Model model,
                         @RequestParam("id") int id) throws SQLException, ClassNotFoundException {
        try {
            userDao.delete(id);
            model.addAttribute("deleteSuccess", true);
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }
        model.addAttribute("users", userDao.findAll());
        model.addAttribute("userModel", new User());
        return "quan_ly_nguoi_dung";
    }

}