package com.haluonghoai.thietbidien_v3.API;

import com.haluonghoai.thietbidien_v3.DAO.OrderDetailDao;
import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.DAO.ReceiptDetailDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ReceiptDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ReceiptDetailDao_Impl;
import com.haluonghoai.thietbidien_v3.DTO.ReceiptDTO;
import com.haluonghoai.thietbidien_v3.Models.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin("*")
@RequestMapping(value = "/receipt")
public class ReceiptAPI extends HttpServlet {

    private ReceiptDetailDao receiptDetailDao = new ReceiptDetailDao_Impl();
    private ReceiptDao receiptDao = new ReceiptDao_impl();
    private ProductDao productDao = new ProductDao_impl();

    private JsonResult jsonResult = new JsonResult();

    @PostMapping("/add")
    protected ResponseEntity<String> addReceipt(@RequestBody ReceiptDTO receiptDTO) {
        String rs = "";
        try {
            List<ReceiptDetails> receiptDetailsList = receiptDTO.getReceiptDetailsList();
            Map<Integer, ReceiptDetails> duplicateProduct = new HashMap<>();

            Receipt receipt = receiptDTO.getReceipt();
            receipt.setTimeCreate(new Date(System.currentTimeMillis()));

            Receipt newReceipt = receiptDao.insert(receipt);

            for (ReceiptDetails receiptDetails : receiptDetailsList) {
                if (duplicateProduct.containsKey(receiptDetails.getIdProduct())) {
                    int amount = duplicateProduct.get(receiptDetails.getIdProduct()).getAmount();
                    amount += receiptDetails.getAmount();
                    receiptDetails.setAmount(amount);

                    duplicateProduct.put(receiptDetails.getIdProduct(), receiptDetails);
                } else {
                    duplicateProduct.put(receiptDetails.getIdProduct(), receiptDetails);
                }
            }

            for(Integer integer : duplicateProduct.keySet()){
                ReceiptDetails receiptDetails = duplicateProduct.get(integer);

                receiptDetails.setIdReceipt(newReceipt.getId());
                receiptDetailDao.insert(receiptDetails);
            }

            rs = jsonResult.jsonSuccess("Success");
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("Not success");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-all")
    protected ResponseEntity<String> findAll() {
        String rs = "";
        try {
            List<Receipt> receiptList = receiptDao.findAll();
            rs = jsonResult.jsonSuccess(receiptList);
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("find-all-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/so-ban-ghi")
    protected ResponseEntity<String> countRecord() {
        String rs = "";
        try {
            int count = receiptDao.count();
            rs = jsonResult.jsonSuccess(count);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("so-ban-ghi-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-by-id")
    protected ResponseEntity<String> findById(@RequestParam("id") int id) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(id);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-by-id-fail");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value = "/update")
    protected ResponseEntity<String> update(@RequestBody Receipt receipt) {
        String rs = "";
        try {
            List<ReceiptDetails> receiptDetailsList = receiptDetailDao.seeDetails(receipt.getId());
            if (receipt.getStatusEnter() == true)
                for (ReceiptDetails receiptDetails : receiptDetailsList) {
                    Product product = productDao.findById(receiptDetails.getIdProduct());
                    int amount = product.getAmount() + receiptDetails.getAmount();
                    product.setAmount(amount);
                    product.setPrice(receiptDetails.getPrice());
                    productDao.update(product);
                }
            else {
                for (ReceiptDetails receiptDetails : receiptDetailsList) {
                    Product product = productDao.findById(receiptDetails.getIdProduct());
                    int amount = product.getAmount() - receiptDetails.getAmount();
                    product.setAmount(amount);
                    product.setPrice(receiptDetails.getPrice());
                    productDao.update(product);
                }
            }
            rs = jsonResult.jsonSuccess(receiptDao.updateTinhTrang(receipt.getStatusEnter(), receipt.getId()));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update receipt fail");
        }
        return ResponseEntity.ok(rs);
    }

}
