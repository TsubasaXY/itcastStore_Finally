package com.itcast.itcaststore.service.impl;

import com.itcast.itcaststore.domain.*;
import com.itcast.itcaststore.mapper.ProductMapper;
import com.itcast.itcaststore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;


    @Override
    public void addProduct(Product product) {
        productMapper.addProduct(product);
    }

    @Override
    public List<Product> listAll() {
        return productMapper.listAll();
    }

    @Override
    public int findAllCount(String category) {
        return productMapper.findAllCount(category);
    }

    @Override
    public PageBean findProductByPage(int currentPage, int currentCount, String category) {
        PageBean bean = new PageBean();
        // 封装每页显示数据条数
        bean.setCurrentCount(currentCount);
        // 封装当前页码
        bean.setCurrentPage(currentPage);
        // 封装当前查找类别
        bean.setCategory(category);
        try {
            // 获取总条数
            int totalCount = productMapper.findAllCount(category);
            bean.setTotalCount(totalCount);
            // 获取总页数
            int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
            bean.setTotalPage(totalPage);
            // 获取当前页数据
            List<Product> ps = productMapper.findByPage(category, (currentPage-1)*currentCount, currentCount
            );
            bean.setPs(ps);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return bean;
        //        return productMapper.findByPage(category, currentPage, currentCount);
    }


    @Override
    public Product findProductById(String id) {
        return productMapper.findProductById(id);
    }

    @Override
    public void changeProductNum(OrderItem orderItem) {
        productMapper.changeProductNum(orderItem);
    }

    @Override
    public List<SaleTop> salesList(String year, String month) {
        return productMapper.salesList(year, month);
    }


    @Override
    public List<Product> findProductByManyCondition(String id, String name, String category, String minPrice, String maxPrice) {
       return productMapper.findProductByManyCondition(id, name, category, minPrice, maxPrice);
    }



    @Override
    public void editProduct(Product p) {
        productMapper.editProduct(p);
    }

    @Override
    public void updateProductNum(List<OrderItem> items) {
        productMapper.updateProductNum(items);
    }

    @Override
    public List<WeekHotProduct> getWeekHotProduct() {
        return productMapper.getWeekHotProduct();
    }

    @Override
    public PageBean findBookByName(int currentPage, int currentCount,String searchfield) {
        PageBean bean = new PageBean();
        // 封装每页显示数据条数
        bean.setCurrentCount(currentCount);
        // 封装当前页码
        bean.setCurrentPage(currentPage);
        // 封装模糊查询的图书名
        bean.setSearchfield(searchfield);
        // 获取总条数
        int totalCount = productMapper.findBookByNameAllCount(searchfield);
        bean.setTotalCount(totalCount);

        // 获取总页数
        int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
        bean.setTotalPage(totalPage);

        //满足条件的图书
        List<Product> ps = productMapper.findBookByName(currentPage,currentCount,searchfield);
        bean.setPs(ps);
        return bean;
    }

    @Override
    public int getTotalCount(String searchfield) {
        return productMapper.getTotalCount(searchfield);
    }


    @Override
    public int findBookByNameAllCount(String searchfield) {
        return productMapper.findBookByNameAllCount(searchfield);
    }

    @Override
    public void deleteProduct(String id) {
        productMapper.deleteProduct(id);
    }
}
