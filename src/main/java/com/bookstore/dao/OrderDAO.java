package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Order;

public interface OrderDAO {
	boolean add(Order order);
	List<Order> findOrdersNotDelivered();
	List<Order> findOrdersNotDeliveredByPage(int page, int total);
	int getSize();
	void delivered(int orderId);
	List<Order> findBy(int userId, int page, int total);
	
}
