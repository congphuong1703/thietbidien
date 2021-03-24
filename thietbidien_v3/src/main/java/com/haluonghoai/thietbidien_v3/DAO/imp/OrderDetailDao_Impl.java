package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.OrderDetailDao;
import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.OrderDetails;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderDetailDao_Impl implements OrderDetailDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public List<OrderDetails> seeDetails(int id) throws SQLException, ClassNotFoundException {
//        List<OrderDetails> orderDetailsList = null;
//        String sql = "select * from tblChiTietDonHang where iMadonhang = ?";
//        PreparedStatement preparedStatement = myConnection.prepare(sql);
//        preparedStatement.setInt(1, id);
//        ResultSet resultSet = preparedStatement.executeQuery();
//        if (resultSet.first()) {
//            do {
//                OrderDetails orderDetails = getObject(resultSet);
//                if (orderDetails != null) orderDetailsList.add(orderDetails);
//            } while (resultSet.next());
//        }
        return null;
    }

    @Override
    public OrderDetails getObject(ResultSet resultSet) throws SQLException {
        OrderDetails orderDetails = null;
        orderDetails = new OrderDetails(resultSet.getInt("iMadonhang"),
                resultSet.getInt("ild_sanpham"),
                resultSet.getInt("iSoluong"));
        return orderDetails;
    }

    @Override
    public List<OrderDetails> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<OrderDetails> findAll() throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public OrderDetails findById(int id) throws Exception {
        return null;
    }

    @Override
    public OrderDetails insert(OrderDetails orderDetails) throws Exception {
        return null;
    }

    @Override
    public boolean update(OrderDetails object) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        return 0;
    }
}
