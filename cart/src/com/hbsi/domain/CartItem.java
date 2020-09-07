package com.hbsi.domain;  
//用于代表购买的商品（购物项，购物车的一行）  
public class CartItem {  
    private Book book;  
    private int quantity;  
    private double price;//对此价格计算（小计）  
    public Book getBook() {  
        return book;  
    }  
    public void setBook(Book book) {  
        this.book = book;  
    }  
    public int getQuantity() {  
        return quantity;  
    }  
    public void setQuantity(int quantity) {  
        this.quantity = quantity;  
        this.price=this.book.getPrice()*this.quantity;//单价乘以数量  
    }  
    public double getPrice() {  
          
        return price;  
    }  
    public void setPrice(double price) {  
        this.price = price;  
    }  
      
}  