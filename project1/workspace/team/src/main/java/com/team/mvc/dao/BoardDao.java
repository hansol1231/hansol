package com.team.mvc.dao;

import java.util.ArrayList;
import java.util.Map;

import com.team.mvc.dto.BoardDto;

public interface BoardDao {

   public ArrayList<BoardDto> list(Map<String, Integer> map);
   public int select_total_record();
   public BoardDto view(BoardDto bDto);
   public int modify(String bTitle, String bContent, String bIsOpen, int bIdx );
   public int write(BoardDto bDto);
   public int delete(int bIdx);
   
   public ArrayList<BoardDto> replylist();
   public int reply(BoardDto bDto);
   public BoardDto listOne(int bIdx);
   public void update_bStep(BoardDto bDto);
   
   public int updateHit(int bIdx);
   public ArrayList<BoardDto> searchBybType(int bType);
   public ArrayList<BoardDto> searchBybTitle(BoardDto bDto);
   public ArrayList<BoardDto> searchBybWriter(BoardDto bDto);
   public ArrayList<BoardDto> myList(Map<String, Integer> map);
   
   public int select_my_record(int userIdx);
   
   // 분류
   public ArrayList<BoardDto> typeSearch(Map<String, Integer> map);
   public int select_tSearch_record(int bType);
	 
   // 검색
   public ArrayList<BoardDto> querySearch(String sel, String search, int begin, int end);
   public int select_qSearch_record(String sel, String search);
   
}