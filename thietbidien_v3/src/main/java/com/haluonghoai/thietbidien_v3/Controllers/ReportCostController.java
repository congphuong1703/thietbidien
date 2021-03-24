package com.haluonghoai.thietbidien_v3.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reportCost")
public class ReportCostController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_chi_phi";
    }

    @GetMapping
    public String go(ModelMap model) {
        return "thong_ke_chi_phi";
    }

}