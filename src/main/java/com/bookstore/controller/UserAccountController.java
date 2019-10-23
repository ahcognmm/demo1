package com.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.model.CartItem;
import com.bookstore.model.Order;
import com.bookstore.model.User;

@Controller
@RequestMapping("/user")
public class UserAccountController {

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private OrderDAO orderDAO;
	
	@GetMapping("/account/edit")
	public String editAccount(Model model, HttpServletRequest request) {
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		
		return "user-management";
	}
	
	@PostMapping("/account/update")
	public String updateAccount(@Valid @ModelAttribute("user") User user,
								BindingResult bindingResult, Model model) {
		
		if (!user.getPhoneNumber().matches("^[0-9]*$")) {
			model.addAttribute("error", "Số điện thoại không đúng định dạng");
			return "user-management";
		}
		
		userDAO.update(user);
		
		return "redirect:/user/account/edit";
	}
	@PostMapping("/account/updatePassword")
	public String updatePassword(@RequestParam("old_password") String oldPass, 
			@RequestParam("new_password") String newPass, 
			@RequestParam("re_new_password") String renewPass , Model model, HttpServletRequest request) {
		
		// Get old password 
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String passwordDB = userDAO.getPasswordByUserName(user.getUsername());

		//Kiểm tra pass user nhập với pass đã encode trong DB 
		if (!passwordEncoder.matches(oldPass, passwordDB)) {
			int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
			User userD = userDAO.getUserById(userId);
			model.addAttribute("user", userD);
			model.addAttribute("errorPass", "Password cũ không đúng");

			return "user-management";
		}
		
		if (newPass.equals(renewPass)) {
			String encodedPass = passwordEncoder.encode(newPass);
//			encodedPass = "{bcrypt}" + encodedPass;
			userDAO.updatePassword(encodedPass, user.getUsername());
			System.out.println("Thay đổi thành công");
		}
		
		return "redirect:/user/account/edit";
	}
	
	private final int NUMBER_ODER_ONE_PAGE = 5;
	
	@RequestMapping("/orders")
	public String showOrderForUser(Model model, @RequestParam("page") int page, HttpServletRequest request) {
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		List<Order> orders = orderDAO.findBy(userId,page, NUMBER_ODER_ONE_PAGE);
		
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
		return "order-user";
	}
}
