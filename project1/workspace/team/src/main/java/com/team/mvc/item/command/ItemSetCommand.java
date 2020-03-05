package com.team.mvc.item.command;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dto.ItemDto;

public class ItemSetCommand implements ItemCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		
		int iMonth = Integer.parseInt( request.getParameter("iMonth") );
		int iDay = Integer.parseInt( request.getParameter("iDay") );
		int iTime = Integer.parseInt( request.getParameter("iTime") );
		
		ItemDto iDto = new ItemDto();
		iDto.setiMonth(iMonth);
		iDto.setiDay(iDay);
		iDto.setiTime(iTime);
		
		model.addAttribute("iDto", iDto);
		
	}

}
