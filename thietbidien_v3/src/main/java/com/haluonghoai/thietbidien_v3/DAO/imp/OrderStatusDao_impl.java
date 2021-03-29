package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.OrderStatusDao;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Order;
import com.haluonghoai.thietbidien_v3.Models.OrderDetails;
import com.haluonghoai.thietbidien_v3.Models.OrderStatus;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderStatusDao_impl implements OrderStatusDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public OrderStatus getObject(ResultSet resultSet) throws SQLException {
        OrderStatus orderStatus = null;
        orderStatus = new OrderStatus(resultSet.getInt("iMatrangthai"), resultSet.getString("sTentrangthai"));
        return orderStatus;
    }

    @Override
    public List<OrderStatus> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<OrderStatus> findAll() throws SQLException, ClassNotFoundException {
        List<OrderStatus> list = new ArrayList<>();
        String sql = "select * from tblTrangThaiDonHang ";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                OrderStatus orderStatus = getObject(resultSet);
                if (orderStatus != null) list.add(orderStatus);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public OrderStatus findById(int id) throws Exception {
        return null;
    }

    @Override
    public OrderStatus insert(OrderStatus orderStatus) throws Exception {
        return null;
    }

    @Override
    public boolean update(OrderStatus object) throws SQLException {
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
