package com.haluonghoai.thietbidien_v3.Controllers;

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

    @RequestMapping("/user")
    public String go(ModelMap model) {
        return "quan_ly_nguoi_dung";
    }

}