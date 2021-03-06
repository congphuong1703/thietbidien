package com.haluonghoai.thietbidien_v3.API;

import com.haluonghoai.thietbidien_v3.DAO.CustomerDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CustomerDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController(value = "/customer")
public class CustomerController {

    private CustomerDao customerDao = new CustomerDao_impl();

    private JsonResult jsonResult = new JsonResult();

    @GetMapping(value = "/find-all")
    protected ResponseEntity<String> findAll() {
        String rs = "";
        try {
            List<Customer> customerList = customerDao.findAll();
            rs = jsonResult.jsonSuccess(customerList);
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("find-all-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/so-ban-ghi")
    public ResponseEntity<String> countRecord() {
        String rs = "";
        try {
            int count = customerDao.count();
            rs = jsonResult.jsonSuccess(count);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("so-ban-ghi-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/seach-customer")
    public ResponseEntity<String> searchCustomer(@RequestParam("name") String name,
                                                 @RequestParam("phoneNumber") String phoneNumber,
                                                 @RequestParam("email") String email,
                                                 @RequestParam("adress") String adress) {
        String rs = "";
        try {
            List<Customer> list = customerDao.search(name, phoneNumber, email, adress);
            rs = jsonResult.jsonSuccess(list);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("seach-customer-fail");
        }
        return ResponseEntity.ok(rs);
    }
}
