package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.SupplierDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.SupplierDap_impl;
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

    SupplierDao supplierDao = new SupplierDap_impl();

    @RequestMapping("/supplier")
    public String go(ModelMap model) {
        try {
            model.addAttribute("suppliers", supplierDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_nha_cung_cap";
    }

}