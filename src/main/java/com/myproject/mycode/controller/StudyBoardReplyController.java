package com.myproject.mycode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.StudyBoard;
import com.myproject.mycode.model.StudyBoardReply;
import com.myproject.mycode.service.StudyBoardReplyService;
import com.myproject.mycode.service.StudyBoardService;

@Controller
public class StudyBoardReplyController {
	
	@Autowired
	private StudyBoardService sbs;
	
	@Autowired
	private StudyBoardReplyService sbrs;
	
	// 댓글 목록
	@RequestMapping("/study_relist")
	public String study_relist(int study_no, Model model, HttpSession session) {
		StudyBoard std_board = sbs.studySelect(study_no);
		List<StudyBoardReply> study_relist = sbrs.studyList(study_no);
		System.out.println("std_board:"+std_board);
		System.out.println("study_relist:"+study_relist);
		
		model.addAttribute("study_relist", study_relist);
		model.addAttribute("std_board", std_board);
		
		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");
		model.addAttribute("adminmodel", adminmodel);
		
		return "studyboard/study_relist";
	}
	
	//댓글입력
	@RequestMapping("/repStudyInsert.study")
	public String sInsert(StudyBoardReply sbr, Model model, HttpSession session) {
//		qbr.setQna_re_nick((String)session.getAttribute("qna_re_nick"));
		System.out.println("study_replytext:" + sbr.getStudy_replytext());
		System.out.println();
		System.out.println();
		
		sbrs.repStudyInsert(sbr);
		return "redirect:study_relist?study_no="+sbr.getStudy_no();
	}
	
	// 댓글수정
	@RequestMapping("/repStudyUpdate")
	public String repUpdate(StudyBoardReply sbr, Model model) {
		sbrs.studyUpdate(sbr);
		return "redirect:study_relist?study_no="+sbr.getStudy_no();
	}
	
	// 댓글삭제
	@RequestMapping("/repStudyDelete")
	public String delete(StudyBoardReply sbr, Model model) {
		sbrs.studyDelete(sbr.getStudy_rno());
		return "redirect:study_relist?study_no="+sbr.getStudy_no();
	}
}
