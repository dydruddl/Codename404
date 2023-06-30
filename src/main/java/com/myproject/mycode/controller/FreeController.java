package com.myproject.mycode.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.MemberModel;
import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.freeboard;
import com.myproject.mycode.service.FreeBoardService;
import com.myproject.mycode.service.FreeSingoService;
import com.myproject.mycode.service.MemberService;
import com.myproject.mycode.service.PagingPgm;

@Controller
public class FreeController {

	@Autowired
	private FreeBoardService fbs;
	
	@Autowired
	private MemberService memberservice;

	@Autowired
	private FreeSingoService singoservice;

	
	/* 자유게시판 목록 */
	@RequestMapping("/free_list.free")			// nav.jsp, main.jsp
	public String freeboardList(String pageNum, freeboard freeboard, Model model, HttpSession session) {
		final int rowPerPage = 10; // 화면에 출력할 데이터 갯수
		// pageNum 값이 null 이거나 빈 문자열인 경우, 기본값으로 1을 지정해주는 부분
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호

		// int total = bs.getTotal();

		// 검색 조건을 만족하는 전체 데이터의 수를 반환
		int total = fbs.getTotal(freeboard);
		System.out.println("total" + total);

		// 현재 페이지 번호와 한 페이지당 보여줄 게시물의 수를 이용해 시작행과 끝행을 계산하는 부분
		// 페이징 처리를 위해서 시작행과 끝행 계산
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		freeboard.setStartRow(startRow);
		freeboard.setEndRow(endRow);

		int no = total - startRow + 1; // 화면 출력 번호
		List<freeboard> free_list = fbs.list(freeboard);
		System.out.println("free_list" + free_list);
		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");		// 관리자 계정일 때 
		
		
		model.addAttribute("free_list", free_list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		model.addAttribute("adminmodel", adminmodel);				// 관리자 계정일 때 
		// 검색

		model.addAttribute("search", freeboard.getSearch());
		model.addAttribute("keyword", freeboard.getKeyword());

		return "freeboard/free_list";
	}

	/* 자유게시판 작성 페이지 뷰 */
	@RequestMapping("/free_write.free")		// free_list.jsp
	public String freeboardWrite() {
		return "freeboard/free_write";
	}

	/* 자유게시판 글작성 */
	@RequestMapping(value = "insert.free", method = RequestMethod.POST)		// free_write.jsp
//	@RequestMapping("/free_insert.free")
	public String insert(freeboard freeboard, Model model) {

		// 게시글 등록일자를 현재 날짜로 설정
		freeboard.setFree_regdate(new Date(System.currentTimeMillis()));

		// 게시글 등록
		int result = fbs.insert(freeboard);
		if (result == 1)
			System.out.println("글 작성 성공");
		model.addAttribute("result", result);

		// 등록 후, 목록 페이지로 이동
		return "redirect:free_list.free";
	}

	// 상세페이지
	@RequestMapping("/free_view.free")					// free_list.jsp
	public String qnaView(int free_no, String pageNum,HttpSession session, Model model) {

		fbs.updateRe(free_no); // 조회수 증가
		freeboard freeboard = fbs.select(free_no); // 상세 정보 구하기
		
		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");

		model.addAttribute("freeboard", freeboard);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("adminmodel", adminmodel);

		return "freeboard/free_view";
	}

	// 수정 폼
	@RequestMapping("free_update.free")			// free_view.jsp	
	public String freeupdate(int free_no, String pageNum, Model model) {
		freeboard freeboard = fbs.select(free_no); // 상세정보 구하기
		model.addAttribute("freeboard", freeboard);
		model.addAttribute("pageNum", pageNum);

		return "freeboard/free_update";
	}
	
	// 수정
		@RequestMapping("/free_updateform.free")		// free_updateForm.jsp
		public String freeupdate(freeboard freeboard, String pageNum, Model model) {
			
			int result =  fbs.update(freeboard);
			if(result==1) System.out.println("글 수정 성공");
			
			model.addAttribute("result", result);
			model.addAttribute("pageNum", pageNum);
			
			return "freeboard/free_updateform";
		}

	// 삭제 폼
	@RequestMapping("free_delete.free")			// free_view.jsp
	public String freedelete(int free_no, String pageNum, Model model, int category_no) {

		int result = fbs.delete(free_no);

//			model.addAttribute("free_no", free_no);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("category_no", category_no);
		
		fbs.singoFreeDelete(free_no, category_no);
		
		return "freeboard/free_delete";
	}

	/*
	 * // 댓글목록				freeReplyController에 생성함.
	 * 
	 * @RequestMapping("free_relist.free") // free_deleteForm.jsp public String
	 * qna_relist(int free_no, Model model) { freeboard freeboard =
	 * fbs.select(free_no); List<freeboard> free_relist = fbs.relist(free_no);
	 * System.out.println("freeboard:" + freeboard);
	 * System.out.println("free_relist:" + free_relist);
	 * 
	 * model.addAttribute("free_relist", free_relist);
	 * model.addAttribute("freeboard", freeboard);
	 * 
	 * return "freeboard/free_relist"; }
	 */

//	신고 팝업창 들어갈때 category번호와 글번호 가지고 넘어가야됨 qna_nick은 session id.
	// 매개변수 qna_nick은 session아이디 값
	@RequestMapping("report.free")			// free_view.jsp  스크립트부분에서 호출 
	public String report(int free_no, int category_no, int pageNum, HttpSession session, Model model) {
		
		System.out.println("report들어옴" + category_no);
		freeboard freedto = fbs.select(free_no);
		
		// 여기에 같은 이름 같은 글번호 같은 카테고리를 가진 사람이 신고사유테이블에 count됬을때 
		//alert로 이미 신고한 글입니다 뜨게
		
		MemberModel member = (MemberModel) session.getAttribute("memberModel");
		System.out.println("세션 닉 : " + member.getNick());
		
		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");
		
		int samesingocount = fbs.getSingoCount(free_no, category_no, member.getNick());
		
		if(samesingocount > 0) {
			model.addAttribute("result", samesingocount);
			return "singosamealert";
		}
		
		model.addAttribute("membernick", member.getNick());
		model.addAttribute("freeboard", freedto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("adminmodel", adminmodel);
		System.out.println("리턴 시작");
		
		return "freeboard/free_report";						// 신고 폴더에 넣을지. 각자 게시판 폴더에 넣을지 상의 필요? - 각자 게시판 폴더로. freeboard폴더로 이동
	}
	
	@RequestMapping("reportaccess.free")				// free_report.jsp
	public String reportAccess(freeboard freedto, ReportReasonModel reportreasonDto){
		
		try {
		System.out.println("신고 버튼 컨트롤러");
		System.out.println(reportreasonDto.getReport_reason());
		
		System.out.println("카테고리 넘 :" + freedto.getCategory_no());
		System.out.println("글 제목 : " + freedto.getFree_subject());
//		qnadto = qnaservice.select(qnadto.getQna_no());
		
		// 글 번호가 같으면 qnaboard테이블에 qna_singo +1 하는 메서드 만들어야함
		fbs.updateFreeSingo(freedto.getFree_no());
		System.out.println("신고글  + 1 ");
		
		// 여기에 멤버 테이블 같은 닉 신고카운트 +1 하는 메서드 만들어야됨.
		memberservice.free_updateSingoCount(freedto.getFree_nick());
		System.out.println("신고 카운트 올라감");
		
		// 여기서 select로 신고테이블에 있는 category + 글번호가 똑같은 게 있으면 if로 update하는거 써야할듯
		int samewriting = singoservice.findSameSingo(freedto.getCategory_no(),freedto.getFree_no());
		System.out.println(samewriting);
		
		if(samewriting > 0) {
			// 이미 있는글 singocount 업데이트
			singoservice.updateSingoBoardCount(freedto.getCategory_no(),freedto.getFree_no());
			// singo_no 가져오기
			int singo_no = singoservice.getSingoNo(freedto.getCategory_no(),freedto.getFree_no());
			// 신고사유 테이블 insert (이미 그 글이 신고 되어 있을때)
			singoservice.reportReasonInsert(freedto, singo_no, reportreasonDto);
			
			// 신고 테이블 singo_board_count 업데이트
			
		}else {
			// 새로 신고 되었을때 singo테이블에 insert
			singoservice.singoBoardInsert(freedto);
			
			int singo_no = singoservice.getSingoNo(freedto.getCategory_no(),freedto.getFree_no());
			// 신고사유테이블(새로 신고된글일때 insert)
			singoservice.reportReasonInsert(freedto, singo_no, reportreasonDto);
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		// 이 메서드 int형일때 신고 접수가 되었습니다 alert로 나오게?
		//fbs.singo_Boardinsert();
		
		// 신고 사유테이블 insert
		
		return "singosamealert";				// 신고 폴더에 넣을지. 각자 게시판 폴더에 넣을지 상의 필요? - free_singosamealert 쳐냈음.
	}
	
	
	
}
