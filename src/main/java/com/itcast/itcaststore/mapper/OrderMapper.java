package com.itcast.itcaststore.mapper;

import com.itcast.itcaststore.domain.Order;
import com.itcast.itcaststore.domain.User;
import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.ast.Or;

import java.util.List;

public interface OrderMapper {
    public void addOrder(Order order);

    public List<Order> findOrderByUser(@Param("user") final User user);
    public Order findOrderById(String id);
    public List<Order> findAllOrder();
    public void updateOrderState(String id);
    public List<Order> findOrderByManyCondition(@Param("id") String id,@Param("receiverName") String receiverName);
    public void delOrderByid(String id);
}
