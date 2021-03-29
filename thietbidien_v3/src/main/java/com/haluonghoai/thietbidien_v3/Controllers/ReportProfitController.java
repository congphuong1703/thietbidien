package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.*;
import com.haluonghoai.thietbidien_v3.DAO.imp.*;
import com.haluonghoai.thietbidien_v3.Models.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.*;

@Controller
@RequestMapping("/reportProfit")
public class ReportProfitController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "thong_ke_loi_nhuan";
    }

    private ReceiptDao receiptDao = new ReceiptDao_impl();
    private ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();
    private ProductDao productDao = new ProductDao_impl();
    private OrderDao orderDao = new OrderDao_impl();
    private OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();

    @GetMapping
    public String go(Model model) throws Exception {
        List<Receipt> receipts = receiptDao.findAll();
        List<Order> orders = orderDao.findAll();
        List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();

        DecimalFormat decimalFormat = new DecimalFormat("#,##0");

        long total = 0;

        for (Order order : orders) {
            String dateOrder = order.getTimecreate().getMonth() + "-" + (order.getTimecreate().getYear() + 1900);
            long totalOrder = 0;

            List<OrderDetails> orderDetailsList = orderDetailDao.seeDetails(order.getId());

            if (map.containsKey(dateOrder))
                totalOrder = (long) map.get(dateOrder);

            for (OrderDetails orderDetails : orderDetailsList) {
                Product product = productDao.findById(orderDetails.getIdProduct());
                totalOrder += orderDetails.getAmount() * product.getPrice();
            }

            map.put(dateOrder, totalOrder);
        }

        for (Receipt receipt : receipts) {
            int year = receipt.getTimeCreate().getYear() + 1900;
            int month = receipt.getTimeCreate().getMonth();
            String dateReceipt = month + "-" + year;
            long totalReceipt = 0;

            List<ReceiptDetails> receiptDetailsList = receiptDetailDao.seeDetails(receipt.getId());

            for (ReceiptDetails receiptDetails : receiptDetailsList) {
                totalReceipt += receiptDetails.getPrice() * receiptDetails.getAmount();
            }

            if (map.containsKey(dateReceipt)) {
                long oldTotal = (long) map.get(dateReceipt);
                long newTotal = oldTotal - totalReceipt;
                map.put(dateReceipt, newTotal);
            } else {
                map.put(dateReceipt, -totalReceipt);
            }
        }

        for (String key : map.keySet()) {
            Map temp = new HashMap();
            temp.put(key, map.get(key));
            total += (long) temp.get(key);
        }

        model.addAttribute("listReport", map);
        model.addAttribute("total", decimalFormat.format(total));
        return "thong_ke_loi_nhuan";
    }

}