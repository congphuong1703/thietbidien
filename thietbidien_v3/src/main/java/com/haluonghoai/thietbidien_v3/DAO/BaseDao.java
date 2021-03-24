package com.haluonghoai.thietbidien_v3.DAO;

import com.haluonghoai.thietbidien_v3.Models.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface BaseDao<T> {
    T getObject(ResultSet resultSet) throws SQLException;

    List<T> getList(ResultSet resultSet) throws SQLException;

    List<T> findAll() throws SQLException, ClassNotFoundException;

    T findById(int id) throws Exception;

    T insert(T t) throws Exception;

    boolean update(T object) throws SQLException;

    boolean delete(int id) throws SQLException;

    int count() throws SQLException, ClassNotFoundException;

}
