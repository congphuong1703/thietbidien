package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.SupplierDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.SupplierDap_impl;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.Supplier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLException;


@Controller
@RequestMapping("/supplier")
public class SupplierController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "quan_ly_nha_cung_cap";
    }

    SupplierDao supplierDao = new SupplierDap_impl();

    @GetMapping
    public String go(ModelMap model) {
        try {
            model.addAttribute("suppliers", supplierDao.findAll());
            model.addAttribute("supplierModel", new Supplier());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "quan_ly_nha_cung_cap";
    }

    @GetMapping("/add")
    public String add(Model model,
                      @ModelAttribute("supplierModel") Supplier supplier) throws Exception {

        try {
            if (supplier.getId() == 0) {
                supplierDao.insert(supplier);
                model.addAttribute("insertSuccess", true);
            } else {
                model.addAttribute("updateSuccess", true);
                supplierDao.update(supplier);
            }
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }
        model.addAttribute("suppliers", supplierDao.findAll());
        model.addAttribute("supplierModel", new Supplier());
        return "quan_ly_nha_cung_cap";
    }

    @GetMapping(value = "/deleteById")
    public String delete(Model model,
                         @RequestParam("id") int id) throws SQLException, ClassNotFoundException {
        try {
            supplierDao.delete(id);
            model.addAttribute("deleteSuccess", true);
        } catch (Exception e) {
            model.addAttribute("fail", true);
        }

        model.addAttribute("suppliers", supplierDao.findAll());
        model.addAttribute("supplierModel", new Supplier());
        return "quan_ly_nha_cung_cap";
    }



}