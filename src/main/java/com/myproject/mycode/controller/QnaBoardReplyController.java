package com.myproject.mycode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.QnaBoard;
import com.myproject.mycode.model.QnaBoardReply;
import com.myproject.mycode.service.QnaBoardReplyService;
import com.myproject.mycode.service.QnaBoardService;

@Controller
public class QnaBoardReplyController {

	@Autowired
	private QnaBoardService qbs;

	@Autowired
	private QnaBoardReplyService qbrs;

	// 댓글목록
	@RequestMapping("/qna_relist")
	public String qna_relist(int qna_no, String pageNum, Model model, HttpSession session) {
		QnaBoard board = qbs.select(qna_no);

		List<QnaBoardReply> qna_relist = qbrs.list(qna_no); // 댓글 목록 구하기
		System.out.println("qna_relist:" + qna_relist);
		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");

		model.addAttribute("qna_relist", qna_relist);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("adminmodel", adminmodel);

		return "qnaboard/qna_relist";
	}

	// 댓글입력
	@RequestMapping("/sInsert")
	public String sInsert(QnaBoardReply qbr, Model model) {

		qbrs.insert(qbr);

		// 부모테이블의 댓글 컬럼을 업데이트 하는 메소드 만들기
		System.out.println("bno:" + qbr.getQna_bno());
		qbrs.insertRenum(qbr.getQna_bno());

		return "redirect:qna_relist?qna_no=" + qbr.getQna_bno();
	}

	// 댓글수정
	@RequestMapping("/repUpdate")
	public String repUpdate(QnaBoardReply qbr, Model model) {
		qbrs.update(qbr);
		return "redirect:qna_relist?qna_no=" + qbr.getQna_bno();

	}

	// 댓글삭제
	@RequestMapping("/repDelete")
	public String delete(QnaBoardReply qbr, Model model) {
		qbrs.delete(qbr.getQna_rno());

		// 부모 테이블의 댓글 컬럼 삭제 메소드
		qbrs.deleteRenum(qbr.getQna_bno());

		return "redirect:qna_relist?qna_no=" + qbr.getQna_bno();
	}

	// 댓글 채택
	@RequestMapping("/rsUpdate")
	public String rsUpdate(int qna_rno, int qna_no, String pageNum, Model model) {
		System.out.println("pageNum:" + pageNum);
		int result = qbrs.rsUpdate(qna_rno); // 댓글 채택
		if (result == 1)
			System.out.println("채택 성공");

		int result1 = qbrs.solupdate(qna_no); // 부모 컬럼 0에서 1로 업데이트 시키기
		if (result1 == 1)
			System.out.println("부모 채택 성공");

		model.addAttribute("qna_rno", qna_rno);
		model.addAttribute("qna_no", qna_no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "qnaboard/qnaResol";
	}

	// 댓글 채택 취소
	@RequestMapping("/rsCancel")
	public String rsCancel(int qna_rno, int qna_no, String pageNum, Model model) {
		int result = qbrs.rsCancel(qna_rno); // 댓글 채택 취소
		if (result == 0)
			System.out.println("채택 취소");

		int result1 = qbrs.solcancel(qna_no); // 부모 컬럼 1에서 0으로 업데이트 시키기
		if (result1 == 0)
			System.out.println("부모 채택 취소");

		model.addAttribute("qna_rno", qna_rno);
		model.addAttribute("qna_no", qna_no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "qnaboard/qnaResol";

	}

}
