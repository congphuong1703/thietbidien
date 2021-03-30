package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.DAO.SupplierDao;
import com.haluonghoai.thietbidien_v3.DAO.UserDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ReceiptDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.SupplierDap_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.UserDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Receipt;
import com.haluonghoai.thietbidien_v3.Models.Supplier;
import com.haluonghoai.thietbidien_v3.Models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.QueryParam;
import java.sql.SQLException;
import java.util.*;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "danh_sach_phieu_nhap";
    }

    ReceiptDao receiptDao = new ReceiptDao_impl();
    UserDao userDao = new UserDao_impl();
    SupplierDao supplierDao = new SupplierDap_impl();
    ProductDao productDao = new ProductDao_impl();

    @GetMapping
    public String go(Model model) {
        List<Receipt> receipts = new ArrayList<>();
        try {
            for (Receipt receipt : receiptDao.findAll()) {
                User user = userDao.findById(receipt.getIdUser());
                Supplier supplier = supplierDao.findById(receipt.getIdSupplier());
                receipt.setSupplierName(supplier.getName());
                receipt.setUserName(user.getName());
                receipts.add(receipt);
            }
            model.addAttribute("receipts", receipts);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "danh_sach_phieu_nhap";
    }

    @GetMapping("/add")
    public String goAddReceipt(Model model) throws SQLException, ClassNotFoundException {
        model.addAttribute("products", productDao.findAllByStock());
        model.addAttribute("suppliers", supplierDao.findAll());
        model.addAttribute("users", userDao.findAll());
        return "them_phieu_nhap";
    }

    @GetMapping("/search")
    public String search(Model model, @QueryParam("query") String query) {
        List<Receipt> receipts = new ArrayList<>();
        try {
            List<User> users = userDao.searchByName(query);
            List<Supplier> suppliers = supplierDao.searchByName(query);

            for (User user : users) {
                receipts.addAll(receiptDao.findByIdUser(user.getId()));
                Set<Receipt> receiptSet = new HashSet<>(receipts);
                receipts.addAll(receiptSet);
            }

            for (Supplier supplier : suppliers) {
                receipts.addAll(receiptDao.findByIdSupplier(supplier.getId()));
                Set<Receipt> receiptSet = new HashSet<>(receipts);
                receipts.addAll(receiptSet);
            }

            for (Receipt receipt : receipts) {
                User user = userDao.findById(receipt.getIdUser());
                Supplier supplier = supplierDao.findById(receipt.getIdSupplier());
                receipt.setSupplierName(supplier.getName());
                receipt.setUserName(user.getName());
            }
        } catch (Exception e) {
            return "redirect:/receipt";
        }

        model.addAttribute("receipts", receipts);

        return "danh_sach_phieu_nhap";
    }

}