package com.myproject.mycode.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.MypageDao;
import com.myproject.mycode.model.MemberModel;

@Service
public class MypageService {

	@Autowired
	private MypageDao mydao; // DAO 주입

	// 비밀번호 수정
	public int updatepw(MemberModel member) {
		return mydao.updatepw(member);
	}

	// 닉네임 수정

	// 마이페이지 수정
	public int updateMember(MemberModel member) {
		// TODO Auto-generated method stub
		return mydao.updateMember(member);
	}

	public int deletemember(String id) {
		// TODO Auto-generated method stub
		return mydao.deletemember(id);
	}

	public void deletenoticerep(String nick) {
		// TODO Auto-generated method stub
		mydao.deletenoticerep(nick);
	}

	public void deleteFreeBoard(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteFreeBoard(nick);
	}

	public void deleteFreerep(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteFreerep(nick);
	}

	public void deleteStudyBoard(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteStudyBoard(nick);
	}

	public void deleteStudyrep(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteStudyrep(nick);
	}

	public void deleteQnaBoard(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteQnaBoard(nick);
	}

	public void deleteQnarep(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteQnarep(nick);
	}

	public void deleteSingoBoard(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteSingoBoard(nick);
	}

	public void deleteReportReason(String nick) {
		// TODO Auto-generated method stub
		mydao.deleteReportReason(nick);
	}
}
