package com.itcast.itcaststore.domain;

public class SaleTop {

    private  String productName;
    private  int totalSum;
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getTotalSum() {
        return totalSum;
    }

    public void setTotalSum(int totalSum) {
        this.totalSum = totalSum;
    }

    @Override
    public String toString() {
        return "SaleTop{" +
                "productName='" + productName + '\'' +
                ", totalSum=" + totalSum +
                '}';
    }
}
