package com.DAO;

import java.util.List;


import com.entity.User;

public interface UserDAO {
	
	public List<User> getAllUser();
	
	public boolean userRegister(User user);
	
	public User login(String email, String password);
	
	public boolean checkPassword(int id,String ps);
	
	public boolean updateProfile(User user);
	
	public boolean checkUser(String em);
	

}
