package com.haluonghoai.thietbidien_v3.Controllers;

import com.haluonghoai.thietbidien_v3.DAO.RoleDao;
import com.haluonghoai.thietbidien_v3.DAO.UserDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.RoleDao_impl;
import com.haluonghoai.thietbidien_v3.DAO.imp.UserDao_impl;
import com.haluonghoai.thietbidien_v3.Models.Quyen;
import com.haluonghoai.thietbidien_v3.Models.User;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

@Controller
public class LoginController {

    @ModelAttribute(name = "changeURL")
    public String changeURL() {
        return "login";
    }

    @RequestMapping("/login")
    public String go(Model model) {
        return "login";
    }

    UserDao userDao = new UserDao_impl();

    RoleDao roleDao = new RoleDao_impl();

    @RequestMapping("/actionlogin")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        Model model, HttpServletRequest httpServletRequest) throws Exception {

        User user = userDao.login(username, password);
        if (user != null) {
            Quyen quyen = roleDao.findById(user.getIdQuyen());
            HttpSession session = httpServletRequest.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", quyen.getId());
            model.addAttribute("user", user);
            model.addAttribute("role", quyen);
            return "redirect:/product";
        }

        return "redirect:/login";
    }

}