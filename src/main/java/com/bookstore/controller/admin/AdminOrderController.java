package com.bookstore.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.OrderDAO;
import com.bookstore.model.CartItem;
import com.bookstore.model.Order;

@Controller
@RequestMapping("/admin/order-manage")
public class AdminOrderController {
	@Autowired
	private OrderDAO orderDAO;
	
	private final int NUMBER_ODER_ONE_PAGE = 5;
	
	@RequestMapping("")
	public String showOrder(Model model, @RequestParam("page") int page) {
		List<Order> orders = orderDAO.findOrdersNotDeliveredByPage(page, NUMBER_ODER_ONE_PAGE);
		
		int size = orderDAO.getSize();
		int totalPage = (int)(Math.ceil((double)size/NUMBER_ODER_ONE_PAGE));
		System.out.println(totalPage);
		for(Order order : orders) {
			List<CartItem> cartItems = order.getCart().getCartItems();
			String sp = "";
			for(CartItem cartItem : cartItems) {
				sp = sp + cartItem.getBook().getName() +" x" + cartItem.getQuantity() + ",";
			}
//			sp.substring(beginIndex, endIndex)
			order.setBookListStr(sp);
		}
		model.addAttribute("orders", orders);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		return "admin/order-manage";
	}
	
	@RequestMapping("/delete")
	public String deliveredOrder(@RequestParam("id") int orderId) {
		orderDAO.delivered(orderId);
		
		return "redirect:/admin/order-manage?page=1";
	}
	
}
