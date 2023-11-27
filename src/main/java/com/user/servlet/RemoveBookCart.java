package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOpl;
import com.DB.DBConnect;

@WebServlet("/remove_cart")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			int cid = Integer.parseInt(req.getParameter("cid"));
			
			CartDAOpl dao = new CartDAOpl(DBConnect.getConn());
			boolean f = dao.deleteBook(bid,uid,cid);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Đã xóa khỏi giỏ hàng !");
				resp.sendRedirect("cart.jsp");
			}else {
				session.setAttribute("failedMsg", "Xóa bị lỗi, vui lòng thử lại !");
				resp.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
