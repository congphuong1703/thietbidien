package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderDetailController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "chi_tiet_don_hang";
    }

    @RequestMapping("/order-detail")
    public String go(ModelMap model) {
        return "chi_tiet_don_hang";
    }
}
