package com.springbook.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@Controller
public class LogoutController  {

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}

}
