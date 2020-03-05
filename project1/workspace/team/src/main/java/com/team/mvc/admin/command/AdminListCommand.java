package com.team.mvc.admin.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.common.Paging;
import com.team.mvc.dao.AdminDao;
import com.team.mvc.dto.MemberDto;

public class AdminListCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		AdminDao aDao = sqlSession.getMapper(AdminDao.class);
	    HttpSession session = request.getSession();  
		String currentPage = request.getParameter("currentPage");
		int nowPage = 1; 
		if ( currentPage != null && !currentPage.isEmpty() ) {
			nowPage = Integer.parseInt(currentPage);
		}
		session.setAttribute("currentPage", nowPage);
		int recordPerPage = 15;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		session.removeAttribute("open");
		int totalRecord = aDao.select_member_record();
		String pagingView = Paging.getPaging("adminList", nowPage, recordPerPage, totalRecord, 0, "0", "");
		session.setAttribute("pagingView", pagingView);
		ArrayList<MemberDto> list = aDao.adminList(map);
		session.setAttribute("adminList", list); 
		session.setAttribute("adminListResult", totalRecord); 
	}
}
