package com.bookstore.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
	private int cartId;
	private int userId;
	private List<CartItem> cartItems;
	private int totalPrice;
	private int enable;		//enable - 1 | not enable - 0
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public List<CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	
	// Tạo map book
	public Map<Book, Integer> getBookMap() {
		Map<Book, Integer> bookMap = new HashMap<Book, Integer>();
		
		for(CartItem cartItem: this.cartItems) {
			bookMap.put(cartItem.getBook(), cartItem.getQuantity());
		}
		
		return bookMap;
	}
	
	
}
