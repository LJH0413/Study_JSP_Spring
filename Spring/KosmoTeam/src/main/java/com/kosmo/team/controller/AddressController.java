package com.kosmo.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddressController {
	
	@RequestMapping("/address") 
	public String address() {
		System.out.println("카카오 API 테스트");
		
		return "address";
	}
}
