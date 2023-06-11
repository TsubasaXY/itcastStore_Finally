package com.itcast.itcaststore.controller;

import com.itcast.itcaststore.domain.PageBean;
import com.itcast.itcaststore.domain.Product;
import com.itcast.itcaststore.mapper.ProductMapper;
import com.itcast.itcaststore.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    public HttpServletRequest request;
    @Autowired
    public HttpServletResponse response;
    @Autowired
    public HttpSession session;
    @Autowired
    private ProductMapper productMapper;

    @RequestMapping("/ShowProductByPageServlet")
    public String ShowProductByPage(Model model, HttpServletRequest request) {

        int currentPage = 1;
        String _currentPage = request.getParameter("currentPage");
        if (_currentPage != null) {
            currentPage = Integer.parseInt(_currentPage);
        }
        System.out.println("_c" + _currentPage);
        System.out.println(currentPage + "13");
        // 2.定义每页显示条数,默认为4
        int currentCount = 8;
        String _currentCount = request.getParameter("currentCount");
        if (_currentCount != null) {
            currentCount = Integer.parseInt(_currentCount);
        }
        // 3.获取查找的分类
        String category = "全部商品";
        String _category = request.getParameter("category");
        if (_category != null) {
            category = _category;
        }
        // 4.调用service，完成获取当前页分页Bean数据.
        System.out.println("currentPage" + currentPage);
        System.out.println("currentCount" + currentCount);
        System.out.println("category" + category);
        PageBean bean = productService.findProductByPage(currentPage, currentCount, category);

        List<Product> ps = bean.getPs();
        for (Product p : ps) {
            System.out.println(p);
        }
        // 将数据存储到request范围，跳转到product_list.jsp页面展示
        System.out.println(bean);
        model.addAttribute("bean", bean);
        return "product_list";
    }

    @RequestMapping("/ShowProductByIdServlet")
    public String ShowProductById(String id, Model model) {
        Product p = productMapper.findProductById(id);
        System.out.println(p);
        model.addAttribute("p", p);
        return "pdetail";
    }

    @RequestMapping("/MenuSearchServlet")
    public String MenuSearchServlet() throws ServletException, IOException {
        int currentPage = 1;
        String _currentPage = request.getParameter("currentPage");
        if (_currentPage != null) {
            currentPage = Integer.parseInt(_currentPage);
        }
        // 2.定义每页显示条数,默认为4
        int currentCount = 8;
        //获取前台页面搜索框输入的值
        String searchfield = request.getParameter("textfield");
        //如果搜索框中没有输入值，则表单传递的为默认值，此时默认查询全部商品目录
        if ("请输入书名".equals(searchfield)) {
            request.getRequestDispatcher("/showProductByPage").forward(request, response);
            return "/showProductByPage";
        }
        //调用service层的方法，通过书名模糊查询，查找相应的图书
        PageBean bean = productService.findBookByName(currentPage, currentCount, searchfield);
        // 将数据存储到request范围，跳转到product_search_list.jsp页面展示

        System.out.println("searchfield"+searchfield);
        List<Product> ps = bean.getPs();

        System.out.println("ps"+ps);

        request.setAttribute("bean", bean);
//        request.getRequestDispatcher("/client/product_search_list.jsp").forward(request,response);
        return "client/product_search_list";
    }

    @RequestMapping("/findProductById")
    public String findProductById() {
        //商品的id
        String id = request.getParameter("id");
        // 获取type参数值，此处的type用于区别普通用户和超级用户
        String type = request.getParameter("type");
        // 调用service层方法，通过id查找商品
        Product p = productMapper.findProductById(id);
        request.setAttribute("p", p);
        // 普通用户默认不传递type值，会跳转到info.jsp页面
        if (type == null) {
            return "pdetail";
        } else {
            return "admin/products/edit";
        }
    }

}

