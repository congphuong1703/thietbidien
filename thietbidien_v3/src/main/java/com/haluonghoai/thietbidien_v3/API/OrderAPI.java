package com.haluonghoai.thietbidien_v3.API;

import com.google.gson.Gson;
import com.haluonghoai.thietbidien_v3.DAO.CustomerDao;
import com.haluonghoai.thietbidien_v3.DAO.OrderDao;
import com.haluonghoai.thietbidien_v3.DAO.OrderDetailDao;
import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.CustomerDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.OrderDetailDao_Impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.DTO.OrderDTO;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.OrderDetails;
import com.haluonghoai.thietbidien_v3.Models.Product;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin("*")
@RequestMapping(value = "/order")
public class OrderAPI {

    private OrderDao orderDao = new OrderDao_impl();
    private OrderDetailDao orderDetailDao = new OrderDetailDao_Impl();
    private ProductDao productDao = new ProductDao_impl();
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
            List<OrderDetails> orderDetailsList = orderDetailDao.seeDetails(order.getId());
            if (order.getIdOrderstatus() == 5) {
                for (OrderDetails orderDetails : orderDetailsList) {
                    Product product = productDao.findById(orderDetails.getIdProduct());
                    int amount = product.getAmount() + orderDetails.getAmount();
                    product.setAmount(amount);
                    productDao.update(product);
                }
            } else if (order.getIdOrderstatus() == 2) {
                for (OrderDetails orderDetails : orderDetailsList) {
                    Product product = productDao.findById(orderDetails.getIdProduct());
                    int amount = product.getAmount() - orderDetails.getAmount();
                    product.setAmount(amount);
                    productDao.update(product);
                }
            }
            rs = jsonResult.jsonSuccess(orderDao.updateStatusOrder(order.getIdOrderstatus(), order.getId()));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update order fail");
        }
        return ResponseEntity.ok(rs);
    }

    @PostMapping(value = "/addPurchase")
    public ResponseEntity<String> add(@RequestBody OrderDTO orderDTO) {
        String rs = "";
        try {
            Map<Integer, Integer> productMap = new HashMap<>();
            List<OrderDetails> orderDetailsList = orderDTO.getOrderDetailsList();

            for (OrderDetails orderDetails : orderDetailsList) {
                List<OrderDetails> orderDetailsListStatusOrder1 = orderDetailDao.findAllByProductIdAndStatusOrder1(orderDetails.getIdProduct());
                for (OrderDetails orderDetailsExists : orderDetailsListStatusOrder1) {
                    Product product = productDao.findById(orderDetailsExists.getIdProduct());
                    if (productMap.containsKey(product.getIncreaseId())) {
                        int number = productMap.get(product.getIncreaseId());
                        number -= orderDetailsExists.getAmount();

                        productMap.put(product.getIncreaseId(), number);
                    } else {
                        productMap.put(product.getIncreaseId(), product.getAmount());
                    }
                }
            }

            List<Product> products = new ArrayList<>();
            for (Integer integer : productMap.keySet()) {
                Product product = productDao.findById(integer);

                if (productMap.get(integer) < 0) {
                    rs = jsonResult.jsonSuccess(false);
                    return ResponseEntity.ok(rs);
                } else if (productMap.get(integer) == 0) {
                    product.setStatus(false);
                } else {
                    product.setStatus(true);
                }
                products.add(product);
            }

            for (Product product : products) {
                productDao.update(product);
            }

            Order order = orderDTO.getOrder();
            order.setIdOrderstatus(1);
            order.setTimecreate(new Date(System.currentTimeMillis()));
            Order newOrder = orderDao.insert(order);

            for (OrderDetails orderDetails : orderDetailsList) {
                orderDetails.setIdOrder(newOrder.getId());
                orderDetailDao.insert(orderDetails);
            }
            rs = jsonResult.jsonSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonSuccess(false);
        }
        return ResponseEntity.ok(rs);
    }
}
