package com.itcast.itcaststore.controller;

import com.itcast.itcaststore.domain.*;
import com.itcast.itcaststore.service.impl.OrderItemServiceImpl;
import com.itcast.itcaststore.service.impl.OrderServiceImpl;
import com.itcast.itcaststore.utils.IdUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    private OrderServiceImpl orderService;
    @Autowired
    private OrderItemServiceImpl orderItemService;

    @RequestMapping("/CreateOrderServlet")
    public String CreateOrderServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // 2.从购物车中获取商品信息
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        System.out.println("cart:" + cart);
        // 3.将数据封装到订单对象中
        String receiverAddress = request.getParameter("receiverAddress");
        double money = Double.parseDouble(request.getParameter("money"));
        String name = request.getParameter("receiverName");
        String receiverPhone = request.getParameter("receiverPhone");
        Order order = new Order();
        order.setReceiverAddress(receiverAddress);
        order.setMoney(money);
        order.setReceiverName(name);
        order.setReceiverPhone(receiverPhone);
        order.setId(IdUtils.getUUID());// 封装订单id
        order.setUser(user);// 封装用户信息到订单.
        for (Product p : cart.keySet()) {
            OrderItem item = new OrderItem();
            item.setOrder(order);
            item.setBuynum(cart.get(p));
            item.setP(p);
            order.getOrderItems().add(item);
        }
        System.out.println(order);
        System.out.println("user:" + user);
        // 4.调用service中添加订单操作.
//        OrderServiceImpl orderService = new OrderServiceImpl();
        orderService.addOrder(order);
        return "createOrderSuccess";
    }

    @RequestMapping("/findOrderByUser")
    public String findOrderByUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        // 调用service中的方法,根据用户信息查找订单

        List<Order> orders = orderService.findOrderByUser(user);
        request.setAttribute("orders", orders);
        return "/client/orderlist";
//        request.getRequestDispatcher("/client/orderlist.jsp").forward(request, response);
    }

    @RequestMapping("/findOrderById")
    public String findOrderById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //1.获取用户类型
        String type = request.getParameter("type");
        //2.得到要查询的订单的id
        String id = request.getParameter("id");
//        System.out.println("id"+id);
        //3.根据id查找订单

        Order order = orderService.findOrderById(id);
        List<OrderItem> orderItems = orderItemService.findOrderItemByOrder(order);
        for (OrderItem item : orderItems) {
            System.out.println("item" + item);
        }

        //4.将查询出的订单信息添加到request作用域中
        request.setAttribute("order", order);
        request.setAttribute("orderitem", orderItems);
        //5.如果用户类型不为null，则请求转发到view.jsp页面，否则转发到orderInfo.jsp页面
        if (type != null) {
            return "/admin/orders/view";

        }
        return "/client/orderInfo";


    }

    @RequestMapping("/findOrders")
    public String findOrders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 调用Service层对象的findAllOrder()方法查询订单列表
        List<Order> orders = orderService.findAllOrder();
        //将查询到的订单信息添加到request作用域
        request.setAttribute("orders", orders);
        // 将请求转发到list.jsp页面
//		request.getRequestDispatcher("/admin/orders/list.jsp").forward(request,response);
        return "admin/orders/list";
    }

    @RequestMapping("/delOrderById")
    public ModelAndView delOrderById(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 订单id
        String id = request.getParameter("id");
        // 已支付的订单带有type值为client的参数
        String type = request.getParameter("type");
        if (type != null && type.trim().length() > 0) {
            orderService.delOrderByid(id);
            if ("admin".equals(type)) {

//                request.getRequestDispatcher("/findOrders").forward(request, response);
                return new ModelAndView("redirect:/findOrders");
            }
        } else {
            // 调用service层方法删除相应订单
            orderService.delOrderByIdWithClient(id);
        }
        return new ModelAndView("redirect:/findOrderByUser");
//        request.getRequestDispatcher("/client/orderlist.jsp").forward(request, response);
    }

    @RequestMapping("/pay")
    public String pay(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String orderid = request.getParameter("orderid");
        String money = request.getParameter("money");
        // 银行
        String bank = request.getParameter("yh");
        request.setAttribute("bank", bank);
        request.setAttribute("orderid", orderid);
        request.setAttribute("money", money);
        System.out.println("contextPath" + request.getContextPath());
        return "client/confirm";
    }

    @RequestMapping("/orderstate")
    public ModelAndView orderstate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String orderid = request.getParameter("orderid");
        String paySuccess = "恭喜您支付成功！";
        if (null != orderid) {

            // 根据订单号修改订单状态
            try {
                orderService.updateState(orderid);
                request.setAttribute("paySuccess", paySuccess);
                return new ModelAndView("redirect:/findOrderByUser");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("修改订单状态失败");
            }
        }
        return new ModelAndView("redirect:/findOrderByUser");

    }
}
