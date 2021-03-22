package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddReceiptController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "them_phieu_nhap";
    }

    @RequestMapping("/addReceipt")
    public String go(ModelMap model) {
        return "them_phieu_nhap";
    }

}