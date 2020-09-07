package com.hbsi.domain;  
  
import java.util.LinkedHashMap;  
import java.util.Map;  
  
public class Cart {  
    private Map<String,CartItem> map=new LinkedHashMap<String,CartItem>();  
    private double price;//���й�����ļ۸��ܼ�  
      
    public void add(Book book){  
        CartItem item=map.get(book.getId());  
        if(item!=null){  
            item.setQuantity(item.getQuantity()+1);  
        }else{  
            item=new CartItem();  
            item.setBook(book);  
            item.setQuantity(1);  
            //���µĹ�������ӵ�map������  
            map.put(book.getId(),item);  
        }  
    }  
    public Map<String, CartItem> getMap() {  
        return map;  
    }  
    public void setMap(Map<String, CartItem> map) {  
        this.map = map;  
    }  
    public double getPrice() {  
        double totalprice=0;  
        for(Map.Entry<String, CartItem> me:map.entrySet()){  
            CartItem item=me.getValue();  
            totalprice+=item.getPrice();  
        }  
        this.price=totalprice;  
        return price;  
    }  
    public void setPrice(double price) {  
        this.price = price;  
    }  
}  