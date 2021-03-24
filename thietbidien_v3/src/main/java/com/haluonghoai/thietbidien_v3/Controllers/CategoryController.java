package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.CategoryDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CategoryDao_impl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_danh_muc";
    }

    CategoryDao categoryDao = new CategoryDao_impl();

    @RequestMapping("/category")
    public String go(Model model) {

        return "quan_ly_danh_muc";
    }

}