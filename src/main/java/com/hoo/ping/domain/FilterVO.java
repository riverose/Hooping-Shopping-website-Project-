package com.hoo.ping.domain;

public class FilterVO {
	static public String gender;
	static public String type;
	static public int priceMin;
	static public int priceMax;
	static public String brand;
	
	static public void reset() {
		gender="";
		type="";
		priceMin=0;
		priceMax=9999999;
		brand="";
	}
}
