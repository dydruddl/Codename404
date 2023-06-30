package com.myproject.mycode.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.MemberModel;
import com.myproject.mycode.model.QnaBoard;
import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.service.MemberService;
import com.myproject.mycode.service.QnaBoardService;
import com.myproject.mycode.service.SingoService;

@Controller
public class MainController {

	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private QnaBoardService qnaservice;
	
	@Autowired
	private SingoService singoservice;
	
	/* 메인 페이지 뷰 */ // view 폴더 안의
	@RequestMapping(value = "/main.do")
	public String mainpage() {
		return "main";
	}
	
	// 관리자 로그인 폼
	@RequestMapping("adminloginform.do")
	public String adminLoginForm() {
		return "admin/adminloginform";
	}
	
	/* 관리자 로그인 & 일반 회원 로그인 분리 */
	@RequestMapping("separatelogin.do")
	public String separateLogin() {
		return "separatelogin";
	}

	/* 로그인 폼 */
	@RequestMapping(value = "/login_form.do") // <- main.jsp
	public String login_form() {
		return "loginform/login_form"; // -> login_form.jsp
	}

	/* 회원가입 폼 */
	@RequestMapping(value = "/signup_form.do") // <- main.jsp
	public String signup_form() {
		return "loginform/signup_form"; // -> signup_form.jsp
	}

	// 로그아웃
		@RequestMapping("/logout_form")
		public String logout(HttpSession session) {
			session.invalidate();
			
			return "loginform/logout_form";
		}
	
//	/* 비밀번호 찾기 폼 */
//	@RequestMapping(value = "/findPassword.do") // <- login_form.jsp
//	public String findPassword_form() {
//		return "loginform/findPassword_form"; // -> findPassword_form.jsp
//	}

		/* 신고 기능 */
		// QnA 신고 기능
			// 신고 팝업창 들어갈때 category 번호와 글번호 가지고 넘어가야됨  qna_nick 은 session id
			// 매개변수 qna_nick 은 session 아이디 값
			@RequestMapping("report.do")
			public String report(int qna_no, int category_no, int pageNum, HttpSession session, Model model) {
				
				System.out.println("report들어옴" + category_no);
				QnaBoard qnadto = qnaservice.select(qna_no);
				
				// 여기에 같은 이름 같은 글번호 같은 카테고리를 가진 사람이 신고사유테이블에 count됬을때 
				//alert로 이미 신고한 글입니다 뜨게
				
				MemberModel member = (MemberModel) session.getAttribute("memberModel");
				System.out.println("세션 닉 : " + member.getNick());
				
				
				int samesingocount = qnaservice.getSingoCount(qna_no, category_no, member.getNick());
				
				if(samesingocount > 0) {
					model.addAttribute("result", samesingocount);
					return "singosamealert";
				}
				
				model.addAttribute("membernick", member.getNick());
				model.addAttribute("qnaboard", qnadto);
				model.addAttribute("pageNum", pageNum);
				System.out.println("리턴 시작");
				
				return "report"; // report.jsp
			}
			
			@RequestMapping("reportaccess.do")
			public String reportAccess(QnaBoard qnadto, ReportReasonModel reportreasonDto){
				
				try {
				System.out.println("신고 버튼 컨트롤러");
				System.out.println(reportreasonDto.getReport_reason());
				
				System.out.println("카테고리 넘 :" + qnadto.getCategory_no());
				System.out.println("글 제목 : " + qnadto.getQna_subject());
//				qnadto = qnaservice.select(qnadto.getQna_no());
				
				// 글 번호가 같으면 qnaboard테이블에 qna_singo +1 하는 메서드 만들어야함
				qnaservice.updateQnaSingo(qnadto.getQna_no());
				System.out.println("신고글  + 1 ");
				
				// 여기에 멤버 테이블 같은 닉 신고카운트 +1 하는 메서드 만들어야됨.
				memberservice.updateSingoCount(qnadto.getQna_nick());
				System.out.println("신고 카운트 올라감");
				
				// 여기서 select로 신고테이블에 있는 category + 글번호가 똑같은 게 있으면 if로 update하는거 써야할듯
				int samewriting = singoservice.findSameSingo(qnadto.getCategory_no(),qnadto.getQna_no());
				System.out.println(samewriting);
				
				if(samewriting > 0) {
					// 이미 있는글 singocount 업데이트
					singoservice.updateSingoBoardCount(qnadto.getCategory_no(),qnadto.getQna_no());
					// singo_no 가져오기
					int singo_no = singoservice.getSingoNo(qnadto.getCategory_no(),qnadto.getQna_no());
					// 신고사유 테이블 insert (이미 그 글이 신고 되어 있을때)
					singoservice.reportReasonInsert(qnadto, singo_no, reportreasonDto);
					
					// 신고 테이블 singo_board_count 업데이트
					
				}else {
					// 새로 신고 되었을때 singo테이블에 insert
					singoservice.singoBoardInsert(qnadto);
					
					int singo_no = singoservice.getSingoNo(qnadto.getCategory_no(),qnadto.getQna_no());
					// 신고사유테이블(새로 신고된글일때 insert)
					singoservice.reportReasonInsert(qnadto, singo_no, reportreasonDto);
				}
				
				}catch(Exception e) {
					e.printStackTrace();
				}
				// 이 메서드 int형일때 신고 접수가 되었습니다 alert로 나오게?
				//qnaservice.singo_Boardinsert();
				
				// 신고 사유테이블 insert
				
				return "singosamealert"; // -> singosamealert.jsp
			}
			
			
			@RequestMapping(value = "/notice_board.notice") // <- main.jsp
			public String notice_board() {
				return "noticeboard/notice_board"; // -> notice_board.jsp
			}

			
			@RequestMapping(value = "/free_board.free") // <- main.jsp
			public String free_board() {
				return "freeboard/free_board"; // -> free_board.jsp
			}

			
			@RequestMapping(value = "/study_board.study") // <- main.jsp
			public String study_board() {
				return "studyboard/study_board"; // -> study_board.jsp
			}

			
			@RequestMapping(value = "/qna_board.qna") // <- main.jsp
			public String qna_board() {
				return "qnaboard/qna_board"; // -> qna_board.jsp
			}
}