package com.hbsi.utils;  
  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
  
public class DBConn {  
    private static Connection conn=null;  
    public static Connection getConn(){  
        if(conn==null){  
            try {  
                Class.forName("com.mysql.cj.jdbc.Driver");  
                try {  
                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstorebase?user=ty&password=mogwaity187&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC");  
                } catch (SQLException e) {  
                    // TODO Auto-generated catch block  
                    e.printStackTrace();  
                }  
            } catch (ClassNotFoundException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
        }  
          
          
        return conn;  
          
    }  
    public static void realse(ResultSet rs, PreparedStatement pstmt) {  
        if(rs!=null){  
            try {  
                rs.close();  
            } catch (SQLException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
        }  
        if(pstmt!=null){  
            try {  
                pstmt.close();  
            } catch (SQLException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
        }  
    }  
  
  
}  