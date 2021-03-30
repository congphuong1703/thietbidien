package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.Receipt;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReceiptDao_impl implements ReceiptDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public Receipt getObject(ResultSet resultSet) throws SQLException {
        Receipt receipt = null;
        receipt = new Receipt(resultSet.getInt("iMaphieunhap"), resultSet.getDate("dThoigianlap"), resultSet.getString("sGhichu"),
                resultSet.getInt("iManguoidung"), resultSet.getInt("iManhacungcap"), resultSet.getBoolean("bTinhtrangnhap"));
        return receipt;
    }

    @Override
    public List<Receipt> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<Receipt> findAll() throws SQLException, ClassNotFoundException {
        List<Receipt> receipts = new ArrayList<>();
        String sql = "select * from tblPhieuNhap order by iMaphieunhap desc ";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Receipt receipt = getObject(resultSet);
                if (receipt != null) receipts.add(receipt);
            } while (resultSet.next());
        }
        return receipts;
    }

    @Override
    public Receipt findById(int id) throws Exception {
        Receipt receipt = new Receipt();
        String sql = "select * from tblPhieuNhap where iMaphieunhap = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                receipt = getObject(resultSet);
            } while (resultSet.next());
        }
        return receipt;
    }

    @Override
    public Receipt insert(Receipt receipt) throws Exception {
        Receipt newReceipt = null;
        String sql = "insert tblPhieuNhap values (?,?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setDate(1, (Date) receipt.getTimeCreate());
        preparedStatement.setString(2, receipt.getNote());
        preparedStatement.setInt(3, receipt.getIdUser());
        preparedStatement.setInt(4, receipt.getIdSupplier());
        preparedStatement.setBoolean(5, receipt.getStatusEnter());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                newReceipt = findById((int) resultSet.getLong(1));
            }
        }
        return newReceipt;
    }

    @Override
    public boolean update(Receipt object) throws SQLException {
        boolean result = false;
        String sql = "update tblPhieuNhap set dThoigianlap = ?, sGhichu = ?, iManguoidung = ?, iManhacungcap = ?," +
                " bTinhtrangnhap = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setDate(1, (Date) object.getTimeCreate());
        preparedStatement.setString(2, object.getNote());
        preparedStatement.setInt(3, object.getIdUser());
        preparedStatement.setInt(4, object.getIdSupplier());
        preparedStatement.setBoolean(5, object.getStatusEnter());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean result = false;
        String sql = "delete from tblPhieuNhap where iMaphieunhap = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi;
        String sql = "select count(*) from tblPhieuNhap";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }

    @Override
    public boolean updateTinhTrang(boolean statusEnter, int id) throws SQLException {
        boolean result = false;
        String sql = "update tblPhieuNhap set bTinhtrangnhap = ? where iMaphieunhap = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setBoolean(1, statusEnter);
        preparedStatement.setInt(2, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }


    @Override
    public List<Receipt> findByIdSupplier(int id) throws Exception {
        List<Receipt> receipts = new ArrayList<>();
        String sql = "select * from tblPhieuNhap where iManhacungcap = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Receipt receipt = getObject(resultSet);
                if (receipt != null) receipts.add(receipt);
            } while (resultSet.next());
        }
        return receipts;
    }

    @Override
    public List<Integer> getAllYear() throws SQLException {
        List<Integer> years = new ArrayList<>();
        String sql = "select distinct year(dThoigianlap) from tblPhieuNhap";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                int year = resultSet.getInt(1);
                years.add(year);
            } while (resultSet.next());
        }
        return years;
    }

    @Override
    public List<Receipt> findByIdUser(int id) throws Exception {
        List<Receipt> receipts = new ArrayList<>();
        String sql = "select * from tblPhieuNhap where iManguoidung = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Receipt receipt = getObject(resultSet);
                if (receipt != null) receipts.add(receipt);
            } while (resultSet.next());
        }
        return receipts;
    }

    @Override
    public boolean deleteAllByUserId(int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String sql = "delete from tblPhieuNhap where iManguoidung = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public boolean deleteAllBySupplierId(int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String sql = "delete from tblPhieuNhap where iManhacungcap = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }



}
