package com.hbsi.dao;

import java.util.List;  

import com.hbsi.domain.Book;  
  
public interface BookDao {  
      
    //��ȡ���е���  
    public List<Book> getAll();  
      
    //����id��ȡ��  
    public Book find(String id);  
  
}  
