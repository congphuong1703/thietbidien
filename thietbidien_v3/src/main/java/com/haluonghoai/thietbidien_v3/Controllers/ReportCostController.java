package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.*;
import com.haluonghoai.thietbidien_v3.DAO.imp.*;
import com.haluonghoai.thietbidien_v3.Models.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reportCost")
public class ReportCostController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_chi_phi_nhap";
    }

    private SupplierDao supplierDao = new SupplierDap_impl();
    private ReceiptDao receiptDao = new ReceiptDao_impl();
    private ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();
    private ProductDao productDao = new ProductDao_impl();
    private UserDao userDao = new UserDao_impl();

    @GetMapping
    public String go(ModelMap model) throws Exception {
        List<Map<String, String>> list = new ArrayList<>();
        Map<String, String> map = new HashMap<>();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        DecimalFormat format = new DecimalFormat("#,##0");
        List<Receipt> receipts = receiptDao.findAll();

        long total = 0;
        for (Receipt receipt : receipts) {
            int cost = 0;
            List<ReceiptDetails> receiptDetailsList = receiptDetailDao.findAll();
            User user = userDao.findById(receipt.getIdUser());
            Supplier supplier = supplierDao.findById(receipt.getIdSupplier());

            for (ReceiptDetails receiptDetails : receiptDetailsList) {
                cost += receiptDetails.getPrice() * receiptDetails.getAmount();
                total += cost;
            }
            map.put("idReceipt", String.valueOf(receipt.getId()));
            map.put("userName", user.getName());
            map.put("supplierName", supplier.getName());
            map.put("dateCreate", simpleDateFormat.format(receipt.getTimeCreate()));
            map.put("note", receipt.getNote());
            map.put("cost", String.valueOf(cost));
            list.add(map);
        }
        model.addAttribute("listReport", list);
        model.addAttribute("total", format.format(total));
        return "thong_ke_chi_phi_nhap";
    }

}