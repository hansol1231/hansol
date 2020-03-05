package com.team.mvc.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.team.mvc.dto.ItemDto;
import com.team.mvc.dto.MemberDto;

public interface AdminDao {
   
   public ArrayList<MemberDto> adminList(Map<String, Integer> map);
   
   public MemberDto adminView(int userIdx);
   
   public int adminModify(String userId,
                        String userPw,
                        String userName,
                        String userSN,
                        String userAddr,
                        String userEmail,
                        String userTel,
                        int userIdx
                      );
   public int adminWrite(String userId,
                       String userPw,
                       String userName,
                       String userSN,
                       String userAddr,
                       String userEmail,
                       String userTel
                     );
   public ArrayList<MemberDto> dynamicQueryList(String sel, String search, int begin, int end);
  
   public int adminAddCalendar(int iMonth, int iDay, int iTime);
   
   public ArrayList<ItemDto> adminSearchCalendar(int iMonth, int iTime);   // adminAddCalendar와 함께 사용. (월의 데이터가 이미 추가되어있는지 확인용)

   public int adminRemoveCalendar(@Param("iMonth")int iMonth, @Param("iDay")int iDay);
   
   public int select_member_record();
   
   // 예약 리스트 받기(관리자)
   public ArrayList<ItemDto> reservedList(Map<String, Integer> map);
   
   public int select_item_record();

   public int select_search_record(String sel, String search);
   
   // 예약 승인
   public int ackReserve(int iMonth, int iDay, int iTime, String iReserve);

   public ArrayList<ItemDto> reserveSearch(String sel, String search, int begin, int end);
   
   public int select_reserve_record(String sel, String search);
 
}