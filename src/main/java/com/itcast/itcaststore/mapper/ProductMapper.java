package com.itcast.itcaststore.mapper;

import com.itcast.itcaststore.domain.*;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;

import java.util.List;
import java.util.Map;

public interface ProductMapper {

    public void addProduct(Product product);

    public List<Product> listAll();

    public int findAllCount(String category);

    //    int currentPage, int currentCount, String category
    public List<Product> findByPage(@Param("category") String category, @Param("currentPage") int currentPage, @Param("currentCount") int currentCount);//有问题

    public Product findProductById(String id);

    public void changeProductNum(OrderItem orderItem);
//    public List<SaleTop> salesList();

    public List<SaleTop> salesList(@Param("year") String year, @Param("month") String month);

    public List<Product> findProductByManyCondition(@Param("id") String id, @Param("name") String name, @Param("category") String category, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice);


    public void editProduct(Product p);

    public void updateProductNum(List<OrderItem> items);

    public List<WeekHotProduct> getWeekHotProduct();

    List<Product> findBookByName( @Param("currentPage") int currentPage, @Param("currentCount") int currentCount,@Param("searchfield") String searchfield);
    int getTotalCount(@Param("searchfield") String searchfield);

    public int findBookByNameAllCount(@Param("searchfield") String searchfield);

    public void deleteProduct(String id);
}
