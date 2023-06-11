package com.itcast.itcaststore.service;

import com.itcast.itcaststore.domain.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {
    public void addProduct(Product product);
    public List<Product> listAll();
    public int findAllCount(String category);
    public PageBean findProductByPage(@Param("currentPage") int currentPage,@Param("currentCount") int currentCount,
                                      @Param("caetory")String category);

//    @Param("currentPage")@Param("currentCount")@Param("category")
    public Product findProductById(String id);
    public void changeProductNum(OrderItem orderItem);
    public List<SaleTop> salesList(@Param("year") String year,@Param("month") String month);




    public List<Product> findProductByManyCondition(String id, String name, String category,String minPrice, String maxPrice);
    public void editProduct(Product p);
    public void updateProductNum(List<OrderItem> items);//未知

    public List<WeekHotProduct> getWeekHotProduct();
    PageBean findBookByName(int currentPage, int currentCount,String searchfield );
    int getTotalCount(@Param("searchfield") String searchfield);


    public int findBookByNameAllCount(@Param("searchfield") String searchfield);
    public void deleteProduct(String id);

}
