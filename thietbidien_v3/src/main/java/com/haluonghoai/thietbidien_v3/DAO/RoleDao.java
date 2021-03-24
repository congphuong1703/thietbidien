package com.haluonghoai.thietbidien_v3.DAO;

import com.haluonghoai.thietbidien_v3.Models.Quyen;

public interface RoleDao extends BaseDao<Quyen> {

    Quyen getRoleById(int id);
}
