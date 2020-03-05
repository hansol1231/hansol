package com.team.mvc.board.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.common.Paging;
import com.team.mvc.dao.BoardDao;
import com.team.mvc.dto.BoardDto;

public class BoardTypeSearchCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		HttpSession session = request.getSession();
		String currentPage = request.getParameter("currentPage");
		
		int nowPage = 1; // 기본 페이지 번호는 1로 정함
		if ( currentPage != null && !currentPage.isEmpty() ) {
			nowPage = Integer.parseInt(currentPage);
		}
	
		int bType = Integer.parseInt(request.getParameter("bType"));
		
		// 현재 페이지 번호를 request 에 저장
		request.setAttribute("currentPage", nowPage);
		
		// 현재 페이지 번호를 알면
		// 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
		// 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
		int recordPerPage = 15;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		// BDao -> mapper 로 전달할 Map 생성
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("bType", bType);
		
		// 게시물이 열리면 session 에 open 속성이 저장된다.
		// 목록으로 이동하는 경우에 그 값을 삭제한다.
		session.removeAttribute("open");
		
		// 검색 게시글 개수 구하기
		int totalRecord = bDao.select_tSearch_record(bType);
		
		// ◀ 1 2 3 ▶ 생성 (pagingView)
		String pagingView = Paging.getPaging("typeSearch", nowPage, recordPerPage, totalRecord, bType, "0", "");
		
		// request 에 pagingView 저장
		session.setAttribute("pagingView", pagingView);
		
		ArrayList<BoardDto> list = bDao.typeSearch(map);
		session.setAttribute("list", list); 
	}
}
