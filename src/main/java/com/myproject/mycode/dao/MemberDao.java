package com.myproject.mycode.dao;

//import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myproject.mycode.model.MemberModel;

@Repository
public interface MemberDao {
	
	@Autowired
//	private SqlSessionTemplate sst; // DB 주입(root-context.xml 에서 SqlSessionTemplate 주입)
	
	/* 회원저장 */ // MemberService.java 에서 함수 생성
	public int insert(MemberModel member);

	// 로그인 인증체크
	public MemberModel userCheck(String id);
	
	// 신고 카운트
	public void updateSingoCount(String qna_nick);
	
	// 자유게시판 신고 카운트
	public void free_updateSingoCount(String free_nick);

	// 스터디 신고 카운트
	public void studyUpdateSingoCount(String study_nick);
	
	// 아이디 중복검사
	public MemberModel idcheck(String id);

	// 닉넴 중복검사
	public MemberModel nickchk(String nick);

	// 비번찾기
	public MemberModel searchPwd(MemberModel member);

	// 임시비번
	public void updatePwd(MemberModel member);

	// 아이디찾기
	public MemberModel searchId(MemberModel member);
	
}
