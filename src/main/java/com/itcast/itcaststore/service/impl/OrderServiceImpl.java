package com.itcast.itcaststore.service.impl;

import com.itcast.itcaststore.domain.Order;
import com.itcast.itcaststore.domain.OrderItem;
import com.itcast.itcaststore.domain.User;
import com.itcast.itcaststore.mapper.OrderItemMapper;
import com.itcast.itcaststore.mapper.OrderMapper;
import com.itcast.itcaststore.mapper.ProductMapper;
import com.itcast.itcaststore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private OrderItemServiceImpl orderItemService;
    @Autowired
    private ProductServiceImpl productService;
    @Autowired
    private OrderItemMapper orderItemMapper;

    @Override
    public void addOrder(Order order) {
        try {
            orderMapper.addOrder(order);
            List<OrderItem> items = order.getOrderItems();
            for (OrderItem item : items) {
                System.out.println(item.getP().getId());
            orderItemService.addOrderItem(item);
            productService.changeProductNum(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("添加订单失败");
        }
    }



    @Override
    public List<Order> findOrderByUser(User user) {
        List<Order> orderByUser = orderMapper.findOrderByUser(user);
        return orderByUser;
    }

    @Override
    public Order findOrderById(String id) {
        return orderMapper.findOrderById(id);
    }

//    @Override
//    public Order findOrderById(String id) {
//
//        Order order = orderMapper.findOrderById(id);
////        System.out.println("order"+order);
//        List<OrderItem> byOrder = orderItemMapper.findOrderItemByOrder(id);
////        System.out.println("byorder"+byOrder);
//        order.setOrderItems(byOrder);
//        return order;
//    }

    @Override
    public List<Order> findAllOrder() {
        return orderMapper.findAllOrder();
    }

    @Override
    public void updateOrderState(String id) {
        orderMapper.updateOrderState(id);
    }

    @Override
    public List<Order> findOrderByManyCondition(String id, String receiverName) {
        return orderMapper.findOrderByManyCondition(id,receiverName);
    }

    @Override
    public void delOrderByid(String id) {
        orderMapper.delOrderByid(id);
    }
    @Override
    public void delOrderByIdWithClient(String id) {
////        try {
////            DataSourceUtils.startTransaction();//开启事务
//            //从订单项中查找商品购买数量
//            Order order=new Order();
//            order.setId(id);
//            List<OrderItem> items= (List<OrderItem>) orderItemService.findOrderItemByOrder(order);
//            //修改商品数量
//            productService.updateProductNum(items);
//            orderItemService.delOrderItems(id); //删除订单项
//            orderMapper.delOrderByid(id); //删除订单
////        } catch (SQLException e) {
////            e.printStackTrace();
////            try {
////                DataSourceUtils.rollback();
////            } catch (SQLException e1) {
////                e1.printStackTrace();
////            }
////        }finally{
////            try {
////                DataSourceUtils.releaseAndCloseConnection();
////            } catch (SQLException e) {
////                e.printStackTrace();
////            }
////        }
    }

    @Override
    public void updateState(String orderid) {
        orderMapper.updateOrderState(orderid);
    }
}
