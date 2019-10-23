package com.bookstore.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CartDAO;
import com.bookstore.dao.CartItemDAO;
import com.bookstore.model.Book;
import com.bookstore.model.Cart;
import com.bookstore.model.CartItem;

@Controller
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CartItemDAO cartItemDAO;
	@Autowired
	private BookDAO bookDAO;

	
	// Xem giỏ hàng 
	@GetMapping("/users/{userId}/carts/{cartId}")
	public String viewCart(@PathVariable("cartId") int cartId,HttpServletRequest request) {
		Cart cart = cartDAO.findByCartId(cartId);
		request.getSession().setAttribute("cart", cart);
		request.getSession().setAttribute("bookMap", cart.getBookMap());
		
		return "cart";
		
	}
	// Thêm sách vào giỏ hàng 
	@RequestMapping("/users/{userId}/carts/{cartId}/add")
	public String addProduct(@PathVariable("userId") int userId, @PathVariable("cartId") Integer cartId, @RequestParam("bookId") Integer bookId
							,@RequestParam("quantity") int quantity) {
		System.out.println("Sach mua:" + quantity);
		// Lấy số lượng sách còn trong kho
		// Check xem số lượng sách trong kho còn đủ không 
		Book theBook = bookDAO.findBy(bookId.intValue());
		int numInStock = theBook.getTotalInStock();
		
		// Check xem sách đã có trong giỏ chưa 
		boolean isExists = cartItemDAO.isExistInCart(cartId, bookId);
		if (isExists == true) {
			// Tăng quantity lên 1
			CartItem cartItem = cartItemDAO.findBy(cartId, bookId);
			int oldQuan = cartItem.getQuantity();
			cartItem.setQuantity(oldQuan+quantity);
			if (cartItem.getQuantity() > numInStock) {
				return "redirect:/shopping/book-detail?id=" + bookId;
			}
			cartItem.updateTotalPrice();			// Cập nhật tổng tiền cho sách vừa mua 
			cartItemDAO.update(cartItem);
			
		} else {
			// Thêm mới cart item
			Book book = bookDAO.findBy(bookId);
			CartItem cartItem = new CartItem(cartId, book, quantity);
			if (cartItem.getQuantity() > numInStock) {
				return "redirect:/shopping/book-detail?id=" + bookId;
			}
			cartItemDAO.addCartItem(cartItem);

		}
	
		return "redirect:/shopping/book-detail?id=" + bookId;
	}
	
	// Xóa sách khỏi giỏ hàng
	@RequestMapping("/users/{userId}/carts/{cartId}/delete")
	public String deleteProduct(@PathVariable("userId") int userId,@PathVariable("cartId") int cartId, @RequestParam("bookId") int bookId) {
		cartItemDAO.delete(cartId,bookId);
		
		return "redirect:/users/"+userId+"/carts/"+cartId;
	}
	
	
	// Cập nhật giỏ hàng 
	@RequestMapping("/users/{userId}/carts/{cartId}/update")
	public String updateCart(@PathVariable("userId") int userId, @PathVariable("cartId") Integer cartId, @RequestParam("bookId") Integer bookId
							,@RequestParam("quantity") int quantity) {
		System.out.println("Số lượng sách mới:" + quantity);

		CartItem cartItem = cartItemDAO.findBy(cartId, bookId);
		cartItem.setQuantity(quantity);
		cartItemDAO.update(cartItem);

		return "redirect:/users/"+userId+"/carts/"+cartId;
	}
	
	// Đặt hàng 
}
