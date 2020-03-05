package com.team.mvc.dao;

import com.team.mvc.dto.MemberDto;

public interface MemberDao {
	
	// 회원 가입
	public int join(MemberDto mDto);
	public MemberDto select_by_userId(String userId);
	public MemberDto select_by_userSN(String userSN);
	public MemberDto select_by_userEmail(String userEmail);
	public MemberDto select_by_userTel(String userTel);
	
	// 로그인
	public MemberDto login(String userId, String userPw);
	public MemberDto login2(String userId);
	
	// 아이디 or 비밀번호 찾기
	public MemberDto select_by_userName_userEmail(String userName, String userEmail);
	public MemberDto select_by_userId_userTel(String userId, String userTel);
	
	// 정보수정
	public int changeInfo(MemberDto mDto);
	public int changePw(MemberDto mDto);
	
	// 회원탈퇴
	public int leave(int userIdx);
	
}
