package com.itcast.itcaststore.service.impl;

import com.itcast.itcaststore.domain.User;
import com.itcast.itcaststore.exception.ActiveUserException;
import com.itcast.itcaststore.exception.RegisterException;
import com.itcast.itcaststore.mapper.UserMapper;
import com.itcast.itcaststore.service.IUserService;
import com.itcast.itcaststore.utils.MailUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User findUserbyName(String username) {
        return userMapper.findUserbyName(username);
    }

    @Override
    public int AddUser(User user) throws RegisterException {
        userMapper.AddUser(user);
//        try {
//
//            // 发送激活邮件
//            String emailMsg = "感谢您注册网上书城，点击"
//                    + "<a href='http://localhost:8080/itcastStore/activeUser?activeCode="
//                    + user.getActiveCode() + "'>&nbsp;激活&nbsp;</a>后使用。"
//                    + "<br />为保障您的账户安全，请在24小时内完成激活操作";
//            System.out.println("email"+user.getEmail());
//            MailUtils.sendMail(user.getEmail(), emailMsg);
//            userMapper.AddUser(user);
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new RegisterException("注册失败");
//        }
        return 0;
    }


    @Override
    public void activeUser(String activecode) throws ActiveUserException {
        // 根据激活码查找用户
        User user = userMapper.findUserByActiveCode(activecode);
        if (user == null) {
            throw new ActiveUserException("激活用户失败");
        }
        // 判断激活码是否过期 24小时内激活有效.
        // 1.得到注册时间
        Date registTime = user.getRegistTime();
        // 2.判断是否超时
        long time = System.currentTimeMillis() - registTime.getTime();
        if (time / 1000 / 60 / 60 > 24) {
            throw new ActiveUserException("激活码过期");
        }
        // 激活用户，就是修改用户的state状态
        userMapper.activeUser(activecode);
    }

    @Override
    public User findUserByActiveCode(String activecode) {
       return userMapper.findUserByActiveCode(activecode);
    }

    @Override
    public User findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password) {
        return userMapper.findUserByUsernameAndPassword(username, password);
    }

    @Override
    public boolean queryByName(String username) {
        boolean i = userMapper.queryByName(username);
        return i;

    }
    @Override
    // 注册操作
    public int register(User user) throws RegisterException {
        // 调用dao完成注册操作
        try {
            userMapper.AddUser(user);
            // 发送激活邮件
            String emailMsg = "感谢您注册网上书城，点击"
                    + "<a href='http://localhost:8080/itcastStore/activeUser?activeCode="
                    + user.getActiveCode() + "'>&nbsp;激活&nbsp;</a>后使用。"
                    + "<br />为保障您的账户安全，请在24小时内完成激活操作";
            MailUtils.sendMail(user.getEmail(), emailMsg);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RegisterException("注册失败");
        }
        return 0;
    }

}
