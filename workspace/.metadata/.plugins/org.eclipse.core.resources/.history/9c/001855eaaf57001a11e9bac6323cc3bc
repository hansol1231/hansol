package com.team.mvc.dao;

import java.util.ArrayList;

import com.team.mvc.dto.ItemDto;

public interface ItemDao {

   // 예약된 운동장 가져오기
   public ArrayList<ItemDto> list();
   
   // 예약된 운동장 상세정보 (여러개 일수도 있음)
   public ArrayList<ItemDto> view(String userId, int begin, int end);
   public ArrayList<ItemDto> view_one_list(String userId, int begin, int end);
   
   // 예약하기
   public int reserve(String userId, int iMonth, int iDay, int iTime, String iReserve);
   
   // 예약취소
   public int cancel(int iMonth, int iDay, int iTime, String userId, String iReserve);
   
   // 예약 내역 페이징 관련
   public int select_total_record(String userId);
   public int select_total_record_by_userId(String userId);
   
   
}