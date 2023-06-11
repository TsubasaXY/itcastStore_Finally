package com.itcast.itcaststore.service.impl;

import com.itcast.itcaststore.domain.Order;
import com.itcast.itcaststore.domain.OrderItem;
import com.itcast.itcaststore.mapper.OrderItemMapper;
import com.itcast.itcaststore.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    private OrderItemMapper orderItemMapper;


    @Override
    public void addOrderItem(OrderItem orderItem) {
        try {
            orderItemMapper.addOrderItem(orderItem);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("添加订单项失败");
        }
    }

    @Override
    public List<OrderItem> findOrderItemByOrder(Order order) {
        List<OrderItem> byOrder = orderItemMapper.findOrderItemByOrder(order);
        return byOrder;
    }


//    @Override
//    public List<OrderItem> findOrderItemByOrder(Order order) {
//        List<OrderItem> byOrder = orderItemMapper.findOrderItemByOrder(order.getId());
////        List<OrderItem> byOrder = orderItemMapper.findOrderItemByOrder(order);
////        System.out.println("findOrderitemByOrder的Serviceimpl查找到结果"+byOrder);
//        return byOrder;
//    }

    @Override
    public void delOrderItems(String id) {
        orderItemMapper.delOrderItems(id);
    }
}
