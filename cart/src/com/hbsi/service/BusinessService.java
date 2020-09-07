package com.hbsi.service;  
  
import java.util.List;  
  
import com.hbsi.domain.Book;  
import com.hbsi.domain.Cart;  
  
public interface BusinessService {  
    public List<Book> getAllBook();  
    //��ȡָ��id����  
    public Book findBook(String id);  
//ɾ��������  
    public void deleteCartItem(String sid, Cart cart);  
    //��չ��ﳵ  
    public void clearCart(Cart cart);  
    //�ı�����  
    public void changeQuantity(String sid, String quantity, Cart cart);  
      
}