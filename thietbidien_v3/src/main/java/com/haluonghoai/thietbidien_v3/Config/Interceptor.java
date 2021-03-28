package com.haluonghoai.thietbidien_v3.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class Interceptor extends WebMvcConfigurerAdapter {

    @Autowired
    SecurityInterceptor securityInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // TODO Auto-generated method stub

//         đăng kí chạy securityInterceptor cho tất cả trang khi chạy các trang web. trừ trang login
        registry.addInterceptor(securityInterceptor).excludePathPatterns("/login").excludePathPatterns("/actionlogin").excludePathPatterns("/css/style.css").excludePathPatterns("/css/mycss.css").excludePathPatterns("/vendor/bootstrap/css/bootstrap.min.css");

        // chỉ khi vào trang home mới chạy interceptor
        registry.addInterceptor(securityInterceptor).addPathPatterns("/home");
    }
}
