package com.bs.models;

public class PaymentVO{
	private String payment_id;
	private String payment_type;	
	private String created_date;
	private String price;
	private String user_id;
	private String recv_addr1;
	private String recv_addr2;
	private String recv_zipcode;
	private String recv_phone;
	private String recv_name;
	private String status;
	private String stock;
	
	private String shop_id;
	private String title;
	private String main_img;
	
	
	
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getShop_id() {
		return shop_id;
	}
	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRecv_addr1() {
		return recv_addr1;
	}
	public void setRecv_addr1(String recv_addr1) {
		this.recv_addr1 = recv_addr1;
	}
	public String getRecv_addr2() {
		return recv_addr2;
	}
	public void setRecv_addr2(String recv_addr2) {
		this.recv_addr2 = recv_addr2;
	}
	public String getRecv_zipcode() {
		return recv_zipcode;
	}
	public void setRecv_zipcode(String recv_zipcode) {
		this.recv_zipcode = recv_zipcode;
	}
	public String getRecv_phone() {
		return recv_phone;
	}
	public void setRecv_phone(String recv_phone) {
		this.recv_phone = recv_phone;
	}
	public String getRecv_name() {
		return recv_name;
	}
	public void setRecv_name(String recv_name) {
		this.recv_name = recv_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	
	
	

	
}


/*

payment_id
payment_type	
created_date
price
user_id
recv_addr1
recv_addr2
recv_zipcode
recv_phone
recv_name
status
stock
shop_id
title
main_img



payment_id
payment_type
shop_id
created_date
price
user_id
recv_addr1
recv_addr2
recv_zipcode
recv_phone
recv_name
status


PAYMENT_ID
PAYMENT_TYPE
SHOP_ID
CREATED_DATE
PRICE
USER_ID
RECV_ADDR1
RECV_ADDR2
RECV_ZIPCODE
RECV_PHONE
RECV_NAME
STATUS

*/