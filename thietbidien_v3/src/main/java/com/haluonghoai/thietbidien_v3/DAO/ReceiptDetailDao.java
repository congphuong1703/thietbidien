package com.haluonghoai.thietbidien_v3.DAO;

import com.haluonghoai.thietbidien_v3.Models.ReceiptDetails;

import java.sql.SQLException;
import java.util.List;

public interface ReceiptDetailDao extends BaseDao<ReceiptDetails> {

    public List<ReceiptDetails> seeDetails(int id) throws SQLException;

}
