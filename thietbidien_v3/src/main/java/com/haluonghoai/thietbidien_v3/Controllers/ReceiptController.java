package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ReceiptDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Receipt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "danh_sach_phieu_nhap";
    }

    ReceiptDao receiptDao = new ReceiptDao_impl();

    @GetMapping
    public String go(Model model) {
        try {
            model.addAttribute("receipts", receiptDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "danh_sach_phieu_nhap";
    }

    @GetMapping(value = "/add")
    public String addReceipt(Model model) {
        return "them_phieu_nhap";
    }

}