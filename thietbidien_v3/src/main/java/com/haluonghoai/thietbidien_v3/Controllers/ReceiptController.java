package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReceiptController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "danh_sach_phieu_nhap";
    }

    @RequestMapping("/receipt")
    public String go(ModelMap model) {
        return "danh_sach_phieu_nhap";
    }

}