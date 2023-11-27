package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaopl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/editbook")
public class EditBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String bstatus = req.getParameter("categories");
			
			BookDtls b= new BookDtls();
			b.setBookId(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setAuthor(author);
			
			BookDaopl dao = new BookDaopl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Cập nhật thành công!");
				resp.sendRedirect("admin/all_book.jsp");
			}else {
				session.setAttribute("failedMsg", "Cập nhật không thành công!");
				resp.sendRedirect("admin/all_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
