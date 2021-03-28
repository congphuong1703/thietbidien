package com.haluonghoai.thietbidien_v3.DAO;


import com.haluonghoai.thietbidien_v3.Models.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerDao extends BaseDao<Customer> {

    List<Customer> search(String name, String phoneNumber, String email, String Adress) throws SQLException, ClassNotFoundException;



}
