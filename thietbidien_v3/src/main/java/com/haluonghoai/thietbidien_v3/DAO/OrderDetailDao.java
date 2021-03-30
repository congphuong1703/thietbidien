package com.haluonghoai.thietbidien_v3.DAO;

import com.haluonghoai.thietbidien_v3.Models.Customer;
import com.haluonghoai.thietbidien_v3.Models.OrderDetails;

import java.sql.SQLException;
import java.util.List;

public interface OrderDetailDao extends BaseDao<OrderDetails> {
    public List<OrderDetails> seeDetails(int id) throws SQLException, ClassNotFoundException;

    int sumProductByIdOrder(int id) throws SQLException;

    public boolean deleteAllByOrderId(int id) throws SQLException, ClassNotFoundException;

    public List<OrderDetails> findAllByProductId(int id) throws SQLException;

    public boolean deleteAllByProductId(int id) throws SQLException, ClassNotFoundException;

    }
