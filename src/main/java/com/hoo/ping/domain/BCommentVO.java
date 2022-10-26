package com.hoo.ping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BCommentVO {
	
	private int bcommentId;
	private String bcommentUser;
	private Date bcommentDate;
	private String bcommentContents;
	private int boardId;
	
}
