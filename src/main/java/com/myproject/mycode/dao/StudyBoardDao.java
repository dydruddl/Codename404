package com.myproject.mycode.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myproject.mycode.model.StudyBoard;

@Mapper
public interface StudyBoardDao {

	StudyBoard studySelect(int study_no);

	int studyInsert(StudyBoard studyBoard);

	int studyGetCount(StudyBoard studyBoard);

	void studyUpdateRe(int study_no);

	int studyUpdate(StudyBoard studyBoard);

	List<StudyBoard> studyList(StudyBoard studyBoard);

	int studyDelete(int study_no);

	int studyMozip(int study_no); // 모집완료 1로 업데이트

	int mozipNum(StudyBoard studyBoard); // 모집완료 갯수

	int mozipingNum(StudyBoard studyBoard); // 모집중 갯수

	List<StudyBoard> mozip_list(StudyBoard studyBoard); // 모집완료 리스트

	List<StudyBoard> moziping_list(StudyBoard studyBoard); // 모집중 리스트
	
	public int getSingoCount(int study_no, int category_no, String member_nick); // 신고 중복 확인 

	public void updateStudySingo(int study_no);	// 신고글 신고카운트 +1

	void singoStudyDelete(int study_no, int category_no); // 스터디 글번호에 해당하는 신고삭제
	
}
