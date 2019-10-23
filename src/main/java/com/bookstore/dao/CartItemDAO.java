package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.CartItem;

public interface CartItemDAO {
	boolean isExistInCart(int cartId, int bookId);
	List<CartItem> getCartItemListByCartId(int cartId);
	CartItem findBy(int cartId, int bookId);
	void addCartItem(CartItem cartItem);
	void update(CartItem cartItem);
	void delete(int cartId, int bookId);
	void deleteAll();
}
