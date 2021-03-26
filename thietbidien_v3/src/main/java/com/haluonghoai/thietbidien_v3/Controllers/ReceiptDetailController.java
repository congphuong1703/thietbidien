package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.ReceiptDetailDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ReceiptDetailDao_Impl;
import com.haluonghoai.thietbidien_v3.Models.ReceiptDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/receiptDetail")
public class ReceiptDetailController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "chi_tiet_phieu_nhap";
    }

    private ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();

    @GetMapping(value = "/findById")
    public String goOrderDetail(@RequestParam("id") int id, ModelMap model) {
        try {
            ReceiptDetails receiptDetails = receiptDetailDao.findById(id);
            model.addAttribute("receiptDetails", receiptDetails);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "chi_tiet_phieu_nhap";
    }

}
