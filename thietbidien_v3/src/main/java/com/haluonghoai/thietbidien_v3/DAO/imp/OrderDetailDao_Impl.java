package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.OrderDetailDao;
import com.haluonghoai.thietbidien_v3.Models.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDao_Impl implements OrderDetailDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public List<OrderDetails> seeDetails(int id) throws SQLException, ClassNotFoundException {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        String sql = "select * from tblChiTietDonHang where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                OrderDetails orderDetails = getObject(resultSet);
                if (orderDetails != null) orderDetailsList.add(orderDetails);
            } while (resultSet.next());
        }
        return orderDetailsList;
    }

    @Override
    public OrderDetails getObject(ResultSet resultSet) throws SQLException {
        OrderDetails orderDetails = null;
        orderDetails = new OrderDetails(resultSet.getInt("iMadonhang"),
                resultSet.getInt("iId_sanpham"),
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
        OrderDetails orderDetails = new OrderDetails();
        String sql = "select * from tblChiTietDonHang where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                orderDetails = getObject(resultSet);
            }while(resultSet.next());
        }
        return orderDetails;
    }
    @Override
    public OrderDetails insert(OrderDetails orderDetails) throws Exception {
        String sql = "insert tblChiTietDonHang values(?,?,?)";
        OrderDetails orderDetailsNew = null;
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, orderDetails.getIdOrder());
        preparedStatement.setInt(2, orderDetails.getIdProduct());
        preparedStatement.setInt(3, orderDetails.getAmount());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                orderDetailsNew = findById((int) resultSet.getLong(1));
            }
        }
        return orderDetailsNew;
    }

    @Override
    public boolean update(OrderDetails object) throws SQLException {
        boolean result = false;
        String sql = "update tblChiTietDonHang set iSoluong = ? where iMadonhang = ? and iId_sanpham = ? ";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1,object.getAmount());
        preparedStatement.setInt(2,object.getIdOrder());
        preparedStatement.setInt(3,object.getIdProduct());
        int rs = preparedStatement.executeUpdate();
        if(rs>0) result = true;
        return result;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean result = false;
        String sql = "delete from tblChiTietDonHang where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi = 0;
        String sql = "select count(*) from tblChiTietDonHang";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }

    @Override
    public int sumProductByIdOrder(int id) throws SQLException {
        int total = 0;
        String sql = "select sum(iSoluong) from tblChiTietDonHang where iMadonhang = ";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        total = resultSet.getInt(1);

        return total;
    }

    @Override
    public List<OrderDetails> findAllByProductId(int id) throws SQLException {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        String sql = "select * from tblChiTietDonHang where iId_sanpham = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                OrderDetails orderDetails = getObject(resultSet);
                if (orderDetails != null) orderDetailsList.add(orderDetails);
            } while (resultSet.next());
        }
        return orderDetailsList;
    }
    @Override
    public boolean deleteAllByOrderId(int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String sql = "delete from tblChiTietDonHang where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public boolean deleteAllByProductId(int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String sql = "delete from tblChiTietDonHang where iId_sanpham = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public OrderDetails findByOrderIdAndProductId(int orderId,int productId) throws Exception {
        OrderDetails orderDetails = null;
        String sql = "select * from tblChiTietDonHang where iMadonhang = ? and iId_sanpham = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1,orderId);
        preparedStatement.setInt(2,productId);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.next()){
            do{
                orderDetails = getObject(resultSet);
            }while(resultSet.next());
        }
        return orderDetails;
    }

    @Override
    public boolean deleteByOrderIdAndProductId(int orderId,int productId) throws SQLException {
        boolean result = false;
        String sql = "delete from tblChiTietDonHang where iMadonhang = ? and iId_sanpham = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, orderId);
        preparedStatement.setInt(2, productId);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public List<OrderDetails> findAllByProductIdAndStatusOrder1(int id) throws SQLException, ClassNotFoundException {
        List<OrderDetails> list = new ArrayList<>();
        String sql = "select * from tblChiTietDonHang where iId_sanpham = ? and exists (SELECT * \n" +
                "FROM tblDonHang\n" +
                "WHERE tblDonHang.iMadonhang = tblChiTietDonHang.iMadonhang and tblDonHang.iMatrangthai = ?)";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        preparedStatement.setInt(2, 1);

        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                OrderDetails orderDetails = getObject(resultSet);
                if (orderDetails != null) list.add(orderDetails);
            } while (resultSet.next());
        }
        return list;
    }



}
