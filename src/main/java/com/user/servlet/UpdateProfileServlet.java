package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOpl;
import com.DB.DBConnect;
import com.entity.User;


@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhone(phone);
			
			HttpSession session = req.getSession();
			UserDAOpl dao = new UserDAOpl(DBConnect.getConn());
			
			
			boolean f= dao.checkPassword(id,password);
			if(f)
			{
				boolean f2=dao.updateProfile(user);
				if(f2) {
					session.setAttribute("succMsg", "Cập nhật thông tin thành công.");
					resp.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("failedMsg", "Cập nhật thông tin thất bại.");
					resp.sendRedirect("edit_profile.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Cập nhật thất bại!");
				resp.sendRedirect("edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
