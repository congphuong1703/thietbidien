package com.haluonghoai.thietbidien_v3.API;

import com.google.gson.Gson;
import com.haluonghoai.thietbidien_v3.DAO.SupplierDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.SupplierDap_impl;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Models.Supplier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping(value = "/supplier")
public class SupplierAPI {

    private SupplierDao supplierDao = new SupplierDap_impl();

    private JsonResult jsonResult = new JsonResult();

    @PostMapping(value = "/add")
    public ResponseEntity<String> add(@RequestBody Supplier supplier) {
        String rs = "";
        try {
            Supplier newSupplier = supplierDao.insert(supplier);
            rs = newSupplier != null ? jsonResult.jsonSuccess(supplier) : jsonResult.jsonSuccess("thêm nhà cung cấp thất bại");
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("upload supplier fail !");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-all")
    public ResponseEntity<String> findAll() {
        String rs = "";
        try {
            List<Supplier> supplierList = supplierDao.findAll();
            rs = jsonResult.jsonSuccess(supplierList);
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
            int count = supplierDao.count();
            rs = jsonResult.jsonSuccess(count);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("so-ban-ghi-error");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value = "/update")
    public ResponseEntity<String> update(@RequestBody Supplier supplier) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(supplierDao.update(supplier));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update supplier fail");
        }
        return ResponseEntity.ok(rs);
    }

    @DeleteMapping(value = "/delete")
    public ResponseEntity<String> delete(@RequestParam("id") int id) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(supplierDao.delete(id));
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("delete supplier fail");
        }
        return ResponseEntity.ok(rs);
    }
}
