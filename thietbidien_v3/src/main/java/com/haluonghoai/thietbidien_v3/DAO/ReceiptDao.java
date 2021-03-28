package com.haluonghoai.thietbidien_v3.DAO;


import com.haluonghoai.thietbidien_v3.Models.Receipt;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface ReceiptDao extends BaseDao<Receipt> {
    boolean updateTinhTrang(boolean statusEnter, int id) throws SQLException;

    public List<Receipt> findByIdUser(int id) throws Exception;

    public List<Receipt> findByIdSupplier(int id) throws Exception;

    public List<Integer> getAllYear() throws SQLException;
}

