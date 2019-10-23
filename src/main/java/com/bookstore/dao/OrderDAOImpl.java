package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Address;
import com.bookstore.model.Cart;
import com.bookstore.model.Order;
@Repository
public class OrderDAOImpl  implements OrderDAO{
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private DataSource dataSource;
	
	private Connection conn = null;
	private ResultSet result = null;
	private PreparedStatement preStatement = null;
	@Override
	public boolean add(Order order) {
		try {
			conn = dataSource.getConnection();
			// Lưu ý bảng order khi query phải đặt trong ` ` vì trùng với keyword của mysql
			preStatement = conn.prepareStatement("INSERT INTO `order`(user_id, cart_id, address_id, total_price) VALUES(?,?,?,?)");
			preStatement.setInt(1, order.getCart().getUserId());
			preStatement.setInt(2, order.getCart().getCartId());
			preStatement.setInt(3, order.getAddress().getId());
			preStatement.setInt(4, order.getTotalPrice());
			
			int affted = preStatement.executeUpdate();
			if(affted == 1) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return false;
	}
	@Override
	public List<Order> findOrdersNotDelivered() {
		List<Order> orders = new ArrayList<Order>();
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT id, user_id, cart_id, address_id, order_date, total_price"
					+ " FROM `order` WHERE delivered = 0");
			result = preStatement.executeQuery();
			while(result.next()) {
				Order order = new Order();
				Cart cart = new Cart();
				Address address = new Address();
				
				order.setId(result.getInt(1));
				
				cart = cartDAO.findByCartId(result.getInt(3));
				cart.setUserId(result.getInt(2));
				order.setCart(cart);
				
				address  = addressDAO.findBy(result.getInt(4));
				order.setAddress(address);
				
				order.setOrderTime(result.getString(5));
				order.setTotalPrice(result.getInt(6));
				order.setDelivered(0);
				
				orders.add(order);
			}
		} catch(SQLException e ) {
			System.out.println(e.getMessage());
			return null;
		}
		
		return orders;
	}
	@Override
	public List<Order> findOrdersNotDeliveredByPage(int page, int total) {
		List<Order> orders = new ArrayList<Order>();
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT id, user_id, cart_id, address_id, order_date, total_price"
					+ " FROM `order` WHERE delivered = 0 LIMIT " + total +" offset "+ total*(page-1));
			System.out.println(preStatement.toString());
			result = preStatement.executeQuery();
			while(result.next()) {
				Order order = new Order();
				Cart cart = new Cart();
				Address address = new Address();
				
				order.setId(result.getInt(1));
				
				cart = cartDAO.findByCartId(result.getInt(3));
				cart.setUserId(result.getInt(2));
				order.setCart(cart);
				
				address  = addressDAO.findBy(result.getInt(4));
				order.setAddress(address);
				
				order.setOrderTime(result.getString(5));
				order.setTotalPrice(result.getInt(6));
				order.setDelivered(0);
				
				orders.add(order);
			}
		} catch(SQLException e ) {
			System.out.println(e.getMessage());
			return null;
		}
		
		return orders;
	}
	@Override
	public int getSize() {
		int size = -1;
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT count(*) from `order` where delivered = 0");
			result = preStatement.executeQuery();
			if (result.next()) {
				size = result.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return size;
	}
	@Override
	public void delivered(int orderId) {
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("UPDATE `order` SET delivered = 1 WHERE id = ?");
			preStatement.setInt(1, orderId);
			preStatement.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public List<Order> findBy(int userId, int page, int total) {
		List<Order> orders = new ArrayList<Order>();
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT id, user_id, cart_id, address_id, order_date, total_price, delivered"
					+ " FROM `order` WHERE user_id = ? LIMIT " + total +" offset "+ total*(page-1));
			preStatement.setInt(1,userId);
			result = preStatement.executeQuery();
			while(result.next()) {
				Order order = new Order();
				Cart cart = new Cart();
				Address address = new Address();

				order.setId(result.getInt(1));
				
				cart = cartDAO.findByCartId(result.getInt(3));
				cart.setUserId(result.getInt(2));
				order.setCart(cart);
				
				address  = addressDAO.findBy(result.getInt(4));
				order.setAddress(address);
				
				order.setOrderTime(result.getString(5));
				order.setTotalPrice(result.getInt(6));
				order.setDelivered(result.getInt(7));
				
				orders.add(order);
			}
		} catch(SQLException e ) {
			System.out.println(e.getMessage());
			return null;
		}
		
		return orders;
	}

}
