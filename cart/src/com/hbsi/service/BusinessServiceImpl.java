package com.hbsi.service;  
  
import java.util.List;  
  
import com.hbsi.dao.BookDao;  
import com.hbsi.dao.BookDaoImpl;  
import com.hbsi.domain.Book;  
import com.hbsi.domain.Cart;  
import com.hbsi.domain.CartItem;  
  
public class BusinessServiceImpl implements BusinessService{  
BookDao dao=new BookDaoImpl();  
    @Override  
    public List<Book> getAllBook() {  
          
        return dao.getAll();  
    }  
      
      
    @Override  
    public void deleteCartItem(String sid, Cart cart) {  
          
        cart.getMap().remove(sid);  
    }  
  
  
    @Override  
    public Book findBook(String id) {  
          
        return dao.find(id);  
    }  
  
  
    @Override  
    public void clearCart(Cart cart) {  
        cart.getMap().clear();  
          
    }  
  
  
    @Override  
    public void changeQuantity(String sid, String quantity, Cart cart) {  
        CartItem item=cart.getMap().get(sid);  
        item.setQuantity(Integer.parseInt(quantity));  
          
    }  
      
      
}  