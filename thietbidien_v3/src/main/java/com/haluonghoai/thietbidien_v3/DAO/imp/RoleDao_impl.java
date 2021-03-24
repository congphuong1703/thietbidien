package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.RoleDao;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Quyen;
import com.haluonghoai.thietbidien_v3.Models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RoleDao_impl implements RoleDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public Quyen getObject(ResultSet resultSet) throws SQLException {
        Quyen quyen = null;
        quyen = new Quyen(resultSet.getInt("iMaquyen"), resultSet.getString("sTenquyen"));
        return quyen;
    }

    @Override
    public List<Quyen> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<Quyen> findAll() throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public Quyen findById(int id) throws Exception {
        Connection connection = myConnection.connectDb();
        Quyen quyen = null;
        String sql = "select * from tblQuyen where iMaquyen = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            quyen = getObject(resultSet);
        }
        return quyen;
    }

    @Override
    public Quyen insert(Quyen quyen) throws Exception {
        return null;
    }

    @Override
    public boolean update(Quyen object) throws SQLException {
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
    public Quyen getRoleById(int id) {
        return null;
    }
}
