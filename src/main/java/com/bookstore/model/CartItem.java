package com.bookstore.model;

public class CartItem {
	private int cartItemId;
	private int cartId;
	private Book book;
	private int quantity;
	private int totalPrice;
	private String status;			// NOT_PURCHER / PURCHER
	
	public  CartItem() {
		this.totalPrice = 0;
	}
	public  CartItem(int cartId,Book book, int quantity) {
		this.cartId = cartId;
		this.book = book;
		this.quantity = quantity;
		this.totalPrice = book.getPrice() * quantity;
	}
	
	public int getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	

	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void updateTotalPrice() {
		this.totalPrice = this.book.getPrice() * quantity;			//Điều kiện  book != null
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof CartItem ) {
			CartItem cartItem = (CartItem) obj;
			return this.cartItemId == cartItem.getCartItemId();
		}
		
		return false;
	}
	
	

	
	
	
}
