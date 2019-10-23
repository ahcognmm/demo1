package com.bookstore.dao;

import com.bookstore.model.User;

public interface UserDAO {
	boolean isExistsUser(User user);
	boolean saveUser(User user);
	User getUserById(int id);
	int getIdByUserName(String username);
	void update(User user);
	String getPasswordByUserName(String name);
	void updatePassword(String password, String name);
}
