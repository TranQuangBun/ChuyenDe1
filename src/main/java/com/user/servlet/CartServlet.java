package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaopl;
import com.DAO.CartDAOpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDaopl dao = new BookDaopl(DBConnect.getConn());
			BookDtls b = dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBook_name(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));
			  
			CartDAOpl dao2 = new CartDAOpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f){
				session.setAttribute("addCart", "Thêm thành công vào giỏ hàng!");
				resp.sendRedirect("all_recent_book.jsp");
				System.out.println("Add thanh cong");
			}else {
				session.setAttribute("failed", "Thêm thất bại, vui lòng load lại trang!");
				resp.sendRedirect("all_new_book.jsp");
				System.out.println("Add that bai");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
