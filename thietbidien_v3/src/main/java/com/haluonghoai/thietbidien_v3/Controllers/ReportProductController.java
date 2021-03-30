package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.util.List;

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
        List<Product> products = productDao.findAll();
        int stock = 0;
        int outOfStock = 0;
        for (Product product : products) {
            if (product.isStatus())
                stock++;
            else
                outOfStock++;
        }
        model.addAttribute("stock", stock);
        model.addAttribute("outOfStock", outOfStock);
        model.addAttribute("products", productDao.findAll());
        return "thong_ke_hang_hoa";
    }

}