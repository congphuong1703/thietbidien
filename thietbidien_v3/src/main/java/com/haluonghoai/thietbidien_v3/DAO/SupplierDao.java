package com.haluonghoai.thietbidien_v3.DAO;


import com.haluonghoai.thietbidien_v3.Models.Supplier;

import java.sql.SQLException;
import java.util.List;

public interface SupplierDao extends BaseDao<Supplier> {

    public List<Supplier> searchByName(String name) throws SQLException;

}
