package com.haluonghoai.thietbidien_v3.DAO;


import com.haluonghoai.thietbidien_v3.Models.Receipt;

import java.sql.SQLException;

public interface ReceiptDao extends BaseDao<Receipt> {
    boolean updateTinhTrang(boolean statusEnter, int id) throws SQLException;

}
