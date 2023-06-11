package com.itcast.itcaststore.service;

import com.itcast.itcaststore.domain.User;
import com.itcast.itcaststore.exception.ActiveUserException;
import com.itcast.itcaststore.exception.RegisterException;
import org.apache.ibatis.annotations.Param;

public interface IUserService {
    User findUserbyName(String username);
    int AddUser(User user) throws RegisterException;
    void activeUser(String activecode) throws ActiveUserException;
    User findUserByActiveCode(String activecode);
    User findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
    boolean queryByName(String username);

    // 注册操作
    int register(User user) throws RegisterException;
}
