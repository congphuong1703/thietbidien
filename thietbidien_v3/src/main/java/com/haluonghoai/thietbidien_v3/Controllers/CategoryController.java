package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.*;
import com.haluonghoai.thietbidien_v3.DAO.imp.*;
import com.haluonghoai.thietbidien_v3.Models.*;
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
    private OrderDao orderDao = new OrderDao_impl();
    private ReceiptDao receiptDao = new ReceiptDao_impl();
    private ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();
    private OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();

    @GetMapping
    public String go(ModelMap model) throws SQLException, ClassNotFoundException {
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories", categoryList);
        model.addAttribute("categoryModel", new Category());
        return "quan_ly_danh_muc";
    }

    @GetMapping("/add")
    public String add(Model model, @ModelAttribute("categoryModel") Category category) throws Exception {
        try {
            if (category.getId() == 0) {
                categoryDao.insert(category);
                model.addAttribute("insertSuccess", true);
            } else {
                categoryDao.update(category);
                model.addAttribute("updateSuccess", true);
            }
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }
        model.addAttribute("categories", categoryDao.findAll());
        model.addAttribute("categoryModel", new Category());
        return "quan_ly_danh_muc";
    }

    @GetMapping(value = "/deleteById")
    public String delete(Model model,
                         @RequestParam("id") int id) throws SQLException, ClassNotFoundException {
        try {
            List<Product> products = productDao.findAllByCategoryId(id);
            for (Product product : products) {
                List<OrderDetails> orderDetailsList = orderDetailDao.findAllByProductId(product.getIncreaseId());
                orderDetailDao.deleteAllByProductId(product.getIncreaseId());
                for (OrderDetails orderDetails : orderDetailsList) {
                    orderDao.delete(orderDetails.getIdOrder());
                }
            }
            for (Product product : products) {
                List<ReceiptDetails> receiptDetailsList = receiptDetailDao.findAllByProductId(product.getIncreaseId());
                receiptDetailDao.deleteAllByProductId(product.getIncreaseId());
                for (ReceiptDetails receiptDetails : receiptDetailsList) {
                    receiptDao.delete(receiptDetails.getIdReceipt());
                }
            }
            productDao.deleteAllByCategoryId(id);
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