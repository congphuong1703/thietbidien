package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SupplierController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_nha_cung_cap";
    }

    @RequestMapping("/supplier")
    public String go(ModelMap model) {
        return "quan_ly_nha_cung_cap";
    }

}