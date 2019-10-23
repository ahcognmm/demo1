package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Cart;
import com.bookstore.model.CartItem;

@Repository
public class CartDAOImpl implements CartDAO{
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private CartItemDAO cartItemDAO;
	
	private Connection conn = null;
	private PreparedStatement preStatement = null;
	private ResultSet result = null;
	@Override
	public Cart findByUserId(int userId) {
		Cart cart = new Cart();

		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT id,total_price FROM cart WHERE user_id = ? AND enable = ?");
			preStatement.setInt(1, userId);
			preStatement.setInt(2, 1);
			
			result = preStatement.executeQuery();
			if (result.next()) {
				cart.setCartId(result.getInt(1));
				cart.setTotalPrice(result.getInt(2));
				cart.setUserId(userId);
				List<CartItem> items = cartItemDAO.getCartItemListByCartId(cart.getCartId());
				cart.setCartItems(items);
				cart.setEnable(1);

			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			return null;
		}
		return cart;
		
	}
	
	public Cart findByCartId(int cartId) {
		Cart cart = new Cart();

		try {
			conn = dataSource.getConnection();

			preStatement = conn.prepareStatement("Select user_id, total_price from cart Where id = ?");
			preStatement.setInt(1, cartId);
			
			result = preStatement.executeQuery();
			if (result.next()) {
				cart.setUserId(result.getInt(1));
				cart.setTotalPrice(result.getInt(2));
				cart.setCartId(cartId);
			}
			List<CartItem> items = cartItemDAO.getCartItemListByCartId(cart.getCartId());
			cart.setCartItems(items);
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return cart;
		
	}

	@Override
	public void update(Cart cart) {
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("UPDATE cart SET total_price = ? Where id = ?");
			preStatement.setInt(1, cart.getTotalPrice());
			preStatement.setInt(2, cart.getCartId());
			
			int affected = preStatement.executeUpdate();
			if (affected != 1) {
				System.out.println("Update giỏ hàng lỗi");
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	@Override
	public void add(int userId) {
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("INSERT INTO cart(user_id, total_price, enable) VALUES(?,?,?)"); 
			preStatement.setInt(1, userId);
			preStatement.setInt(2, 0);
			preStatement.setInt(3, 1);
			
			int affected = preStatement.executeUpdate();
			if (affected != 1) {
				System.out.println("Tạo giỏ hàng lỗi");
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	// Xóa giỏ hàng bằng cách set enable = 0;
	@Override
	public void delete(int cartId) {
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("UPDATE cart SET enable = 0 Where id = ?");
			preStatement.setInt(1, cartId);
			
			int affected = preStatement.executeUpdate();
			if (affected != 1) {
				System.out.println("Xóa giỏ hàng lỗi");
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
