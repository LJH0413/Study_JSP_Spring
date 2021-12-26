package com.springbook.biz.common;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect // aspect = pointcut + advice
public class LogAdvice {
	@Pointcut("execution(* com.springbook.biz..*impl.*(..))")
	public void allPointcut() {}
	
	@Before("allPointcut()")
	public void printLog() {
		System.out.println("[공통로그] 비즈니스 로직 수행 전 동작");
	}
	//pointcut + before (advice)
	
//	@Pointcut("execution(* com.springbook.biz..*impl.get*(..))")
//	public void getPointcut() {}
	

}
