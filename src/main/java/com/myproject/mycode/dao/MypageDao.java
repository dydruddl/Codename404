package com.myproject.mycode.dao;

import org.springframework.stereotype.Repository;

import com.myproject.mycode.model.MemberModel;

@Repository
public interface MypageDao {
	
	// 마이페이지 비번수정
	public int updatepw(MemberModel member);

	// 마이페이지 닉네임 수정
	
	// 마이페이지 수정
	public int updateMember(MemberModel member);
	
	public int deletemember(String id);

	public void deletenoticerep(String nick);

	public void deleteFreeBoard(String nick);

	public void deleteFreerep(String nick);

	public void deleteStudyBoard(String nick);

	public void deleteStudyrep(String nick);

	public void deleteQnaBoard(String nick);

	public void deleteQnarep(String nick);

	public void deleteSingoBoard(String nick);

	public void deleteReportReason(String nick);
}
