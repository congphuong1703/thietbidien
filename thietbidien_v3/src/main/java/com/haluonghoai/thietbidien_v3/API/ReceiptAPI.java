package com.haluonghoai.thietbidien_v3.API;

import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ReceiptDao_impl;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Models.Receipt;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServlet;
import java.util.List;

@RestController
@RequestMapping(value = "/receipt")
public class ReceiptAPI extends HttpServlet {

    private ReceiptDao receiptDao = new ReceiptDao_impl();

    private JsonResult jsonResult = new JsonResult();

    @PostMapping("/add")
    protected ResponseEntity<String> addProduct(@RequestBody Receipt receipt)  {
        String rs = "";
        try{
            Receipt newReceipt = receiptDao.insert(receipt);
            rs = newReceipt != null ? jsonResult.jsonSuccess(newReceipt) : jsonResult.jsonSuccess("Thêm phiếu nhập thất bại");
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("upload fail");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value="/find-all")
    protected ResponseEntity<String> findAll()  {
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

    @GetMapping(value="/so-ban-ghi")
    protected ResponseEntity<String> countRecord()  {
        String rs = "";
        try{
            int count = receiptDao.count();
            rs = jsonResult.jsonSuccess(count);
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("so-ban-ghi-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value="/find-by-id")
    protected ResponseEntity<String> findById(@RequestParam("id") int id)  {
        String rs = "";
        try{
            rs = jsonResult.jsonSuccess(id);
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-by-id-fail");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value="/update")
    protected ResponseEntity<String> updateProduct(@RequestBody Receipt receipt)  {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(receiptDao.updateTinhTrang(receipt.getStatusEnter(),receipt.getId()));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update receipt fail");
        }
        return ResponseEntity.ok(rs);
    }

}