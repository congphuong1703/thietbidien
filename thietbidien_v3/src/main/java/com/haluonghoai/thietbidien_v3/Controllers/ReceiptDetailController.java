package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/receiptDetail")
public class ReceiptDetailController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "chi_tiet_phieu_nhap";
    }

    @GetMapping
    public String goOrderDetail(ModelMap model) {
        return "chi_tiet_phieu_nhap";
    }

}
