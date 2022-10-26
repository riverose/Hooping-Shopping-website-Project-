package com.hoo.ping.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int productId; // 상품번호
	private String productGender; // 상품 타겟 성별
	private String productName; // 상품 이름
	private int productPrice; // 상품 가격
	private String productType; // 상품 카테고리
	private String productInfo; // 상품 정보
	private String productCo; // 상품 회사
	private String eventId; // 이벤트 번호
	
	// pimage join 시 필요한 데이터
	private String pimageAddr1;
	// review join 시 필요한 데이터
	private String reviewImg;

	// myPage 필요한 데이터
	private int deliveryId;
	private String optionsColor;
	private String optionsSize;
	private String memberId;
	
}
