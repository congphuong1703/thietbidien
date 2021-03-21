package com.haluonghoai.thietbidien_v3.API;

import com.google.gson.Gson;
import com.haluonghoai.thietbidien_v3.DAO.OrderDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDao_impl;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Models.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping(value = "/order")
public class OrderController {

    private OrderDao orderDao = new OrderDao_impl();

    private JsonResult jsonResult = new JsonResult();

    @GetMapping(value = "/find-all")
    public ResponseEntity<String> findAll() {
        String rs = "";
        try {
            List<Order> orderList = orderDao.findAll();
            rs = jsonResult.jsonSuccess(orderList);
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
            int count = orderDao.count();
            rs = jsonResult.jsonSuccess(count);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("so-ban-ghi-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-by-hinh-thuc-thanh-toan")
    public ResponseEntity<String> findFormOfPayment(@RequestParam("payments") int payments) {
        String rs = "";
        try {
            List<Order> orderList = orderDao.selectOrderByPayments(payments == 0 ? false : true);
            rs = jsonResult.jsonSuccess(orderList);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-by-hinh-thuc-thanh-toan-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-by-trang-thai-thanh-toan")
    public ResponseEntity<String> findStatusPayment(@RequestParam("statusPayments") int statusPayments) {
        String rs = "";
        try {
            List<Order> orderList = orderDao.selectOrderByStatusPayments(statusPayments == 1 ? true : false);
            rs = jsonResult.jsonSuccess(orderList);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-by-trang-thai-thanh-toan-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-by-trang-thai-don-hang")
    public ResponseEntity<String> findStatusOrder(@RequestParam("id") int idStatusOrder) {
        String rs = "";
        try {
            List<Order> orderList = orderDao.selectOrderByStatusOrder(idStatusOrder);
            rs = jsonResult.jsonSuccess(orderList);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-by-trang-thai-don-hang-error");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-by-id")
    public ResponseEntity<String> findById(@RequestParam("id") int id) {
        String rs = "";
        try {
            Order order = orderDao.findById(id);
            rs = jsonResult.jsonSuccess(order);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-by-find-by-id-error");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value = "/update-by-status-payments")
    public ResponseEntity<String> updateStatusPayment(@RequestBody Order order) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(orderDao.updateStatusPayment(order.isStatusPaments(), order.getId()));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update order fail");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value = "/update-by-status-order")
    public ResponseEntity<String> updateStatusOrder(@RequestBody Order order) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(orderDao.updateStatusOrder(order.getIdOrderstatus(), order.getId()));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update order fail");
        }
        return ResponseEntity.ok(rs);
    }
}
