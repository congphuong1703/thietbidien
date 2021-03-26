package com.haluonghoai.thietbidien_v3.Config;


import com.haluonghoai.thietbidien_v3.Models.MyConnection;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.sql.SQLException;

@Component
@WebFilter(filterName = "Api_filter", urlPatterns = {"/*", "/api/v1/*"})
public class Api_filter implements Filter {

    private MyConnection myConnection = new MyConnection();

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        try {
            myConnection.connectDb();
        } catch (Exception e) {
            e.printStackTrace();
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        try {
            myConnection.connectDb();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

}
