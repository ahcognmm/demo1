package com.bookstore.dao;

import com.bookstore.model.Cart;

public interface CartDAO {
	Cart findByUserId(int userId);
	Cart findByCartId(int cartId);
	void update(Cart cart);
	void add(int userId);
	void delete(int cartId);
	
}
