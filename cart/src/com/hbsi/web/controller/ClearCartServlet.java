package com.hbsi.web.controller;  
  
import java.io.IOException;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import com.hbsi.domain.Cart;  
import com.hbsi.service.BusinessService;  
import com.hbsi.service.BusinessServiceImpl;  
  
public class ClearCartServlet extends HttpServlet {  
    BusinessService service=new BusinessServiceImpl();  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        Cart cart=(Cart) request.getSession().getAttribute("cart");  
        service.clearCart(cart);  
          
        request.getRequestDispatcher("listcart.jsp").forward(request, response);  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        doGet(request, response);  
    }  
  
}  