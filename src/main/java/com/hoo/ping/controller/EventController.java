package com.hoo.ping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event/")
public class EventController {

	
	@RequestMapping("eventList.do")
	public String event() {
		
		return "/event/event";
	}
}
