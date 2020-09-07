package com.hbsi.utils;  
  
import java.io.IOException;  
import java.io.InputStream;  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
import java.util.Properties;  
  
public class DBManager { 
	static {
		   try {  
	            Class.forName("com.mysql.cj.jdbc.Driver");  
	        } catch (ClassNotFoundException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	}
    public static Connection getConnection() {
    	 Connection con=null;  
         
         
         try {  
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstorebase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC", "ty","mogwaity187");  
               
         } catch (SQLException e) {  
             // TODO Auto-generated catch block  
             e.printStackTrace();  
         }  
         return con;  
   
     }  
    public static void main(String[] args) {  
    	
    	getConnection();  
		
	}
	}

