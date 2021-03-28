package com.haluonghoai.thietbidien_v3.DAO.imp;


import com.haluonghoai.thietbidien_v3.DAO.UserDao;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Supplier;
import com.haluonghoai.thietbidien_v3.Models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao_impl implements UserDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public User getObject(ResultSet resultSet) throws SQLException {
        User user = null;
        user = new User(resultSet.getInt("iManguoidung"), resultSet.getString("sHoten"), resultSet.getString("sEmail"), resultSet.getString("sDiachi"), resultSet.getString("sSodienthoai"), resultSet.getString("dNgaysinh"), resultSet.getString("sMatkhau"), resultSet.getInt("iMaquyen"));
        return user;
    }

    @Override
    public List<User> getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    public User login(String username, String password) throws SQLException, ClassNotFoundException {
        User user = null;
        myConnection.connectDb();
        String sql = "select * from tblNguoiDung where sEmail = ? and sMatkhau =  ?" ;
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            user = getObject(resultSet);
        }
        return user;
    }

    @Override
    public List<User> findAll() throws SQLException, ClassNotFoundException {
        List<User> list = new ArrayList<>();
        String sql = "{call sp_select_nguoidung}";
        Connection connection = myConnection.connectDb();
        CallableStatement sttm = connection.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet resultSet = sttm.executeQuery();
        if (resultSet.first()) {
            do {
                User user = getObject(resultSet);
                if (user != null) list.add(user);
            } while (resultSet.next());
        }
        return list;
    }

    @Override
    public User findById(int id) throws Exception {
        User user = null;
        String sql = "select * from tblNguoiDung where iManguoidung = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            user = getObject(resultSet);
        }
        return user;
    }

    @Override
    public User insert(User user) throws Exception {
        User newUser = null;
        String sql = "insert tblNguoiDung values (?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getAdress());
        preparedStatement.setString(4, user.getPhonenumber());
        preparedStatement.setString(5, user.getDateOfBirth());
        preparedStatement.setString(6, user.getPass());
        preparedStatement.setInt(7, user.getIdQuyen());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.first()) {
                newUser = findById((int) resultSet.getLong(1));
            }
        }
        return newUser;
    }

    @Override
    public boolean update(User user) throws SQLException {
        boolean result = false;
        String sql = "update tblNguoiDung set sHoten = ?,sEmail=?,sDiachi=?,sSodienthoai=?,dNgaysinh=?,sMatkhau=?,iMaquyen=? where iManguoidung = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getAdress());
        preparedStatement.setString(4, user.getPhonenumber());
        preparedStatement.setString(5, user.getDateOfBirth());
        preparedStatement.setString(6, user.getPass());
        preparedStatement.setInt(7, user.getIdQuyen());
        preparedStatement.setInt(8, user.getId());
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean result = false;
        String sql = "delete from tblNguoiDung where iManguoidung = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1, id);
        int rs = preparedStatement.executeUpdate();
        if (rs > 0) result = true;
        return result;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi = 0;
        String sql = "select count(*) from tblNguoiDung";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }

    @Override
    public List<User> searchByName(String name) throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "select * from tblNguoiDung where sHoten like ? ";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setString(1,"%"+name+"%");
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.first()) {
            do {
                User user = getObject(resultSet);
                if (user != null) users.add(user);
            } while (resultSet.next());
        }
        return users;
    }
}
