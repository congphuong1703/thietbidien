package com.haluonghoai.thietbidien_v3.DAO.imp;


import com.haluonghoai.thietbidien_v3.DAO.CustomerDao;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao_impl implements CustomerDao {
    MyConnection myConnection = new MyConnection();

    @Override
    public Customer getObject(ResultSet resultSet) throws SQLException {
        Customer customer = null;
        customer = new Customer(resultSet.getInt("iMakhachhang"), resultSet.getString("sHoten"), resultSet.getString("sEmail"), resultSet.getString("sDiachi"), resultSet.getString("sSodienthoai"), resultSet.getString("sTendangnhap"), resultSet.getString("sMatkhau"));
        return customer;
    }

    @Override
    public List<Customer> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<Customer> findAll() throws SQLException, ClassNotFoundException {
        List<Customer> list = new ArrayList<>();
        String sql = "{call sp_select_khachhang}";
        Connection connection = myConnection.connectDb();
        CallableStatement sttm = connection.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet resultSet = sttm.executeQuery();
        if (resultSet.first()) {
            do {
                Customer customer = getObject(resultSet);
                if (customer != null) list.add(customer);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public Customer findById(int id) throws Exception {
        Customer customer = null;
        String sql = "select * from tblKhachHang where iMakhachhang = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            customer = getObject(resultSet);
        }
        return customer;
    }

    @Override
    public Customer insert(Customer customer) throws Exception {
        Customer newCustomer = null;
        String sql = "insert tblKhachHang values (?,?,?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1,customer.getName());
        preparedStatement.setString(2,customer.getEmail());
        preparedStatement.setString(3,customer.getAdress());
        preparedStatement.setString(4,customer.getPhoneNumber());
        preparedStatement.setString(5,customer.getUsername());
        preparedStatement.setString(6,customer.getPassword());
        int rs = preparedStatement.executeUpdate();
        if(rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if(resultSet.next()) {
                newCustomer = findById((int) resultSet.getLong(1));
            }
        }
        return newCustomer;
    }

    @Override
    public boolean update(Customer object) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi = 0;
        String sql = "select count(*) from tblKhachHang";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }

    @Override
    public List<Customer> search(String name, String phoneNumber, String email, String adress) throws SQLException, ClassNotFoundException {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from tblKhachhang where sHoten like ? or sEmail = ? or sDiachi = ?, sSodienthoai = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, phoneNumber);
        preparedStatement.setString(3, email);
        preparedStatement.setString(4, adress);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Customer customer = getObject(resultSet);
                if (customer != null) list.add(customer);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public List<Customer> searchByUsername(String username) throws SQLException, ClassNotFoundException {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from tblKhachhang where sTendangnhap = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setString(1, username);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Customer customer = getObject(resultSet);
                if (customer != null) list.add(customer);
            } while (resultSet.next());
        }
        return list;
    }
}
