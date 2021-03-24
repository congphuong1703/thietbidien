package com.haluonghoai.thietbidien_v3.API;

import com.google.gson.Gson;
import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Models.Product;
import com.haluonghoai.thietbidien_v3.Services.ProductService;
import com.haluonghoai.thietbidien_v3.Services.imp.ProductService_impl;
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
@RequestMapping(value = "/product")
public class ProductAPI {

    private ProductService productService = new ProductService_impl();

    private ProductDao productDao = new ProductDao_impl();

    private JsonResult jsonResult = new JsonResult();

    @PostMapping("/add")
    protected ResponseEntity<String> addProduct(@RequestBody Product product)  {
        String rs = "";
        try{
            Product productnew = productService.insert(product);
            rs = productnew != null ? jsonResult.jsonSuccess(productnew) : jsonResult.jsonSuccess("Thêm sản phẩm thất bại");
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("upload fail");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value="/find-all")
    protected ResponseEntity<String> findAll()  {
        String rs = "";
        try{
            List<Product> list = productService.findAll();
            rs = jsonResult.jsonSuccess(list);
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-all-fail");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value="/so-ban-ghi")
    protected ResponseEntity<String> countRecord()  {
        String rs = "";
        try{
            int sobanghi = productService.count();
            rs = jsonResult.jsonSuccess(sobanghi);
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("so-ban-ghi fail");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value="/search-san-pham")
    protected ResponseEntity<String> searchProduct(@RequestParam("id") String id,
                                                   @RequestParam("name") String name,
                                                   @RequestParam("price") int price,
                                                   @RequestParam("status") int status)  {
        String rs = "";
        try{
            List<Product> list = productService.search(id,name,price,status == 1 ? true : false);
            rs = jsonResult.jsonSuccess(list);
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("search-san-pham-fail");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value="/find-by-category")
    protected ResponseEntity<String> findByCategory(@RequestParam("idCategory") int idCategory)  {
        String rs = "";
        try {
            List<Product> list = productService.findByCategory(idCategory);
            rs = jsonResult.jsonSuccess(list);
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("find-by-category-fail");
        }
        return ResponseEntity.ok(rs);
    }

    @GetMapping(value="/search-by-name")
    protected ResponseEntity<String> searchByName(@RequestParam("name") String name)  {
        String rs = "";
        try{
            List<Product> list = productService.searchByName(name);
            rs = jsonResult.jsonSuccess(list);
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("search-by-name-fail");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value="/update")
    protected ResponseEntity<String> updateProduct(@RequestBody Product product)  {
        String rs = "";
        try {
            rs = jsonResult.jsonSuccess(productService.update(product));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update product fail");
        }
        return ResponseEntity.ok(rs);
    }

    @PutMapping(value="/delete")
    protected ResponseEntity<String> delete(@RequestParam("id") int id)  {
        String rs = "";
        try{
            rs = jsonResult.jsonSuccess(productService.delete(id));
        } catch (Exception ex) {
            ex.printStackTrace();
            rs = jsonResult.jsonFail("delete supplier fail");
        }
        return ResponseEntity.ok(rs);
    }
}
