package com.model;

import java.sql.Date;

public class products {
	int id;
	String productName;
	String Description;
	String Supplier;
	int mobile;
	int quantity;
	double price;
	double SubTotal;
	Date date;
	int TotalQuantity;
	int count;

	
	public int getId() {
		return id;
	}
	public String getProductName() {
		return productName;
	}
	public int getTotalQuantity() {
		return TotalQuantity;
	}
	public void setTotalQuantity(int totalQuantity) {
		TotalQuantity = totalQuantity;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getSupplier() {
		return Supplier;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setSupplier(String supplier) {
		Supplier = supplier;
	}
	public int getMobile() {
		return mobile;
	}
	public void setMobile(int mobile) {
		this.mobile = mobile;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getSubTotal() {
		return SubTotal;
	}
	public void setSubTotal(double subTotal) {
		SubTotal = subTotal;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setDate(Date date) {
		this.date=date;
	}

}
