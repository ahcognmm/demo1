package com.bookstore.model;

public class Order {
	private int id;
	private Cart cart;
	private Address address;
	private String orderTime;
	private int totalPrice;
	private int delivered;
	
	private String bookListStr;
	public Order() {
		bookListStr = "";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

	
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	

	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getDelivered() {
		return delivered;
	}
	public void setDelivered(int delivered) {
		this.delivered = delivered;
	}
	public String getBookListStr() {
		return bookListStr;
	}
	public void setBookListStr(String bookListStr) {
		this.bookListStr = bookListStr;
	}

	
	
	
	
}
