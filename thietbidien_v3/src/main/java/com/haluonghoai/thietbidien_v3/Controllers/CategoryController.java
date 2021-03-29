package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.CategoryDao;
import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CategoryDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.QueryParam;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_danh_muc";
    }

    private CategoryDao categoryDao = new CategoryDao_impl();
    private ProductDao productDao = new ProductDao_impl();

    @GetMapping
    public String go(ModelMap model) throws SQLException, ClassNotFoundException {
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories", categoryList);
        model.addAttribute("categoryModel", new Category());
        return "quan_ly_danh_muc";
    }

    @GetMapping("/add")
    public String add(Model model,
                      @ModelAttribute("categoryModel") Category category) throws Exception {
        List<Category> categoryList = categoryDao.findAll();

        try {
            if (category.getId() == 0) {
                categoryDao.insert(category);
                model.addAttribute("insertSuccess", true);
            } else {
                model.addAttribute("updateSuccess", true);
                categoryDao.update(category);
            }
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }
        model.addAttribute("categories", categoryList);
        model.addAttribute("categoryModel", new Category());
        return "quan_ly_danh_muc";
    }

    @GetMapping(value = "/deleteById")
    public String delete(Model model,
                         @RequestParam("id") int id) throws SQLException, ClassNotFoundException {
        try {
            productDao.deleteByCategoryId(id);
            categoryDao.delete(id);
            model.addAttribute("deleteSuccess", true);
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }

        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories", categoryList);
        model.addAttribute("categoryModel", new Category());
        return "quan_ly_danh_muc";
    }

}