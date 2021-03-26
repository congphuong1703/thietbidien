package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.CategoryDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CategoryDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_danh_muc";
    }

    private CategoryDao categoryDao = new CategoryDao_impl();

    @GetMapping
    public String go(ModelMap model) throws SQLException, ClassNotFoundException {
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories", categoryList);

        return "quan_ly_danh_muc";
    }

}