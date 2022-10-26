package com.hoo.ping.domain;

import lombok.Data;

@Data
public class OptionsVO {
	private int optionsId;
	private int productId;
	private String optionsColor;
	private String optionsSize;
	private int optionsStock;
}
