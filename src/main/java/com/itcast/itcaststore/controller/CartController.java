package com.itcast.itcaststore.controller;

import com.itcast.itcaststore.domain.Product;
import com.itcast.itcaststore.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CartController {
    @Autowired
    private ProductService productService;
    @RequestMapping("/AddCartServlet")
    public String AddCartServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Product p = productService.findProductById(id);
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        if (user == null) {
            return "mylogin";
        }
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<Product, Integer>();
        }
        //3.4向购物车中添加商品
        Integer count = cart.put(p, 1);
        //3.5如果商品数量不为空，则商品数量+1，否则添加新的商品信息
        if (count != null) {
            cart.put(p, count + 1);
        }
        session.setAttribute("cart", cart);
//        response.sendRedirect(request.getContextPath() + "/cart.jsp");
        return "cart";
    }
    @RequestMapping("/ChangeCartServlet")
    public String ChangeCartServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        // 2.得到要修改的数量
        int count = Integer.parseInt(request.getParameter("count"));
        // 3.从session中获取购物车.
        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        Product p = new Product();
        p.setId(id);
        if (count != 0) {
            cart.put(p, count);
        } else {
            cart.remove(p);
        }
    return "cart";
    }
}
