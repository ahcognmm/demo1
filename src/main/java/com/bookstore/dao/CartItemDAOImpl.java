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

import com.bookstore.model.Book;
import com.bookstore.model.CartItem;

@Repository
public class CartItemDAOImpl implements CartItemDAO{
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private BookDAO bookDAO;
	
	private Connection conn = null;
	private PreparedStatement preStatement = null;
	private ResultSet result = null;
	@Override
	public boolean isExistInCart(int cartId, int bookId) {
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT * FROM cart_item WHERE cart_id =? AND book_id = ?");
			preStatement.setInt(1, cartId);
			preStatement.setInt(2, bookId);
			
			result = preStatement.executeQuery();
			if (result.next()) {
				return true;
			} else {
				return false;
			 }
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<CartItem> getCartItemListByCartId(int cartId) {
		List<CartItem> items = new ArrayList<CartItem>();
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT id,book_id, quantity, total_price FROM cart_item WHERE cart_id = ?");
			preStatement.setInt(1, cartId);
			
			result = preStatement.executeQuery();

			while (result.next()) {
				CartItem cartItem = new CartItem();
				cartItem.setCartItemId(result.getInt(1));
				Book book = bookDAO.findBy(result.getInt(2));
				cartItem.setBook(book);
				cartItem.setQuantity(result.getInt(3));
				cartItem.setTotalPrice(result.getInt(4));
				cartItem.setCartId(cartId);
				items.add(cartItem);

			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			return null;
		}
		return items;
	}

	@Override
	public CartItem findBy(int cartId, int bookId) {
		CartItem cartItem = new CartItem();
		try {
			Book book = bookDAO.findBy(bookId);
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT id, quantity, total_price FROM cart_item where cart_id = ? AND book_id = ?");
			preStatement.setInt(1, cartId);
			preStatement.setInt(2, bookId);
			result = preStatement.executeQuery();
			if (result.next()) {
				cartItem.setCartItemId(result.getInt(1));
				cartItem.setBook(book);
				cartItem.setQuantity(result.getInt(2));
				cartItem.setTotalPrice(result.getInt(3));
				cartItem.setCartId(cartId);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return cartItem;
	}

	@Override
	public void addCartItem(CartItem cartItem) {
		try {
			conn = dataSource.getConnection();
				preStatement = conn.prepareStatement("INSERT INTO cart_item(cart_id, book_id, quantity, total_price) VALUES(?,?,?,?)");
				preStatement.setInt(1, cartItem.getCartId());
				preStatement.setInt(2, cartItem.getBook().getId());
				preStatement.setInt(3, cartItem.getQuantity());
				preStatement.setInt(4, cartItem.getTotalPrice());
				int affected = preStatement.executeUpdate();
				if (affected != 1 ) {
					System.out.println("insert cart item lỗi ");
				}
			}  catch(SQLException e) {
				e.printStackTrace();
			}
		
	}

	@Override
	// Update quantity
	public void update(CartItem cartItem) {
		try {
			conn = dataSource.getConnection();
			// Nếu quantity != 0 thì update quantity
			if (cartItem.getQuantity() != 0) {
				preStatement = conn.prepareStatement("UPDATE cart_item SET quantity = ? , total_price = ? WHERE id = ?");
				preStatement.setInt(1, cartItem.getQuantity());
				preStatement.setInt(2, cartItem.getTotalPrice());
				preStatement.setInt(3, cartItem.getCartItemId());
				int affected = preStatement.executeUpdate();
				if (affected != 1 ) {
					System.out.println("Update cart item lỗi ");
				}
			} 
			// Nếu quantity = 0 thì xóa cart item 
			else {
				preStatement = conn.prepareStatement("DELETE FROM cart_item WHERE id = ?");
				preStatement.setInt(1, cartItem.getCartItemId());
				preStatement.executeUpdate();

			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int cartId, int bookId) {
		try {
			conn = dataSource.getConnection();
			// Nếu quantity != 0 thì update quantity
			
				preStatement = conn.prepareStatement("DELETE FROM cart_item WHERE book_id = ? and cart_id = ?");
				preStatement.setInt(1, bookId);
				preStatement.setInt(2, cartId);
				int affected = preStatement.executeUpdate();
				if (affected != 1 ) {
					System.out.println("Delete cart item lỗi ");
				}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

}
