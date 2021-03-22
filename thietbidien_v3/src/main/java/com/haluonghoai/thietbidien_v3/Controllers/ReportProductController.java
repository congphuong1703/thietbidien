package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportProductController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_san_pham";
    }

    @RequestMapping("/reportProduct")
    public String go(ModelMap model) {
        return "thong_ke_san_pham";
    }

}