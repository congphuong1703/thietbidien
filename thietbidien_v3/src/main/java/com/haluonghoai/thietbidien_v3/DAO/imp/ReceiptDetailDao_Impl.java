package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.DAO.ReceiptDetailDao;
import com.haluonghoai.thietbidien_v3.Models.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReceiptDetailDao_Impl implements ReceiptDetailDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public ReceiptDetails getObject(ResultSet resultSet) throws SQLException {
        ReceiptDetails receiptDetails = null;
        receiptDetails = new ReceiptDetails(resultSet.getInt("iId_sanpham"), resultSet.getInt("iId_sanpham"), resultSet.getInt("iSoluong"),
                resultSet.getFloat("fDongia"));
        return receiptDetails;
    }

    @Override
    public List<ReceiptDetails> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<ReceiptDetails> findAll() throws SQLException, ClassNotFoundException {
        List<ReceiptDetails> receiptDetailsList = new ArrayList<>();
        String sql = "select * from tblChiTietPhieuNhap";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                ReceiptDetails receiptDetails = getObject(resultSet);
                if (receiptDetails != null) receiptDetailsList.add(receiptDetails);
            } while (resultSet.next());
        }
        return receiptDetailsList;
    }

    @Override
    public ReceiptDetails findById(int id) throws Exception {
        ReceiptDetails receiptDetails = null;
        String sql = "select * from tblChiTietPhieuNhap where iMaphieunhap = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet =  preparedStatement.executeQuery();
        if(resultSet.first()) {
            receiptDetails = getObject(resultSet);
        }
        return receiptDetails;
    }

    @Override
    public ReceiptDetails insert(ReceiptDetails receiptDetails) throws Exception {
        ReceiptDetails newReceiptDetails = null;
        String sql = "insert tblChiTietPhieuNhap values (?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, receiptDetails.getIdReceipt());
        preparedStatement.setInt(2, receiptDetails.getIdProduct());
        preparedStatement.setInt(3, receiptDetails.getAmount());
        preparedStatement.setFloat(4, receiptDetails.getPrice());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                newReceiptDetails = findById((int) resultSet.getLong(1));
            }
        }
        return newReceiptDetails;
    }

    @Override
    public boolean update(ReceiptDetails object) throws SQLException {
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

    @Override
    public List<ReceiptDetails> seeDetails(int id) throws SQLException {
        List<ReceiptDetails> receiptDetailsList = new ArrayList<>();
        String sql = "select * from tblChiTietPhieuNhap where iMaphieunhap = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                ReceiptDetails receiptDetails = getObject(resultSet);
                if (receiptDetails != null) receiptDetailsList.add(receiptDetails);
            } while (resultSet.next());
        }
        return receiptDetailsList;
    }
}
