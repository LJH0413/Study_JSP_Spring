package com.springbook.biz.common;

import org.aopalliance.intercept.Joinpoint;

public class LogAdvice {
	
	public void printLog(Joinpoint jp)	{
		//조인포인트 선언시 비즈니스 매소드 호출 시에 객체 생성 및 객체에 저장되어 어드바이스 호출시 인자로 넘겨줌
		
		System.out.println("[common log] 비지니스 로직 수행 전 동작");
	}

}
