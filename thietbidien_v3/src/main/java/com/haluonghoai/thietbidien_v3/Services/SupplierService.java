package com.haluonghoai.thietbidien_v3.Services;


import com.haluonghoai.thietbidien_v3.Models.Supplier;

import java.sql.SQLException;

public interface SupplierService {
    Supplier insert(Supplier supplier) throws SQLException;
}
