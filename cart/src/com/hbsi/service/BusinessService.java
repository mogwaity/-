package com.hbsi.service;  
  
import java.util.List;  
  
import com.hbsi.domain.Book;  
import com.hbsi.domain.Cart;  
  
public interface BusinessService {  
    public List<Book> getAllBook();  
    //获取指定id的书  
    public Book findBook(String id);  
//删除购物项  
    public void deleteCartItem(String sid, Cart cart);  
    //清空购物车  
    public void clearCart(Cart cart);  
    //改变数量  
    public void changeQuantity(String sid, String quantity, Cart cart);  
      
}