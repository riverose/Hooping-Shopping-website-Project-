package com.hoo.ping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private int memberId;
	private String memberPwd;
	private String memberName;
	private String memberEmail;
	private String memberPhoneNum;
	private int memberRating;
	private Date memberSignUpDate;
	private String memberBaseAddress;
	private String memberInstagramId;
	private String userEmail1;
	private String userEmail2;
	private String memberRateName;
	private Date memberRateDate;
	// COUPON
	private int couponId;
	private String couponName;
	private String couponPrice;
	
	// MANAGER
	private int managerId;
	private String managerEmail;
	private String managerPwd;
	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhoneNum() {
		return memberPhoneNum;
	}
	public void setMemberPhoneNum(String memberPhoneNum) {
		this.memberPhoneNum = memberPhoneNum;
	}
	public int getMemberRating() {
		return memberRating;
	}
	public void setMemberRating(int memberRating) {
		this.memberRating = memberRating;
	}
	public Date getMemberSignUpDate() {
		return memberSignUpDate;
	}
	public void setMemberSignUpDate(Date memberSignUpDate) {
		this.memberSignUpDate = memberSignUpDate;
	}
	public String getMemberBaseAddress() {
		return memberBaseAddress;
	}
	public void setMemberBaseAddress(String memberBaseAddress) {
		this.memberBaseAddress = memberBaseAddress;
	}
	public String getMemberInstagramId() {
		return memberInstagramId;
	}
	public void setMemberInstagramId(String memberInstagramId) {
		this.memberInstagramId = memberInstagramId;
	}

	
	
}
