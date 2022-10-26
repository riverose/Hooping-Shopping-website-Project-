package com.hoo.ping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private char answerYN;
	private int memberId;
	private String memberName;

}