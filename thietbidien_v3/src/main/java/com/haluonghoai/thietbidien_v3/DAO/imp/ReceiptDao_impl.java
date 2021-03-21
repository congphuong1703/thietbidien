package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
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
        receipt = new Receipt(resultSet.getInt("iMaphieunhap"),resultSet.getDate("dThoigianlap"),resultSet.getString("sGhichu"),
                resultSet.getInt("iManguoidung"),resultSet.getInt("iManhacungcap"),resultSet.getBoolean("bTinhtrangnhap"));
        return null;
    }

    @Override
    public List<Receipt> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<Receipt> findAll() throws SQLException, ClassNotFoundException {
        List<Receipt> receipts = new ArrayList<>();
        String sql = "select * from tblPhieuNhap";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                Receipt receipt = getObject(resultSet);
                if(receipt!=null) receipts.add(receipt);
            }while (resultSet.next());
        }
        return receipts;
    }

    @Override
    public Receipt findById(int id) throws Exception {
        Receipt receipt = new Receipt();
        String sql = "select * from tblPhieuNhap where iMaphieunhap = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                receipt = getObject(resultSet);
            }while(resultSet.next());
        }
        return receipt;
    }

    @Override
    public Receipt insert(Receipt receipt) throws Exception {
        Receipt newReceipt = null;
        String sql = "insert tblPhieuNhap values (?,?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setDate(1, (Date) receipt.getTimeCreate());
        preparedStatement.setString(2,receipt.getNote());
        preparedStatement.setInt(3,receipt.getIdUser());
        preparedStatement.setInt(4,receipt.getIdSupplier());
        preparedStatement.setBoolean(5,receipt.getStatusEnter());
        int rs = preparedStatement.executeUpdate();
        if(rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if(resultSet.first()) {
                newReceipt = findById((int) resultSet.getLong(1));
            }
        }
        return newReceipt;
    }

    @Override
    public boolean update(Receipt object) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
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
        preparedStatement.setBoolean(1,statusEnter);
        preparedStatement.setInt(2,id);
        int rs = preparedStatement.executeUpdate();
        if(rs > 0) result = true;
        return result;
    }


}
