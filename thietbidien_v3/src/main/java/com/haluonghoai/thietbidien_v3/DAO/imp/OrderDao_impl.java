package com.haluonghoai.thietbidien_v3.DAO.imp;


import com.haluonghoai.thietbidien_v3.DAO.OrderDao;
import com.haluonghoai.thietbidien_v3.Models.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao_impl implements OrderDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public Order getObject(ResultSet resultSet) throws SQLException {
        Order order = null;
        order = new Order(resultSet.getInt("iMadonhang"), resultSet.getDate("dThoigiandat"), resultSet.getString("sGhichu"), resultSet.getInt("iManguoidung"), resultSet.getInt("iMakhachhang"), resultSet.getInt("iMatrangthai"), resultSet.getBoolean("bTrangthaithanhtoan"), resultSet.getBoolean("bHinhthucthanhtoan"));
        return order;
    }

    @Override
    public List<Order> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<Order> findAll() throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        String sql = "select * from tblDonHang sort order by iMadonhang desc";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Order order = getObject(resultSet);
                if (order != null) list.add(order);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public boolean updateStatusPayment(boolean tttt, int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String sql = "update tblDonHang set bTrangthaithanhtoan = ? where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setBoolean(1, tttt);
        preparedStatement.setInt(2, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public boolean updateStatusOrder(int matrangthai, int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String sql = "update tblDonHang set iMatrangthai = ? where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, matrangthai);
        preparedStatement.setInt(2, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public Order seeDetails(int id) throws SQLException, ClassNotFoundException {
        Order order = new Order();
        String sql = "select tblDonHang.iMadonhang as N'Mã đơn hàng', tblKhachHang.iMakhachhang, tblKhachHang.sHoten, tblKhachHang.sSodienthoai, tblKhachHang.sEmail, tblKhachHang.sDiachi from tblDonHang\n" +
                "inner join tblKhachHang on tblDonHang.iMakhachhang = tblKhachHang.iMakhachhang where tblDonHang.iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            order = getObject(resultSet);
        }
        return order;
    }

    @Override
    public Order seeDetailsProduct(int id) throws SQLException, ClassNotFoundException {
        Order order = new Order();
        String sql = "select tblSanPham.sMasanpham, tblSanPham.sTensanpham, tblSanPham.iSoluong, tblSanPham.fGiaban, (tblSanPham.iSoluong * tblSanPham.fGiaban) as N'Thanh tien'\n" +
                "from (tblChiTietDonHang inner join tblSanPham on tblChiTietDonHang.iId_sanpham = tblSanPham.iId_sanpham) inner join tblDonHang on tblChiTietDonHang.iMadonhang = tblDonHang.iMadonhang\n" +
                "where tblDonHang.iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            order = getObject(resultSet);
        }
        return order;
    }

    @Override
    public float totalMoney() throws SQLException, ClassNotFoundException {
        float total;
        String sql = "select sum(tblSanPham.iSoluong * tblSanPham.fGiaban) from tblChiTietDonHang inner join tblSanPham on tblChiTietDonHang.iId_sanpham = tblSanPham.iId_sanpham";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        total = resultSet.getFloat(1);
        return total;
    }

    @Override
    public boolean updateProductInOrder(Order order) throws SQLException, ClassNotFoundException {
        return false;
    }

    @Override
    public List<Order> selectOrderByPayments(boolean payments) throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        String sql = "select * from tblDonHang where tblDonHang.bHinhthucthanhtoan = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setBoolean(1, payments);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Order order = getObject(resultSet);
                if (order != null) list.add(order);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public List<Order> selectOrderByStatusOrder(int matrangthai) throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        String sql = "select * from tblDonHang where tblDonHang.iMatrangthai = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, matrangthai);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Order order = getObject(resultSet);
                if (order != null) list.add(order);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public List<Order> selectOrderByStatusPayments(boolean trangthaitt) throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        String sql = "select * from tblDonHang where tblDonHang.bTrangthaithanhtoan = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setBoolean(1, trangthaitt);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Order order = getObject(resultSet);
                if (order != null) list.add(order);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public Order findById(int id) throws Exception {
        Order order = null;
        String sql = "select * from tblDonHang where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            order = getObject(resultSet);
        }
        return order;
    }

    @Override
    public Order insert(Order order) throws Exception {
        Order newOrder = null;
        String sql = "insert tblDonHang values (?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setDate(1, (Date) order.getTimecreate());
        preparedStatement.setBoolean(2, order.isStatusPaments());
        preparedStatement.setString(3, order.getNote());
        preparedStatement.setInt(4, order.getIdUser());
        preparedStatement.setInt(5, order.getIdCustomer());
        preparedStatement.setBoolean(6, order.isPayments());
        preparedStatement.setInt(7, order.getIdOrderstatus());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                newOrder = findById((int) resultSet.getLong(1));
            }
        }
        return newOrder;
    }

    @Override
    public boolean update(Order object) throws SQLException {
        boolean result = false;
        String sql = "update tblDonHang set dThoigiandat = ?, sGhichu = ?, iManguoidung = ?, iMakhachhang = ?," +
                " iMatrangthai = ?, bTrangthaithanhtoan = ?, bHinhthucthanhtoan = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setDate(1, (Date) object.getTimecreate());
        preparedStatement.setString(2, object.getNote());
        preparedStatement.setInt(3, object.getIdUser());
        preparedStatement.setInt(4, object.getIdCustomer());
        preparedStatement.setInt(5, object.getIdOrderstatus());
        preparedStatement.setBoolean(6, object.isStatusPaments());
        preparedStatement.setBoolean(7, object.isPayments());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean result = false;
        String sql = "delete from tblDonHang where iMadonhang = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi = 0;
        String sql = "select count(*) from tblDonHang";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }

    @Override
    public List<Integer> getAllYear() throws SQLException {
        List<Integer> years = new ArrayList<>();
        String sql = "select distinct year(dThoigiandat) from tblDonHang";
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
    public boolean deleteAllByUserId(int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String sql = "delete from tblDonHang where iManguoidung = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public List<Order> findAllByUserId(int id) throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        String sql = "select * from tblDonHang where iManguoidung = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Order order = getObject(resultSet);
                if (order != null) list.add(order);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public List<Order> findAllByStatusOrder1() throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        String sql = "select * from tblDonHang where iMatrangthai == 1";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                Order order = getObject(resultSet);
                if (order != null) list.add(order);
            } while (resultSet.next());
        }
        return list;
    }


}
