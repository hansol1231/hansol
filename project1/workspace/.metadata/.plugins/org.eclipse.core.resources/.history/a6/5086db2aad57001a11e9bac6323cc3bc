package com.team.mvc.admin.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.common.Paging;
import com.team.mvc.dao.AdminDao;
import com.team.mvc.dto.ItemDto;

public class AdminReserveSearchCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {

		AdminDao aDao = sqlSession.getMapper(AdminDao.class);
		
		String sel = request.getParameter("sel");
		String search = request.getParameter("search");
		
		HttpSession session = request.getSession();  
		String currentPage = request.getParameter("currentPage");
		
		int nowPage = 1; // 기본 페이지 번호는 1로 정함
		if ( currentPage != null && !currentPage.isEmpty() ) {
			nowPage = Integer.parseInt(currentPage);
		}
		
		// 현재 페이지 번호를 request 에 저장
		request.setAttribute("currentPage", nowPage);
		
		// 현재 페이지 번호를 알면
		// 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
		// 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
		int recordPerPage = 15;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		session.removeAttribute("open");
		
		int totalRecord = aDao.select_reserve_record(sel, "%" + search + "%");
		
		// ◀ 1 2 3 ▶ 생성 (pagingView)
		String pagingView = Paging.getPaging("reserveSearch", nowPage, recordPerPage, totalRecord, 0, sel, search);
		
		// request 에 pagingView 저장
		session.setAttribute("pagingView", pagingView);
		
		ArrayList<ItemDto> list = aDao.reserveSearch(sel, "%" + search + "%", begin, end);
		session.setAttribute("reserveList", list);
		
	}
}
