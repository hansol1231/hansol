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
import com.team.mvc.dto.ItemDto;

public class AdminReserveListCommand implements AdminCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) throws Exception {
   
       AdminDao aDao = sqlSession.getMapper(AdminDao.class);
      
       HttpSession session = request.getSession();  
       
       String currentPage = request.getParameter("currentPage");
       int nowPage = 1; // 기본 페이지 번호는 1로 정함
       if ( currentPage != null && !currentPage.isEmpty() ) {
          nowPage = Integer.parseInt(currentPage);
       }
       
       // 현재 페이지 번호를 request 에 저장
       session.setAttribute("currentPage", nowPage);
         
       // 현재 페이지 번호를 알면
       // 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
       // 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
       int recordPerPage = 15;
       int begin = (nowPage - 1) * recordPerPage + 1;
       int end = begin + recordPerPage - 1;
         
       Map<String, Integer> map = new HashMap<String, Integer>();
       map.put("begin", begin);
       map.put("end", end);
         
       session.removeAttribute("open");
      
       int totalRecord = aDao.select_item_record();
         
       String pagingView = Paging.getPaging("goReserveList", nowPage, recordPerPage, totalRecord, 0, "0", "");
         
       session.setAttribute("pagingView", pagingView);
         
       ArrayList<ItemDto> list = aDao.reservedList(map);
       session.setAttribute("reserveList", list);
   }

}