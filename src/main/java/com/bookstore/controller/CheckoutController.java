	package com.bookstore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.AddressDAO;
import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CartDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.model.Address;
import com.bookstore.model.Book;
import com.bookstore.model.Cart;
import com.bookstore.model.Order;

@Controller
@RequestMapping("checkout")
public class CheckoutController {
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired 
	private BookDAO bookDAO;
	
	@GetMapping("/shipping")
	public String getAddress(HttpServletRequest request, Model model) {
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		
		// Nếu giỏ hàng trống thì quay lại trang chủ 
		int cartId = Integer.parseInt(request.getSession().getAttribute("cartId").toString());
		Cart cart = cartDAO.findByCartId(cartId);
		if (cart.getCartItems().size() == 0) {
			return "redirect:/users/"+ userId+ "/carts/" + cartId;
					
		}
 		List<Address> addresses = addressDAO.findByUserId(userId);
		model.addAttribute("addressList", addresses);
		model.addAttribute("newAddress", new Address());
		return "shipping";
	}
	
	@GetMapping("/payment") 
	public String getPayment(HttpServletRequest request, @RequestParam("addressId") int addressId, Model model) {
		Address address = addressDAO.findBy(addressId);
		request.getSession().setAttribute("address", address);
		
		int cartId = Integer.parseInt(request.getSession().getAttribute("cartId").toString());
		Cart cart = cartDAO.findByCartId(cartId);
		model.addAttribute("totalPriceCart", cart.getTotalPrice());
		
		return "payment";
	}
	
	@PostMapping("/payment/newAddress") 
	public String getPaymentWithNewAddress(HttpServletRequest request,@ModelAttribute("newAddress") Address newAddress, Model model) {
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		newAddress.setUserId(userId);
		int newAddressId = addressDAO.save(newAddress);
		if (newAddressId != 1 ) {
			newAddress.setId(newAddressId);
			request.getSession().setAttribute("address", newAddress);
			
			int cartId = Integer.parseInt(request.getSession().getAttribute("cartId").toString());
			Cart cart = cartDAO.findByCartId(cartId);
			model.addAttribute("totalPriceCart", cart.getTotalPrice());
			
		} else {
			System.out.println("New address lỗi");
			return "error";
		}
		
		return "payment";
	}
	
	@RequestMapping("/order")
	public String processOrder(HttpServletRequest request) {
		// Lưu order vào db 
		Order order = new Order();
		int cartId = Integer.parseInt(request.getSession().getAttribute("cartId").toString());
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		System.out.println("cart id = " + cartId);

		Cart cart = cartDAO.findByCartId(cartId);
		order.setCart(cart);
		order.setAddress((Address) request.getSession().getAttribute("address"));
		order.setTotalPrice(cart.getTotalPrice() + 15000);
		boolean res = orderDAO.add(order);
		if (res == false ) {
			System.out.println("Order lỗi");
			return "error";
		}
		
		// Xóa cart hiện tại : set enable = 0
		cartDAO.delete(cartId);
		// Tạo cart mới cho user 
		cartDAO.add(userId);
		
		// Giảm số lượng sách hiện có 
		Map<Book, Integer> bookMap = (HashMap<Book, Integer>) (request.getSession().getAttribute("bookMap"));
		for(Map.Entry<Book, Integer> entry : bookMap.entrySet()) {
			Book book = entry.getKey();
			int oldTotal = book.getTotalInStock();
			book.setTotalInStock(oldTotal - entry.getValue().intValue());
			int oldNumPurchase = book.getNumPurchase();
			book.setNumPurchase(oldNumPurchase+1);
			bookDAO.updateBook(book);
		}
		System.out.println("Cập nhật số lượng sách thành công");
		// Hiển thị thông báo thành công rồi quay về trang chủ 
		System.out.println("Thanh toán thành công");
		return "paymenSuccessful";
	}
}
