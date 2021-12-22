package com.springbook.biz.user;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.springbook.biz.board.BoardService;

public class UserServiceClient {

	public static void main(String[] args) {

		//1. spring 컨테이너 구동
		AbstractApplicationContext container = 
				new GenericXmlApplicationContext("applicationContext.xml");

		//2. spring 컨테이너로부터 BoardServiceImpl 객체 lookup
		UserService userService = (UserService) container.getBean("userService");
		
		//3. 로그인 기능테스트
		UserVO vo = new UserVO();
		
		vo.setId("SA");
		vo.setPassword("");
		
		UserVO user = userService.getUser(vo);
		if(user != null) {
			System.out.println(user.getName() + " 님 환영합니다.");
		} else {
			System.out.println("로그인 실패");
		}
		
		//4. 컨테이너종료
		container.close();
	}

}
