package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.*;
import com.haluonghoai.thietbidien_v3.DAO.imp.*;
import com.haluonghoai.thietbidien_v3.Models.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/receiptDetail")
public class ReceiptDetailController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "chi_tiet_phieu_nhap";
    }

    private ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();
    private ReceiptDao receiptDao = new ReceiptDao_impl();
    private ProductDao productDao = new ProductDao_impl();
    private SupplierDao supplierDao = new SupplierDap_impl();
    private UserDao userDao = new UserDao_impl();

    @GetMapping(value = "/findById")
    public String goOrderDetail(@RequestParam("id") int id, ModelMap model) {
        try {
            List<Map<String, Object>> list = new ArrayList<>();
            long total = 0;

            List<ReceiptDetails> receiptDetailsList = receiptDetailDao.seeDetails(id);
            Receipt receipt = receiptDao.findById(id);
            User user = userDao.findById(receipt.getIdUser());
            Supplier supplier = supplierDao.findById(receipt.getIdSupplier());

            for (ReceiptDetails receiptDetails : receiptDetailsList) {
                Map<String, Object> map = new HashMap<>();

                Product product = productDao.findById(receiptDetails.getIdProduct());
                long cost = (long) (receiptDetails.getAmount() * receiptDetails.getPrice());

                map.put("idProduct", product.getId());
                map.put("nameProduct", product.getName());
                map.put("amount", receiptDetails.getAmount());
                map.put("price", receiptDetails.getPrice());
                map.put("cost", cost);
                total += cost;

                list.add(map);
            }
            model.addAttribute("list", list);
            model.addAttribute("total", total);
            model.addAttribute("user", user);
            model.addAttribute("supplier", supplier);
            model.addAttribute("receipt", receipt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "chi_tiet_phieu_nhap";
    }

}
