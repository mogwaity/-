package com.hbsi.dao;

import java.util.List;  

import com.hbsi.domain.Book;  
  
public interface BookDao {  
      
    //获取所有的书  
    public List<Book> getAll();  
      
    //根据id获取书  
    public Book find(String id);  
  
}  
