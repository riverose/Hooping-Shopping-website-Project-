package com.hoo.ping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderPageVO {
	// 불러올 정보---------------
	// 배송지
	private String memberBaseAddress;
	// 받는사람 이름
	private String memberName;
	// 휴대폰 번호
	private String memberPhoneNum;
	// 할인쿠폰
	/*
	 * //private int couponId; private String couponName; private int couponRice;
	 */
	//------------------------
	
	// 보내줄 정보---------------
	// 페이테이블에 저장
	private int deliveryId;

	private String paySize;
	private String payColor;
	private Date payDate;
	private int payCost;
	private int payCount;
	private int memberId;
	private String productName;
	private String productId;
	private String productPrice;
	private int optionsId;
	private String optionsColor;
	private String optionsSize;
	private int reviewId;
	private int refundId;
}