package com.myproject.mycode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.MemberModel;
import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.StudyBoard;
import com.myproject.mycode.service.MemberService;
import com.myproject.mycode.service.PagingPgm;
import com.myproject.mycode.service.StudyBoardService;
import com.myproject.mycode.service.StudySingoService;

@Controller
public class StudyController {

	@Autowired
	private MemberService memberservice;
	@Autowired
	private StudyBoardService studyService;
	@Autowired
	private StudySingoService singoservice;

	/* 신고 기능 */
	// Study 신고 기능
	// 신고 팝업창 들어갈때 category 번호와 글번호 가지고 넘어가야됨 study_nick 은 session id
	// 매개변수 study_nick 은 session 아이디 값
	@RequestMapping("studyReport.study")
	public String report(int study_no, int category_no, int pageNum, HttpSession session, Model model) {

		System.out.println("report들어옴" + category_no);
		StudyBoard studydto = studyService.studySelect(study_no);

		// 여기에 같은 이름 같은 글번호 같은 카테고리를 가진 사람이 신고사유테이블에 count됬을때
		// alert로 이미 신고한 글입니다 뜨게

		MemberModel member = (MemberModel) session.getAttribute("memberModel");
		System.out.println("세션 닉 : " + member.getNick());

		int samesingocount = studyService.getSingoCount(study_no, category_no, member.getNick());

		if (samesingocount > 0) {
			model.addAttribute("result", samesingocount);
			return "singosamealert";
		}

		model.addAttribute("membernick", member.getNick());
		model.addAttribute("studyboard", studydto);
		model.addAttribute("pageNum", pageNum);
		System.out.println("리턴 시작");

		return "studyReport"; // studyReport.jsp
	}

