package com.hoo.ping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RCommentVO {
	
	private int rcommentId;
	private int memberId;
	private String memberName;
	private Date rcommentDate;
	private String rcommentContents;
	private int reviewId;
}
