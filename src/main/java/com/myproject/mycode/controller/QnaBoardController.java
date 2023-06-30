package com.myproject.mycode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.MemberModel;
import com.myproject.mycode.model.QnaBoard;
import com.myproject.mycode.service.PagingPgm;
import com.myproject.mycode.service.PagingPgm2;
import com.myproject.mycode.service.PagingPgm3;
import com.myproject.mycode.service.QnaBoardService;

@Controller
public class QnaBoardController {

	@Autowired
	private QnaBoardService qnaService;
	
	// 목록
	@RequestMapping("qna_list.qna")
	public String qna_(String pageNum, QnaBoard qnaBoard, HttpSession session, Model model) {
		
			final int rowPerPage = 10; // 한 페이지 당 출력할 개수 
			
			if(pageNum==null || pageNum.equals("")) {
				pageNum="1";
			}
			int currentPage = Integer.parseInt(pageNum); // 현재 페이지 
			
			int total=qnaService.getCount(qnaBoard); // 총 개수 구하기
			System.out.println("total:"+total);
			
			int startRow=(currentPage-1)*rowPerPage+1;
			int endRow = startRow + rowPerPage-1;
			PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
			qnaBoard.setStartRow(startRow);
			qnaBoard.setEndRow(endRow);
			
			
			int no= total-startRow+1; // 화면 출력 번호
			List<QnaBoard> list = qnaService.list(qnaBoard); // 전체 목록 출력
		
			AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");
			
			model.addAttribute("list", list);
			model.addAttribute("no", no);
			model.addAttribute("pp", pp);
			model.addAttribute("adminmodel", adminmodel);
		
			model.addAttribute("search", qnaBoard.getSearch());
			model.addAttribute("keyword", qnaBoard.getKeyword());

		return "qnaboard/qna_list";
	}
	
	// 해결탭
		// 해결 목록
		@RequestMapping("qna_sol.qna")
		public String qnasol(String pageNum2, QnaBoard qnaBoard, Model model) {
			
			final int rowPerPage2 = 10; // 한 페이지 당 출력할 개수

			if (pageNum2 == null || pageNum2.equals("")) {
				pageNum2 = "1";
			}
			int currentPage2 = Integer.parseInt(pageNum2); // 현재 페이지

			int total2 = qnaService.solnum(qnaBoard); // 해결 총 개수 구하기
			System.out.println("total2:" + total2); 

			int startRow2 = (currentPage2 - 1) * rowPerPage2 + 1;
			int endRow2 = startRow2 + rowPerPage2 - 1;
			PagingPgm2 pp2 = new PagingPgm2(total2, rowPerPage2, currentPage2);
			qnaBoard.setStartRow2(startRow2);
			qnaBoard.setEndRow2(endRow2);

			int solnum = total2 - startRow2 + 1; // 화면 출력 번호
			List<QnaBoard> solist = qnaService.solist(qnaBoard); // 해결 탭 목록 구하기
			System.out.println("solist:"+solist);
			
			model.addAttribute("pp2", pp2);
			model.addAttribute("solnum", solnum);
			model.addAttribute("solist", solist);
			model.addAttribute("search", qnaBoard.getSearch());
			model.addAttribute("keyword", qnaBoard.getKeyword());
			
			return "qnaboard/qna_sol";
		}
		
		// 미해결탭
		@RequestMapping("qna_unsol.qna")
		public String qnaunsol(String pageNum3, QnaBoard qnaBoard, Model model) {
			final int rowPerPage3 = 10; // 한 페이지 당 출력할 개수

			if (pageNum3 == null || pageNum3.equals("")) {
				pageNum3 = "1";
			}
			int currentPage3 = Integer.parseInt(pageNum3); // 현재 페이지

			int total3 = qnaService.unsolnum(qnaBoard); // 미해결 총 개수 구하기
			System.out.println("total3:" + total3);

			int startRow3 = (currentPage3 - 1) * rowPerPage3 + 1;
			int endRow3 = startRow3 + rowPerPage3 - 1;
			PagingPgm3 pp3 = new PagingPgm3(total3, rowPerPage3, currentPage3);
			qnaBoard.setStartRow3(startRow3);
			qnaBoard.setEndRow3(endRow3);

			int unsolnum = total3 - startRow3 + 1; // 화면 출력 번호
			List<QnaBoard> unsolist = qnaService.unsolist(qnaBoard); // 미해결 목록 
			System.out.println("unsolist:"+unsolist);
					
			model.addAttribute("pp3", pp3);
			model.addAttribute("unsolnum", unsolnum);
			model.addAttribute("unsolist",unsolist);
			model.addAttribute("search", qnaBoard.getSearch());
			model.addAttribute("keyword", qnaBoard.getKeyword());
			return "qnaboard/qna_unsol";
				}
		
		
		
		
	
	// 글작성 폼
	@RequestMapping("qnaInsertForm.qna")
	public String qnaInsertForm() {
		return "qnaboard/qnaInsertForm";
	}
	
	// 글 작성
	@RequestMapping("/qnaInsert.qna")
	public String qnaInsert(QnaBoard qnaBoard, Model model, HttpSession session) {
		
		
		int result =  qnaService.insert(qnaBoard);
		
		if(result==1) System.out.println("글 작성 성공");
		
		model.addAttribute("result", result);
		return "qnaboard/qnaInsert";
		
	}
	
	// 상세페이지
	@RequestMapping("/qnaView.qna")
	public String qnaView(int qna_no, String pageNum, HttpSession session, Model model) {
		
		qnaService.updateRe(qna_no); // 조회수 증가
		QnaBoard qnaBoard = qnaService.select(qna_no); // 상세 정보 구하기
		
		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");
		
		model.addAttribute("qnaBoard", qnaBoard);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("adminmodel", adminmodel);
		
		return "qnaboard/qnaView";
	}
	
	// 수정 폼
	@RequestMapping("qnaUpdateForm.qna")
	public String qnaUpdateForm(int qna_no, String pageNum, Model model) {
		QnaBoard qnaBoard = qnaService.select(qna_no); // 상세정보 구하기
		model.addAttribute("qnaBoard", qnaBoard);
		model.addAttribute("pageNum", pageNum);
		
		return "qnaboard/qnaUpdateForm";
	}
	
	// 수정
	@RequestMapping("/qnaUpdate.qna")
	public String qnaUpdate(QnaBoard qnaBoard, String pageNum, Model model) {
		
		int result =  qnaService.update(qnaBoard);
		if(result==1) System.out.println("글 수정 성공");
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "qnaboard/qnaUpdate";
	}
	 
	// 삭제 폼
	@RequestMapping("qnaDeleteForm.qna")
	public String qnaDeleteForm(int qna_no, int category_no, String pageNum, Model model) {
		
		model.addAttribute("qna_no", qna_no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("category_no", category_no);
		
		return "qnaboard/qnaDeleteForm";
	}
	
	//삭제

	 @RequestMapping("/qnaDelete.qna") 
	 public String qnaDelete(String pageNum, int qna_no, Model model, int category_no) { // 삭제 폼에서 보낸 page값 받기
	 
		 int result = qnaService.delete(qna_no); 
		 if(result==1)
			 System.out.println("글 삭제 성공");
	  
		 qnaService.singoQnadelete(qna_no,category_no);
		 
		 model.addAttribute("result", result); 
		 model.addAttribute("pageNum", pageNum);
		 model.addAttribute("category_no", category_no);
		 return "qnaboard/qnaDelete"; 
	 }
}
