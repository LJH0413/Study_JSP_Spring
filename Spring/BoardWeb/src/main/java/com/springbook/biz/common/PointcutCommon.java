package com.springbook.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	
	@Pointcut("execution(* com.springbook.biz..*impl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.springbook.biz..*impl.get*(..))")
	public void getPointcut() {}

}
