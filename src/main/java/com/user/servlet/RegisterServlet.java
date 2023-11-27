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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			// System.out.println(name+" "+email+" "+phone+" "+password);

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhone(phone);
			user.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {
				UserDAOpl dao = new UserDAOpl(DBConnect.getConn());

				boolean f2 = dao.checkUser(email);

				if (f2) {
					boolean f = dao.userRegister(user);
					if (f) {
						session.setAttribute("succMsg", "Bạn đã đăng ký thành công.");
						resp.sendRedirect("register.jsp");
					} else {
						session.setAttribute("succMsg", "Bạn đã đăng ký thành công.");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "Tài khoản, Email đã tồn tại!");
					resp.sendRedirect("register.jsp");
				}

			} else {
				session.setAttribute("failedMsg", "Check Information of checkbox!");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
