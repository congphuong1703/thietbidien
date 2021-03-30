package com.haluonghoai.thietbidien_v3.Controllers;


import com.haluonghoai.thietbidien_v3.DAO.CategoryDao;
import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CategoryDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Category;
import com.haluonghoai.thietbidien_v3.Models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.ws.rs.QueryParam;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_san_pham";
    }

    ProductDao productDao = new ProductDao_impl();

    CategoryDao categoryDao = new CategoryDao_impl();

    @GetMapping
    public String go(Model model) {
        try {
            model.addAttribute("products", productDao.findAll());
            model.addAttribute("categories", categoryDao.findAll());
            model.addAttribute("productModel", new Product());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_san_pham";
    }

    @GetMapping("/add")
    public String add(Model model,
                      @ModelAttribute("productModel") Product product) throws Exception {

        try {
            if (product.getIncreaseId() == 0) {
                Product newProduct = new Product(product);
                productDao.insert(newProduct);
                model.addAttribute("insertSuccess", true);
            } else {
                productDao.update(product);
                model.addAttribute("updateSuccess", true);
            }
        } catch (Exception e) {
            model.addAttribute("fail", true);
            e.printStackTrace();
        }
        model.addAttribute("categories", categoryDao.findAll());
        model.addAttribute("products", productDao.findAll());
        model.addAttribute("productModel", new Product());
        return "quan_ly_san_pham";
    }

    @GetMapping(value = "/deleteById")
    public String delete(Model model,
                         @RequestParam("id") int id) throws SQLException, ClassNotFoundException {
        try {
            productDao.delete(id);
            model.addAttribute("deleteSuccess", true);
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }
        model.addAttribute("categories", categoryDao.findAll());
        model.addAttribute("products", productDao.findAll());
        model.addAttribute("productModel", new Product());
        return "quan_ly_san_pham";
    }


}