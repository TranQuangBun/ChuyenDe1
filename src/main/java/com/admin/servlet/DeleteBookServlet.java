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

@WebServlet("/detele")
public class DeleteBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BookDaopl dao = new BookDaopl(DBConnect.getConn());
			boolean f = dao.deleteBooks(id);
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Xóa thông tin thành công!");
				resp.sendRedirect("admin/all_book.jsp");
			} else {
				session.setAttribute("failedMsg", "Xóa thông tin không thành công!");
				resp.sendRedirect("admin/all_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

	}
}
