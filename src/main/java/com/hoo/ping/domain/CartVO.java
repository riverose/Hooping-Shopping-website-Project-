package com.hoo.ping.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cartId;
	private int memberId;
	private int cartCount; 
	private String cartSize;
	private String cartColor;
	private int productId;
	private int productPrice;
	private String productName;
	private int optionsStock;
	private int cartSum;
	private String pimageAddr1;
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public String getCartSize() {
		return cartSize;
	}
	public void setCartSize(String cartSize) {
		this.cartSize = cartSize;
	}
	public String getCartColor() {
		return cartColor;
	}
	public void setCartColor(String cartColor) {
		this.cartColor = cartColor;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
}