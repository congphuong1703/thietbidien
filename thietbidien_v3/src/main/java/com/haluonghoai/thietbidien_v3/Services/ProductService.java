package com.haluonghoai.thietbidien_v3.Services;


import com.haluonghoai.thietbidien_v3.Models.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {

    List<Product> findAll() throws SQLException, ClassNotFoundException;
    Product insert(Product product) throws Exception;
    boolean update(Product product) throws SQLException;
    boolean delete(int id) throws SQLException;
    List<Product> search(String id, String name, float price, boolean status) throws SQLException, ClassNotFoundException;
    int count() throws SQLException, ClassNotFoundException;
    List<Product> findByCategory(int idCategory) throws SQLException, ClassNotFoundException;
    List<Product> searchByName(String name) throws SQLException, ClassNotFoundException;
}
