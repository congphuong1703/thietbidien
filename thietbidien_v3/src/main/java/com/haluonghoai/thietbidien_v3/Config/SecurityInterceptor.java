package com.haluonghoai.thietbidien_v3.Config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class SecurityInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();

        if (request.getServletPath().contains("/api/v1"))
            return true;

        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        if (session.getAttribute("user") != null) {
            if (session.getAttribute("role") != null && session.getAttribute("role").equals("2"))
                if (request.getServletPath().equalsIgnoreCase("/receipt")
                        || request.getServletPath().equalsIgnoreCase("/reportCost")
                        || request.getServletPath().equalsIgnoreCase("/reportProduct")
                        || request.getServletPath().equalsIgnoreCase("/reportProfit")
                        || request.getServletPath().equalsIgnoreCase("/orderDetail")
                        || request.getServletPath().equalsIgnoreCase("/supplier")
                        || request.getServletPath().equalsIgnoreCase("/user")) {
                    response.sendRedirect(request.getContextPath() + "/login");
                    return false;
                }
        }

        if (session.getAttribute("role") != null) {
            if (session.getAttribute("role").equals("1")) {
                session.setAttribute("show", "true");
            } else {
                session.setAttribute("show", "false");

            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        if (!request.getServletPath().contains("/api/v1"))
            if (!session.getAttribute("role").equals(1)) {
            if (request.getServletPath().equalsIgnoreCase("/receipt")
                    || request.getServletPath().equalsIgnoreCase("/reportCost")
                    || request.getServletPath().equalsIgnoreCase("/reportProduct")
                    || request.getServletPath().equalsIgnoreCase("/reportProfit")
                    || request.getServletPath().equalsIgnoreCase("/supplier")
                    || request.getServletPath().equalsIgnoreCase("/user")) {
                modelAndView.clear();

            }
        }
        super.postHandle(request, response, handler, modelAndView);
    }

}
