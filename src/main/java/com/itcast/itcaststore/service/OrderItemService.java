package com.itcast.itcaststore.service;

import com.itcast.itcaststore.domain.Order;
import com.itcast.itcaststore.domain.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderItemService {


    void addOrderItem(OrderItem orderItem);



//    List<OrderItem> findOrderItemByOrder(Order order);
List<OrderItem> findOrderItemByOrder(@Param("order") Order order);
    public void delOrderItems(String id);
}
