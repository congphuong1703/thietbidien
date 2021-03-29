package com.haluonghoai.thietbidien_v3.DAO.imp;

import com.haluonghoai.thietbidien_v3.DAO.ProductDao;
import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import com.haluonghoai.thietbidien_v3.Models.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao_impl implements ProductDao {

    MyConnection myConnection = new MyConnection();

    @Override
    public List<Product> search(String id, String name, float price, boolean status) throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        String sql = "select * from tblSanPham where sMasanpham = ? or sTensanpham like ? or fGiaban = ? and bTinhtrang = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setString(1,id);
        preparedStatement.setString(2,"%"+name+"%");
        preparedStatement.setFloat(3,price);
        preparedStatement.setBoolean(4,status);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                Product product = getObject(resultSet);
                if(product != null) list.add(product);
            }while(resultSet.next());
        }
        return list;
    }

    @Override
    public List<Product> findByCategory(int idCategory) throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        String sql = "select p.* from tblSanPham as p, tblDanhMucSanPham as c " +
                "where p.iMadanhmucsp = c.iMadanhmucsp and c.iMadanhmucsp = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, idCategory);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){{
            do{
                Product product = getObject(resultSet);
                if(product != null) list.add(product);
            }while(resultSet.next());
        }}
        return list;
    }

    @Override
    public List<Product> searchProductByName(String name) throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "select * from tblSanPham where sTensanpham like ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setString(1,"%"+name+"%");
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                Product product = getObject(resultSet);
                if(product != null) list.add(product);
            }while(resultSet.next());
        }
        return list;
    }

    @Override
    public boolean deleteByCategoryId(int id) throws SQLException {
        return false;
    }

    @Override
    public Product searchProductById(int id) throws SQLException {
        Product product = new Product();
        String sql = "select * from tblSanPham where iId_sanpham = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                product = getObject(resultSet);
            }while(resultSet.next());
        }
        return product;
    }

    @Override
    public Product getObject(ResultSet resultSet) throws SQLException {
        Product product = null;
        product = new Product(resultSet.getInt("iId_sanpham"),resultSet.getString("sMasanpham"),resultSet.getString("sTensanpham"),
                resultSet.getFloat("fGiaban"),resultSet.getString("sAnhsanpham"),resultSet.getBoolean("bTinhtrang"),resultSet.getString("sMota"),
                resultSet.getInt("iSoluong"),resultSet.getString("sThongsokythuat"),resultSet.getInt("iBaohanh"),
                resultSet.getString("sDonvitinh"),resultSet.getInt("iMadanhmucsp"));
        return product;
    }

    @Override
    public List getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<Product> findAll() throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        String sql = "select * from tblSanPham";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                Product product = getObject(resultSet);
                if(product!=null) list.add(product);
            }while (resultSet.next());
        }
        return list;
    }

    @Override
    public Product findById(int id) throws Exception {
        Product product = new Product();
        String sql = "select * from tblSanPham where iId_sanpham = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            do{
                product = getObject(resultSet);
            }while(resultSet.next());
        }
        return product;
    }

    @Override
    public Product insert(Product product) throws Exception {
        Product productnew = null;
        String sql = "insert tblSanPham values(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1,product.getId());
        preparedStatement.setString(2,product.getName());
        preparedStatement.setFloat(3,product.getPrice());
        preparedStatement.setString(4,product.getImage());
        preparedStatement.setBoolean(5,product.isStatus());
        preparedStatement.setString(6,product.getDescription());
        preparedStatement.setInt(7,product.getAmount());
        preparedStatement.setString(8,product.getSpecification());
        preparedStatement.setInt(9,product.getGuarantee());
        preparedStatement.setString(10,product.getUnit());
        preparedStatement.setInt(11,product.getCategoryId());
        int rs = preparedStatement.executeUpdate();
        if(rs > 0){
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if(resultSet.first()){
                productnew = findById((int) resultSet.getLong(1));
            }
        }
        return productnew;
    }

    @Override
    public boolean update(Product product) throws SQLException {
        boolean result = false;
        String sql = "update tblSanPham set sMasanpham = ?, sTensanpham = ?, fGiaban = ?, sAnhsanpham = ?," +
                " bTinhtrang = ?, sMota = ?, iSoluong = ?, sThongsokythuat = ?, iBaohanh = ?, sDonvitinh = ?, iMadanhmucsp = ? where iId_sanpham = ? ";
                PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
                preparedStatement.setString(1,product.getId());
                preparedStatement.setString(2,product.getName());
                preparedStatement.setFloat(3,product.getPrice());
                preparedStatement.setString(4,product.getImage());
                preparedStatement.setBoolean(5,product.isStatus());
                preparedStatement.setString(6,product.getDescription());
                preparedStatement.setInt(7,product.getAmount());
                preparedStatement.setString(8,product.getSpecification());
                preparedStatement.setInt(9,product.getGuarantee());
                preparedStatement.setString(10,product.getUnit());
                preparedStatement.setInt(11,product.getCategoryId());
                preparedStatement.setInt(12,product.getIncreaseId());
                int rs = preparedStatement.executeUpdate();
                if(rs>0) result = true;
        return result;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean result = false;
        String sql ="delete from tblSanPham where iId_sanpham = ?";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setInt(1,id);
        int rs = preparedStatement.executeUpdate();
        if(rs >0) result = true;
        return result;
    }

    @Override
    public int count() throws SQLException, ClassNotFoundException {
        int banghi;
        String sql = "select count(*) from tblSanPham";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.last();
        banghi = resultSet.getInt(1);
        return banghi;
    }
}
