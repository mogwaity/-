package com.hbsi.web.controller;  
  
import java.io.IOException;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import com.hbsi.domain.Book;  
import com.hbsi.domain.Cart;  
import com.hbsi.service.BusinessServiceImpl;  
  
public class BuyServlet extends HttpServlet {  
    BusinessServiceImpl service=new BusinessServiceImpl();  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        //1.获取要买的书  
        String sid=request.getParameter("id");  
        Book book =service.findBook(sid);  
        //2.得到购物车  
        Cart cart=(Cart)request.getSession().getAttribute("cart");  
        if(cart==null){  
            cart=new Cart();  
            request.getSession().setAttribute("cart", cart);  
        }  
        //3.把数添加到购物车中  
        cart.add(book);  
        response.sendRedirect("./ListCartServlet");  
        //request.getRequestDispatcher("/WEB-INF/jsp/listcart.jsp").forward(request, response);  
          
  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        doGet(request, response);  
    }  
  
}  