package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.StudyBoardDao;
import com.myproject.mycode.model.StudyBoard;

@Service
public class StudyBoardService {

	@Autowired
	private StudyBoardDao sbd;

	public StudyBoard studySelect(int study_no) {
		// TODO Auto-generated method stub
		return sbd.studySelect(study_no);
	}

	public int studyInsert(StudyBoard studyBoard) {
		// TODO Auto-generated method stub
		return sbd.studyInsert(studyBoard);
	}
	
	// 전체 -> 갯수 & 검색
	public int studyGetCount(StudyBoard studyBoard) {
		// TODO Auto-generated method stub
		return sbd.studyGetCount(studyBoard);
	}

	public void studyUpdateRe(int study_no) {
		// TODO Auto-generated method stub
		sbd.studyUpdateRe(study_no);
	}

	public int studyUpdate(StudyBoard studyBoard) {
		// TODO Auto-generated method stub
		return sbd.studyUpdate(studyBoard);
	}

	public List<StudyBoard> studyList(StudyBoard studyBoard) {
		// TODO Auto-generated method stub
		return sbd.studyList(studyBoard);
	}

	public int studyDelete(int study_no) {
		// TODO Auto-generated method stub
		return sbd.studyDelete(study_no);
	}
	// 모집 완료 0->1 로 업데이트
	public int studyMozip(int study_no) {
		// TODO Auto-generated method stub
		return sbd.studyMozip(study_no);
	}
	// 모집 완료
	public int mozipNum(StudyBoard studyBoard) {
		// TODO Auto-generated method stub
		return sbd.mozipNum(studyBoard);
	}
	// 모집중
	public int mozipingNum(StudyBoard studyBoard) {
		// TODO Auto-generated method stub
		return sbd.mozipingNum(studyBoard);
	}
	// 모집완료 리스트
	public List<StudyBoard> mozip_list(StudyBoard studyBoard) {
		return sbd.mozip_list(studyBoard);
	}
	// 모집중 리스트
	public List<StudyBoard> moziping_list(StudyBoard studyBoard) {
		return sbd.moziping_list(studyBoard);
	}
	// 신고 중복 확인 
	public int getSingoCount(int study_no, int category_no, String member_nick) {
		// TODO Auto-generated method stub
		return sbd.getSingoCount(study_no, category_no, member_nick);
	}
	// 신고글 신고카운트 +1
	public void updateStudySingo(int study_no) {
		// TODO Auto-generated method stub
		sbd.updateStudySingo(study_no);
	}
	
	// 스터디 글번호에 해당하는 신고삭제(40줄)
	public void singoStudyDelete(int study_no, int category_no) {
		// TODO Auto-generated method stub
		sbd.singoStudyDelete(study_no, category_no);
	}
}
