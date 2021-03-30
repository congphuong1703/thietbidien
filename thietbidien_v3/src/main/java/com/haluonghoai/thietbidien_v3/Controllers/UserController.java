package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.Config.Common;
import com.haluonghoai.thietbidien_v3.DAO.*;
import com.haluonghoai.thietbidien_v3.DAO.imp.*;
import com.haluonghoai.thietbidien_v3.Models.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_nguoi_dung";
    }

    UserDao userDao = new UserDao_impl();
    ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();
    ReceiptDao receiptDao = new ReceiptDao_impl();
    OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();
    OrderDao orderDao = new OrderDao_impl();

    @GetMapping
    public String go(ModelMap model) {
        try {
            model.addAttribute("users", userDao.findAll());
            model.addAttribute("userModel", new User());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_nguoi_dung";
    }

    @PostMapping("/add")
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
            List<Order> orders = orderDao.findAllByUserId(id);
            List<Receipt> receipts = receiptDao.findByIdUser(id);
            for (Order order : orders) {
                orderDetailDao.deleteAllByOrderId(order.getId());
            }
            for (Receipt receipt : receipts) {
                receiptDetailDao.delete(receipt.getId());
            }
            receiptDao.deleteAllByUserId(id);
            orderDao.deleteAllByUserId(id);
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