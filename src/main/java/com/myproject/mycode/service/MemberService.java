package com.myproject.mycode.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.MemberDao;
import com.myproject.mycode.model.MemberModel;

@Service
public class MemberService {

	@Autowired
	private MemberDao md; // DAO 주입
	
	/* 회원가입 */
	public void insert(MemberModel member) {
		md.insert(member);
	}
	
	// 로그인 체크
	public MemberModel userCheck(String id) {
		return md.userCheck(id);
	}

	// 신고 회원 singocount +1
	public void updateSingoCount(String qna_nick) {
		// TODO Auto-generated method stub
		md.updateSingoCount(qna_nick);
	}

	// 자유게시판 신고 count + 1
	public void free_updateSingoCount(String free_nick) {
		// TODO Auto-generated method stub
		md.free_updateSingoCount(free_nick);
	}
		
	// 스터디 신고 회원 singocount +1
	public void studyUpdateSingoCount(String study_nick) {
		md.studyUpdateSingoCount(study_nick);
	}
	
	// 중복 아이디
	public int idcheck(String id) {
		// TODO Auto-generated method stub
		 int cnt = 0;
		MemberModel  member = md.idcheck(id);
		 if(member != null)  cnt = 1;       // 중복 ID
		 
		return cnt;
	}

	// 중복 닉네임
	public int nickchk(String nick) {
		// TODO Auto-generated method stub
		int cnt = 0;
		MemberModel member = md.nickchk(nick);
		if(member !=null) cnt = 1; // 중복 닉 
		return cnt;
	}
	
	// 비번찾기
	public MemberModel searchPwd(MemberModel member) {
		// TODO Auto-generated method stub
		return md.searchPwd(member);
	}
	// 임시비번
	public void updatePwd(MemberModel member) {
		// TODO Auto-generated method stub
		md.updatePwd(member);
	}
	// 아이디찾기
	public MemberModel searchId(MemberModel member) {
		// TODO Auto-generated method stub
		return md.searchId(member);
	}
	
}
