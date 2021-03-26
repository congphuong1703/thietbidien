package com.haluonghoai.thietbidien_v3.Models;


import com.haluonghoai.thietbidien_v3.Config.AppConfig;

import java.sql.*;

public class MyConnection {

    public static Connection connection = null;

    public void driveTest() throws ClassNotFoundException {
        try {
            Class.forName(AppConfig.DRIVER);
        } catch (Exception ex) {
            throw new ClassNotFoundException("Jdbc drive not found" + ex.getMessage());
        }
    }

    public Connection connectDb() throws ClassNotFoundException, SQLException {
        if (connection == null) {
            driveTest();
            try {
                connection = DriverManager.getConnection(AppConfig.URL_DATABASE, AppConfig.USERNAME, AppConfig.PASSWORD);
                if (connection != null)
                    System.out.println("connection successfuly");
            } catch (Exception ex) {
                throw new SQLException("Connect DB fail" + ex.getMessage());
            }
        }
        return connection;
    }

    public PreparedStatement prepare(String sql) {
        try {
            System.out.println(">>" + sql);
            return connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public PreparedStatement prepareUpdate(String sql) {
        try {
            System.out.println(">> " + sql);
            return connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public void closeDb() throws ClassNotFoundException, SQLException {
        if (connection != null) {
            connection.close();
            System.out.println("Connection is closed");
        }
    }

}
