package com.itcast.itcaststore.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itcast.itcaststore.domain.User;
import com.itcast.itcaststore.exception.ActiveUserException;
import com.itcast.itcaststore.mapper.UserMapper;
import com.itcast.itcaststore.utils.ActiveCodeUtils;


import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.security.auth.login.LoginException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Properties;

@Controller

public class UserController {
    @Autowired
//    private IUserService userService;
    private UserMapper userMapper;
    @Autowired
    private JavaMailSender javaMailSender;

    @RequestMapping("/MyLoginServlet")
    public String MyLoginServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String chkde = request.getParameter("chkde");
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String chkde1 = (String) session.getAttribute("mycode");
        System.out.println(chkde + "  " + chkde1);
        if (!chkde.equalsIgnoreCase(chkde1)) {
            response.getWriter().write("<script type='text/javascript'>alert('验证码错误');</script>");
            response.setHeader("refresh", "1;url=mylogin.jsp");
        } else {
            User user = userMapper.findUserByUsernameAndPassword(username, password);

            if (user == null || password == null || chkde1 == null) {
                return "mylogin";
            }
            if (user != null) {

                if (user.getState() == 1) {
                    if (user.getRole().equals("超级用户")) {
                        session.setAttribute("user", user);
                        return "/admin/login/home";
                    } else {
                        session.setAttribute("user", user);
                        return "client/myAccount";
                    }
                }
            }
        }
        return "mylogin";
    }

    @RequestMapping("/DeleteCurrentUserServlet")
    public String DeleteCurrentUserServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        request.getSession().invalidate();//销毁session，不然只是当前页面退出了
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {


            for (Cookie ck : cookies) {
                if ("username".equals(ck.getName())) {
                    System.out.println("删除cookie");
                    ck.setMaxAge(0);
                    response.addCookie(ck);
                    break;
                }
            }

        }
        return "index";
    }

    @RequestMapping("/RegisterServlet")
    public String RegisterServlet(HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException {
        // 将表单提交的数据封装到javaBean
        User user = new User();
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        try {
            BeanUtils.populate(user, request.getParameterMap());
            // 封裝激活码
            String activeCode = ActiveCodeUtils.createActiveCode();
            user.setActiveCode(activeCode);
            Properties properties = new Properties();
            properties.load(this.getClass().getResourceAsStream("/mail.properties"));
            String from = (String) properties.get("mail.smtp.username");
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
            mimeMessageHelper.setFrom(from);
            mimeMessageHelper.setTo(user.getEmail());
            String emailmsg = "感谢您注册网上书城，点击"
                    + "<a href='http://localhost:8080/activeUser?activeCode="
                    + activeCode + "'>&nbsp;激活&nbsp;</a>后使用。"
                    + "<br />为保障您的账户安全，请在24小时内完成激活操作";
            mimeMessageHelper.setSubject("用户激活");
            mimeMessageHelper.setText(emailmsg);
            javaMailSender.send(mimeMessage);

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException | MessagingException e) {
            e.printStackTrace();
        }
        // 调用service完成注册操作。

        userMapper.AddUser(user);
        // 注册成功，跳转到registersuccess.jsp
        return "registersuccess";

    }

    @RequestMapping("/RegComServlet")
    public void RegComServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        String user = request.getParameter("user");
        HashMap<String, Object> map = new HashMap<>();
        if (!user.isEmpty()) {
            boolean b = userMapper.queryByName(user);
            System.out.println("用户是否被注册" + b);
            if (userMapper.queryByName(user)) {
                map.put("userExsit", true);
                map.put("msg", "用户名已注册");
            }
            if (!userMapper.queryByName(user)) {
                map.put("userExsit", false);
                map.put("msg", "用户名可用");
            }
        }
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(), map);
    }

    @RequestMapping("/activeUser")
    public String activeUser(String activeCode) {
        //2、调用service中激活用户操作
        userMapper.activeUser(activeCode);
        return "activesuccess";
    }
}
