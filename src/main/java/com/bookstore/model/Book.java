package com.bookstore.model;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;


public class Book {
	private int id;
	@NotEmpty(message="Tên sách không được để trống")			// @NotEmpty chỉ dành cho String and Collection
	private String name;
	
	@JsonIgnore
	@NotEmpty(message="Tác giả không được để trống")
	private String author;
	
	@JsonIgnore
	@NotEmpty(message="NXB không được để trống")
	private String publisher;
	
	@JsonIgnore
	@NotEmpty(message="Thể loại không được để trống")
	private String category;
	
	@NotEmpty(message="URL không được để trống")
	private String image;
	
	@JsonIgnore
	@NotEmpty(message="Giới thiệu không được để trống")
	private String description;
	
	private int price;
	@JsonIgnore
	private int year;
	@JsonIgnore
	private int totalInStock;
	@JsonIgnore
	private int numPurchase;
	@JsonIgnore
	private String createdAt;
	@JsonIgnore
	private int rating;

	public Book(String name, String author, String image,
			int totalInStock, int price, int year, String description) {
		super();
		this.name = name;
		this.author = author;
		this.image = image;
		this.totalInStock = totalInStock;
		this.price = price;
		this.year = year;
		this.description = description;
	}

	public Book() {
	
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getTotalInStock() {
		return totalInStock;
	}

	public void setTotalInStock(int totalInStock) {
		this.totalInStock = totalInStock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getNumPurchase() {
		return numPurchase;
	}

	public void setNumPurchase(int numPurchase) {
		this.numPurchase = numPurchase;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
	
	
	
}
