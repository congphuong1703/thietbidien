package com.haluonghoai.thietbidien_v3.DAO;


import com.haluonghoai.thietbidien_v3.Models.Quyen;
import com.haluonghoai.thietbidien_v3.Models.User;

import java.sql.SQLException;

public interface UserDao extends BaseDao<User> {

    public User login(String username, String password) throws SQLException, ClassNotFoundException;

}
