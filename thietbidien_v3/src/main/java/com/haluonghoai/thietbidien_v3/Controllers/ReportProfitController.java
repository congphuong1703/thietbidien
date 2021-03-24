package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reportProfit")
public class ReportProfitController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_loi_nhuan";
    }

    public String go(Model model) {
        return "thong_ke_loi_nhuan";
    }

}