package com.haluonghoai.thietbidien_v3.DAO.imp;


import com.haluonghoai.thietbidien_v3.DAO.CategoryDao;
import com.haluonghoai.thietbidien_v3.Models.Category;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao_impl implements CategoryDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public Category getObject(ResultSet resultSet) throws SQLException {
        Category category = null;
        category = new Category(resultSet.getInt("iMadanhmucsp"), resultSet.getString("sTendanhmucsp"), resultSet.getBoolean("bTinhtrangban"));
        return category;
    }

    @Override
    public List<Category> getList(ResultSet resultSet) throws SQLException {

        return null;
    }

    @Override
    public List<Category> findAll() throws SQLException, ClassNotFoundException {
        List<Category> list = new ArrayList<>();
        String sql = "{call sp_select_danhmuc}";
        Connection connection = myConnection.connectDb();
        CallableStatement sttm = connection.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet resultSet = sttm.executeQuery();
        if (resultSet.first()) {
            do {
                Category category = getObject(resultSet);
                if (category != null) list.add(category);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public Category findById(int id) throws Exception {
        Category category = null;
        String sql = "select * from tblDanhMucSanPham where iMadanhmucsp = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            category = getObject(resultSet);
        }
        return category;
    }


    @Override
    public Category insert(Category category) throws Exception, ClassNotFoundException {
        Category newCategory = null;
        String sql = "insert tblDanhMucSanPham(sTendanhmucsp,bTinhtrangban) values (?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1, category.getName());
        preparedStatement.setBoolean(2, category.isStatus());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                newCategory = findById((int) resultSet.getLong(1));
            }
        }
        return newCategory;
    }

    @Override
    public boolean update(Category category) throws SQLException {
        boolean result = false;
        String sql = "update tblDanhMucSanPham set sTendanhmucsp = ?, bTinhtrangban = ? where iMadanhmucsp = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1, category.getName());
        preparedStatement.setBoolean(2, category.isStatus());
        preparedStatement.setInt(3, category.getId());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean result = false;
        String sql = "delete from tblDanhMucSanPham where iMadanhmucsp = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi = 0;
        String sql = "{call sp_select_banghi}";
        Connection connection = myConnection.connectDb();
        CallableStatement sttm = connection.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet resultSet = sttm.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }

    @Override
    public List<Category> checkStatus() throws SQLException, ClassNotFoundException {
        List<Category> list = new ArrayList<>();
        String sql = "select * from tblDanhMucSanPham where exists (select * from tblSanPham where tblSanPham.iMadanhmucsp = tblDanhMucSanPham.iMadanhmucsp)";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Category category = getObject(resultSet);
                if (category != null) list.add(category);
            } while (resultSet.next());
        }
        return list;
    }
}
