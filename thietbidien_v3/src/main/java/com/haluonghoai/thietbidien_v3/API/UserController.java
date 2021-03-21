package com.haluonghoai.thietbidien_v3.API;

import com.google.gson.Gson;
import com.haluonghoai.thietbidien_v3.DAO.UserDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.UserDao_impl;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Models.Supplier;
import com.haluonghoai.thietbidien_v3.Models.User;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController(value = "/user")
public class UserController extends HttpServlet {

    private UserDao userDao = new UserDao_impl();

    JsonResult jsonResult = new JsonResult();

    @PostMapping(value = "/add")
    public ResponseEntity<String> add(@RequestBody User user) {
        String rs = "";
        try {
            User newUser = userDao.insert(user);
            rs = newUser != null ? jsonResult.jsonSuccess(user) : jsonResult.jsonSuccess("thêm người dùng thất bại");
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("upload user fail !");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-all")
    public ResponseEntity<String> findAll() {
        String rs = "";
        try {
            List<User> userList = userDao.findAll();
            rs = jsonResult.jsonSuccess(userList);
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
            int count = userDao.count();
            rs = jsonResult.jsonSuccess(count);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("so-ban-ghi-error");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value = "/update")
    public ResponseEntity<String> update(@RequestBody User user) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(userDao.update(user));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update user fail");
        }
        return ResponseEntity.ok(rs);
    }

    @DeleteMapping(value = "/delete")
    public ResponseEntity<String> delete(@RequestParam("id") int id) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(userDao.delete(id));
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("delete user fail");
        }
        return ResponseEntity.ok(rs);
    }
}