	@RequestMapping("studyreportaccess.study")
	public String reportAccess(StudyBoard studydto, ReportReasonModel reportreasonDto) {

		try {
			System.out.println("신고 버튼 컨트롤러");
			System.out.println(reportreasonDto.getReport_reason());

			System.out.println("카테고리 넘 :" + studydto.getCategory_no());
			System.out.println("글 제목 : " + studydto.getStudy_subject());
//			studydto = qnaservice.select(qnadto.getQna_no());

			// 글 번호가 같으면 qnaboard테이블에 qna_singo +1 하는 메서드 만들어야함
			studyService.updateStudySingo(studydto.getStudy_no());
			System.out.println("신고글  + 1 ");

			// 여기에 멤버 테이블 같은 닉 신고카운트 +1 하는 메서드 만들어야됨.
			memberservice.studyUpdateSingoCount(studydto.getStudy_nick());
			System.out.println("신고 카운트 올라감");

			// 여기서 select로 신고테이블에 있는 category + 글번호가 똑같은 게 있으면 if로 update하는거 써야할듯
			int samewriting = singoservice.findSameSingo(studydto.getCategory_no(), studydto.getStudy_no());
			System.out.println(samewriting);

			if (samewriting > 0) {
				// 이미 있는글 singocount 업데이트
				singoservice.updateSingoBoardCount(studydto.getCategory_no(), studydto.getStudy_no());
				// singo_no 가져오기
				int singo_no = singoservice.getSingoNo(studydto.getCategory_no(), studydto.getStudy_no());
				// 신고사유 테이블 insert (이미 그 글이 신고 되어 있을때)
				singoservice.reportReasonInsert(studydto, singo_no, reportreasonDto);

				// 신고 테이블 singo_board_count 업데이트

			} else {
				// 새로 신고 되었을때 singo테이블에 insert
				singoservice.singoBoardInsert(studydto);

				int singo_no = singoservice.getSingoNo(studydto.getCategory_no(), studydto.getStudy_no());
				// 신고사유테이블(새로 신고된글일때 insert)
				singoservice.reportReasonInsert(studydto, singo_no, reportreasonDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 이 메서드 int형일때 신고 접수가 되었습니다 alert로 나오게?
		// qnaservice.singo_Boardinsert();

		// 신고 사유테이블 insert

		return "singosamealert"; // -> singosamealert.jsp
	}

	// 전체 리스트 + 검색
	@RequestMapping("study_list.study")
	public String study_list(String pageNum, StudyBoard studyBoard, Model model, HttpSession session) {

		final int rowPerPage = 10; // 한 페이지 당 출력할 개수

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지

		int total = studyService.studyGetCount(studyBoard); // 총 개수 구하기
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp_study_list = new PagingPgm(total, rowPerPage, currentPage);
		studyBoard.setStartRow(startRow);
		studyBoard.setEndRow(endRow);

		int no = total - startRow + 1; // 화면 출력 번호
		List<StudyBoard> study_list = studyService.studyList(studyBoard);

		int mozipNum = studyService.mozipNum(studyBoard); // 모집완료num 추가
		int mozipingNum = studyService.mozipingNum(studyBoard); // 모집중num 추가
		System.out.println("list:" + study_list); // 확인차 출력

		model.addAttribute("list", study_list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp_study_list);
		model.addAttribute("mozipNum", mozipNum); // 모집완료 갯수 추가
		model.addAttribute("mozipingNum", mozipingNum); // 모집중 갯수 추가

		// 검색 기능
		model.addAttribute("search", studyBoard.getSearch());
		model.addAttribute("keyword", studyBoard.getKeyword());

		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");
		model.addAttribute("adminmodel", adminmodel);
		
		return "studyboard/study_list";
	}

	// 모집 완료 리스트 + 검색
	@RequestMapping("study_mozip.study") // <- study_list.jsp
	public String study_mozip(String pageNum, StudyBoard studyBoard, Model model) {

		final int rowPerPage = 10; // 한 페이지 당 출력할 개수

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지

		int total = studyService.mozipNum(studyBoard); // 총 개수 구하기
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp_study_mozip_list = new PagingPgm(total, rowPerPage, currentPage);
		studyBoard.setStartRow(startRow);
		studyBoard.setEndRow(endRow);

		int mozipNum = total - startRow + 1; // 화면 출력 번호

		List<StudyBoard> mozipList = studyService.mozip_list(studyBoard);
		System.out.println("list:" + mozipList); // 확인차 출력

		model.addAttribute("pp2", pp_study_mozip_list);
		model.addAttribute("mozipNum", mozipNum); // num
		model.addAttribute("mozipList", mozipList); // list

		// 검색 기능
		model.addAttribute("search", studyBoard.getSearch());
		model.addAttribute("keyword", studyBoard.getKeyword());

		return "studyboard/study_mozip_list"; // -> study_mozip_list.jsp
	}

	// 모집중
	@RequestMapping("study_moziping.study") // <- study_list.jsp
	public String study_moziping(String pageNum, StudyBoard studyBoard, Model model) {

		final int rowPerPage = 10; // 한 페이지 당 출력할 개수

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지

		int total = studyService.mozipingNum(studyBoard); // 총 개수 구하기
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp_study_moziping_list = new PagingPgm(total, rowPerPage, currentPage);
		studyBoard.setStartRow(startRow);
		studyBoard.setEndRow(endRow);

		int mozipimgNum = total - startRow + 1; // 화면 출력 번호
		List<StudyBoard> mozipingList = studyService.moziping_list(studyBoard);
		System.out.println("list:" + mozipingList); // 확인차 출력

		model.addAttribute("pp3", pp_study_moziping_list);
		model.addAttribute("mozipimgNum", mozipimgNum); // num
		model.addAttribute("mozipingList", mozipingList); // list

		// 검색 기능
		model.addAttribute("search", studyBoard.getSearch());
		model.addAttribute("keyword", studyBoard.getKeyword());

		return "studyboard/study_moziping_list"; // -> study_moziping.jsp
	}

	// 모집 완료 0->1 로 업데이트
	@RequestMapping("/studyMozip.study") // <- studyView.jsp
	public String studyMozip(StudyBoard studyBoard, int study_no, String pageNum, Model model) {

		System.out.println("pageNum:" + pageNum); // 확인차 출력

		int result = studyService.studyMozip(study_no); // Service, DAO 추가
		if (result == 1)
			System.out.println("모집 완료 수정 성공");

		model.addAttribute("study_no", study_no);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);

		// return "qnaboard/qnaResol";
		return "studyboard/studyMozip"; // -> .jsp
	}

	// 글작성 폼
	@RequestMapping("studyInsertForm.study")
	public String studyInsertForm() {
		return "studyboard/studyInsertForm";
	}

	// 글작성
	@RequestMapping("/studyInsert.study") // HttpSession session
	public String studyInsert(StudyBoard studyBoard, Model model) {

		int result = studyService.studyInsert(studyBoard);
		if (result == 1)
			System.out.println("글 작성 성공");

		model.addAttribute("result", result);

		return "studyboard/studyInsert"; // -> studyInsert.jsp
	}

	// 상세 페이지
	@RequestMapping("/studyView.study")
	public String studyView(int study_no, String pageNum, Model model, HttpSession session) {

		studyService.studyUpdateRe(study_no); // 조회수 증가
		StudyBoard studyBoard = studyService.studySelect(study_no); // 상세 정보 구하기

		System.out.println(studyBoard.getCategory_no());

		model.addAttribute("studyBoard", studyBoard);
		model.addAttribute("pageNum", pageNum);

		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");
		model.addAttribute("adminmodel", adminmodel);
		
		return "studyboard/studyView";
	}

	// 수정 폼
	@RequestMapping("studyUpdateForm.study") // <- studyView.jsp
	public String studyUpdateForm(int study_no, String pageNum, Model model) {
		StudyBoard studyBoard = studyService.studySelect(study_no); // 상세정보 구하기

		model.addAttribute("studyBoard", studyBoard);
		model.addAttribute("pageNum", pageNum);

		return "studyboard/studyUpdateForm"; // -> studyUpdateForm.jsp
	}

	// 수정
	@RequestMapping("/studyUpdate.study") // <- studyUpdateForm.jsp
	public String studyUpdate(StudyBoard studyBoard, String pageNum, Model model) {

		int result = studyService.studyUpdate(studyBoard);
		if (result == 1)
			System.out.println("글 수정 성공");

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);

		return "studyboard/studyUpdate"; // -> studyUpdate.jsp
	}

	// 삭제 폼
	@RequestMapping("studyDeleteForm.study")
	public String studyDeleteForm(int study_no, String pageNum, Model model, int category_no) {

		model.addAttribute("study_no", study_no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("category_no", category_no);

		return "studyboard/studyDeleteForm";
	}

	// 삭제
	@RequestMapping("/studyDelete.study")
	public String studyDelete(String pageNum, int study_no, Model model, int category_no) { // 삭제 폼에서 보낸 page값 받기

		int result = studyService.studyDelete(study_no);
		if (result == 1)
			System.out.println("글 삭제 성공");

		System.out.println(category_no);
		studyService.singoStudyDelete(study_no, category_no);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "studyboard/studyDelete";
	}
}
