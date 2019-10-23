package com.bookstore.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class FeedBack {
	private int id;
	
	@NotEmpty(message="Trường này không được để trống")
	private String name;
	@NotEmpty(message="Trường này không được để trống")
	@Email(message="Email không đúng định dạng")
	private String email;
	@NotEmpty(message="Trường này không được để trống")
	private String subject;
	@NotEmpty(message="Trường này không được để trống")
	private String message;
	
	public FeedBack() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

		
	
}
