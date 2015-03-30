package com.tam.dao;

import com.tam.model.User;

public interface UserDao {
	
	public User getUser(String userName);
	
	public void addUser(User user);
	
	public void updateUser(User user);

}
