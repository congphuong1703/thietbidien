package com.haluonghoai.thietbidien_v3.DAO;


import com.haluonghoai.thietbidien_v3.Models.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDao extends BaseDao<Category> {

    public List<Category> checkStatus() throws SQLException, ClassNotFoundException;

}
