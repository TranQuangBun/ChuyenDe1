package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDaopl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/BookAdd")
@MultipartConfig
public class BookAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("btype");
			String bstatus = req.getParameter("categories");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			BookDtls b = new BookDtls(bookName, author, price, categories, bstatus, fileName, "admin");

			BookDaopl dao = new BookDaopl(DBConnect.getConn());
			
			boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("failedMsg", "Thêm sách thất bại.");
				resp.sendRedirect("admin/home.jsp");
			} else {
				String path = getServletContext().getRealPath("")+"book";
//				System.out.println(path);
				
				File file = new File(path);
				part.write(path+File.separator + fileName);
				
				session.setAttribute("succMsg", "Thêm sách thành công.");
				resp.sendRedirect("admin/home.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
