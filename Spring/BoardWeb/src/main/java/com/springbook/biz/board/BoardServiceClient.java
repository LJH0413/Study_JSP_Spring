package com.springbook.biz.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {
	
	public static void main(String[] args) {
		
		//1. spring 컨테이너 구동
		AbstractApplicationContext container = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		//2. spring 컨테이너로부터 BoardServiceImpl 객체 lookup
		BoardService boardservice = (BoardService) container.getBean("boardService");
		
		//3. 글 등록 기능 테스트
		BoardVO vo = new BoardVO();
		vo.setTitle("test");
		vo.setWriter("tester");
		vo.setContent("test content : 안녕하세요");
		boardservice.insertBoard(vo);
		
		//4. 글 목록 검색 기능 테스트
		List<BoardVO> boardList = boardservice.getBoardList(vo);
		for(BoardVO board : boardList) {
			System.out.println("---> " + board.toString());
		}
		
		//5. spring 컨테이너 종료
		container.close();
	}

}
