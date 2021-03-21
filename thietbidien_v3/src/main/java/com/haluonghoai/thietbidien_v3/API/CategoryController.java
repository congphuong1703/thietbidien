package com.haluonghoai.thietbidien_v3.API;

import com.google.gson.Gson;
import com.haluonghoai.thietbidien_v3.Models.Category;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Services.CategoryService;
import com.haluonghoai.thietbidien_v3.Services.imp.CategoryService_impl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping(value = "/category")
public class CategoryController {

    private CategoryService categoryService = new CategoryService_impl();

    private JsonResult jsonResult = new JsonResult();

    @PostMapping("/add")
    public ResponseEntity addCategory(@RequestBody Category category) {
        String rs = "";
        try {
            Category newCategory = categoryService.insert(category.getName());
            rs = newCategory != null ? jsonResult.jsonSuccess(category) : jsonResult.jsonSuccess("thêm danh mục thất bại");
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("upload category fail !");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value = "/find-all")
    public ResponseEntity<String> findAll() {
        String res = "";
        try {
            List<Category> categoryList = categoryService.findAll();
            res = jsonResult.jsonSuccess(categoryList);
        } catch (Exception e) {
            e.printStackTrace();
            res = jsonResult.jsonFail("find-all-error");
        }
        return ResponseEntity.ok(res.toString());
    }

    @GetMapping(value = "/so-ban-ghi")
    public ResponseEntity<String> countRecord() {
        String res = "";
        try {
            int count = categoryService.count();
            res = jsonResult.jsonSuccess(count);
        } catch (Exception ex) {
            ex.printStackTrace();
            res = jsonResult.jsonFail("so-ban-ghi-error");
        }
        return ResponseEntity.ok(res);
    }

    @PutMapping(value = "/update")
    public ResponseEntity<String> updateCategory(@RequestBody Category category) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(categoryService.update(category));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update category fail");
        }
        return ResponseEntity.ok(rs);
    }

    @DeleteMapping(value = "/delete")
    public ResponseEntity<String> delete(@RequestParam(value = "id") int id) {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(categoryService.delete(id));
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("delete category fail");
        }
        return ResponseEntity.ok(rs);
    }
}
