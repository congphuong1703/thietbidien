package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;

@Controller
@RequestMapping("/reportProduct")
public class ReportProductController {

    private ProductDao productDao = new ProductDao_impl();

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_hang_hoa";
    }

    @GetMapping
    public String go(ModelMap model) throws SQLException, ClassNotFoundException {
        model.addAttribute("products", productDao.findAll());
        return "thong_ke_hang_hoa";
    }

}