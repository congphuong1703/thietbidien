package com.haluonghoai.thietbidien_v3.Services.imp;

import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ProductDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Product;
import com.haluonghoai.thietbidien_v3.Services.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductService_impl implements ProductService {

    private ProductDao productDao = new ProductDao_impl();

    @Override
    public List<Product> findAll() throws SQLException, ClassNotFoundException {
        return productDao.findAll();
    }

    @Override
    public Product insert(Product product) throws Exception {
        return productDao.insert(product);
    }

    @Override
    public boolean update(Product product) throws SQLException {
        return productDao.update(product);
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return id>0 ? productDao.delete(id) : false;
    }

    @Override
    public List<Product> search(String id, String name, float price, boolean status) throws SQLException, ClassNotFoundException {
        return productDao.search(id, name, price, status);
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        return productDao.count();
    }

    @Override
    public List<Product> findByCategory(int idCategory) throws SQLException, ClassNotFoundException {
        return productDao.findByCategory(idCategory);
    }

    @Override
    public Product findProductById(int id) throws SQLException, ClassNotFoundException {
        return productDao.searchProductById(id);
    }

    @Override
    public List<Product> searchByName(String name) throws SQLException, ClassNotFoundException {
        return productDao.searchProductByName(name);
    }
}
