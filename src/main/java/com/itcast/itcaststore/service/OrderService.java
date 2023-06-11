package com.itcast.itcaststore.service;

import com.itcast.itcaststore.domain.Order;
import com.itcast.itcaststore.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderService {
    public void addOrder(@Param("order") Order order);
    public List<Order> findOrderByUser(@Param("user") final User user);
    public Order findOrderById(String id);
    public List<Order> findAllOrder();
    public void updateOrderState(String id);
    public List<Order> findOrderByManyCondition(String id,String receiverName);
    public void delOrderByid(String id);

    void delOrderByIdWithClient(String id);

    void updateState(String orderid);
}
