package com.team.mvc.item.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dao.ItemDao;
import com.team.mvc.dto.ItemDto;

public class ItemListCommand implements ItemCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		
		ItemDao iDao = sqlSession.getMapper(ItemDao.class);
		
		ArrayList<ItemDto> iList = iDao.list();
		
		model.addAttribute("iList", iList);
		
	}

}
