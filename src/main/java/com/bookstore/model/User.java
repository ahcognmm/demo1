	package com.bookstore.model;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class User {
	private int id;
	@NotEmpty(message="Tên tài khoản không được trống")
	private String userName;
	
	@NotEmpty(message="Mật khẩu không được trống")
	@Size(min=8, message="Mật khẩu ít nhất 8 ký tự")
	private String password;

	private String firstName;
	
	private String lastName;
	@NotEmpty(message="Email không được trống")
	@Email(message="Email không đúng định dạng")
	private String email;
	
	private String phoneNumber;
	
	private String role;
	
	private Cart cart;
	
	private List<Address> adressList;
	
	public User() {}
	public User(@NotNull String userName, @NotNull String firstName, @NotNull String lastName, @NotNull String email,
			@NotNull String phoneNumber, String role) {
		super();
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.role = role;
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Address> getAdressList() {
		return adressList;
	}
	public void setAdressList(List<Address> adressList) {
		this.adressList = adressList;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
}
	
