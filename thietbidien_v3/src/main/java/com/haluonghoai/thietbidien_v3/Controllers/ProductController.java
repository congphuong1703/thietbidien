package com.haluonghoai.thietbidien_v3.Controllers;


import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.QueryParam;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_san_pham";
    }

    ProductDao productDao = new ProductDao_impl();

    @RequestMapping("/product")
    public String go(Model model) {
        try {
            model.addAttribute("products", productDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_san_pham";
    }

    @GetMapping(value = "/product/search")
    public String findByName(Model model, @QueryParam("code") String code,
                             @QueryParam("name") String name,
                             @QueryParam("price") int price,
                             @QueryParam("status") String status) {
        try {
            model.addAttribute("products", productDao.search(code, name, price , status == "1" ? true : false));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_san_pham";
    }

}