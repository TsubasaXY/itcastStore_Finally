package com.itcast.itcaststore.mapper;

import com.itcast.itcaststore.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User findUserbyName(String username);
    void AddUser(User user);
    void activeUser(String activecode);
    User findUserByActiveCode(String activecode);
    User findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);//有两个string参数，需要加@Param映射否则报错，注意@Param对应的是#{}里的参数
    boolean queryByName(String username);

}
