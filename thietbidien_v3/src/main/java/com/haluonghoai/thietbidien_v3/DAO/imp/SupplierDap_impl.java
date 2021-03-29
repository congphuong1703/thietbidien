package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.SupplierDao;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Receipt;
import com.haluonghoai.thietbidien_v3.Models.Supplier;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDap_impl implements SupplierDao {
    MyConnection myConnection = new MyConnection();
    @Override
    public Supplier getObject(ResultSet resultSet) throws SQLException {
        Supplier supplier = null;
        supplier = new Supplier(resultSet.getInt("iManhacungcap"),resultSet.getString("sTennhacungcap"),resultSet.getString("sSodienthoai"),resultSet.getString("sEmail"),resultSet.getString("sDiachi"));
        return supplier;
    }

    @Override
    public List<Supplier> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<Supplier> findAll() throws SQLException, ClassNotFoundException {
        List<Supplier> list = new ArrayList<>();
        String sql = "{call sp_select_nhacungcap}";
        Connection connection = myConnection.connectDb();
        CallableStatement sttm = connection.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        ResultSet resultSet = sttm.executeQuery();
        if(resultSet.first()){
            do{
                Supplier supplier = getObject(resultSet);
                if(supplier != null) list.add(supplier);
            }while(resultSet.next());
        }
        return list;
    }

    @Override
    public Supplier findById(int id) throws Exception {
        Supplier supplier = null;
        String sql = "select * from tblNhaCungCap where iManhacungcap = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet =  preparedStatement.executeQuery();
        if(resultSet.first()) {
            supplier = getObject(resultSet);
        }
        return supplier;
    }

    @Override
    public Supplier insert(Supplier supplier) throws Exception {
        Supplier newSupplier = null;
        String sql = "insert tblNhaCungCap values (?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1,supplier.getName());
        preparedStatement.setString(2,supplier.getSdt());
        preparedStatement.setString(3,supplier.getEmail());
        preparedStatement.setString(4,supplier.getAdress());
        int rs = preparedStatement.executeUpdate();
        if(rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if(resultSet.next()) {
                newSupplier = findById((int) resultSet.getLong(1));
            }
        }
        return newSupplier;
    }

    @Override
    public boolean update(Supplier supplier) throws SQLException {
        boolean result = false;
        String sql = "update tblNhaCungCap set sTennhacungcap = ?, sSodienthoai = ?, sEmail = ?, sDiachi = ?  where iManhacungcap = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1, supplier.getName());
        preparedStatement.setString(2, supplier.getSdt());
        preparedStatement.setString(3, supplier.getEmail());
        preparedStatement.setString(4, supplier.getAdress());
        preparedStatement.setInt(5, supplier.getId());
        int rs = preparedStatement.executeUpdate();
        if(rs > 0) result = true;
        return result;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean result = false;
        String sql = "delete from tblNhaCungCap where iManhacungcap = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1,id);
        int rs = preparedStatement.executeUpdate();
        if(rs > 0) result = true;
        return result;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi = 0;
        String sql = "select count(*) from tblNhaCungCap";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }

    @Override
    public List<Supplier> searchByName(String name) throws SQLException {
        List<Supplier> suppliers = new ArrayList<>();
        String sql = "select * from tblNhaCungCap where sTennhacungcap like ? ";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setString(1,"%"+name+"%");
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Supplier supplier = getObject(resultSet);
                if (supplier != null) suppliers.add(supplier);
            } while (resultSet.next());
        }
        return suppliers;
    }
}
