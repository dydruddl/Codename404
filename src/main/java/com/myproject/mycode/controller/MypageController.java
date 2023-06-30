package com.myproject.mycode.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.MemberModel;
import com.myproject.mycode.service.MemberService;
import com.myproject.mycode.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MemberService ms;

	@Autowired
	private MypageService myservice; // Service 주입

	/* 마이페이지 폼 */
	@RequestMapping("/mypage.my") // <- main.jsp
	public String mypage(HttpSession session, Model model) {

		MemberModel member = (MemberModel) session.getAttribute("memberModel");
		MemberModel memberModel = ms.userCheck(member.getId());

		model.addAttribute("memberModel", memberModel);

		return "mypage/mypage"; // -> mypage.jsp
	}

	/* 마이페이지 수정 폼 */
	@RequestMapping("/mypage_edit.my")
	public String mypage_edit(HttpSession session, Model model) {
		// 세션에서 가져온 MemberModel(회원가입시 정보)를 mymember(DTO)를 추가해서 저장
		// 세션값을 그냥 가져오면 처음값만 출력됨(수정하는 값은 출력되지 않음)
		MemberModel member = (MemberModel) session.getAttribute("memberModel");
		MemberModel memberModel = ms.userCheck(member.getId());

		model.addAttribute("memberModel", memberModel);
		// model.addAttribute() 메소드를 사용하여 "mymember"라는 이름으로 memberModel 객체를 모델에 추가
		// mymember라는 이름으로 회원정보를 뷰로 전달할 수 있다.

		return "mypage/mypage_edit";
	}

	/* 마이페이지 수정 */
	@RequestMapping("mypage_editform.my")
	public String update(MemberModel member, Model model) {

		int result = myservice.updateMember(member);

		if (result == 1)
			System.out.println("수정 성공");

		model.addAttribute("result", result);

		return "mypage/mypage_editform";
	}

	/* 현재비밀번호 입력 폼 */
	@RequestMapping("/passwd_check.my")
	public String passwd_check(String id,Model model) {
		
		System.out.println("id값 : " + id);
		MemberModel member = ms.userCheck(id);
		
		model.addAttribute("memberModel", member);
		
		return "mypage/passwd_check";
	}

	/* 비밀번호 변경(현재비밀번호 확인) */
	// 비밀번호 수정
	@RequestMapping("/updatepasswd.my")
	public String updatepasswd(MemberModel member, Model model) {
		int result = myservice.updatepw(member);
		if (result == 1)
			System.out.println("비번 수정 성공");

		MemberModel memberModel = ms.userCheck(member.getId());

		model.addAttribute("memberModel", memberModel);

		return "mypage/mypage";
	}

	@RequestMapping("/mypage_newpasswd.my")
	public String passwdcheck() {
		return "mypage/mypage_newpasswd";
	}

	// 회원 탈퇴 폼
	@RequestMapping("/mypage_deleteform.my")
	public String deleteform() {

		return "mypage/mypage_deleteform";
	}

	// 회원 탈퇴
	@RequestMapping("/mypage_delete.my")
	public String deletemember(MemberModel member, Model model, HttpSession session) {

		int result = myservice.deletemember(member.getId());
		if (result == 1)
			System.out.println("탈퇴 성공");
		myservice.deletenoticerep(member.getNick());
		myservice.deleteFreeBoard(member.getNick());
		myservice.deleteFreerep(member.getNick());
		myservice.deleteStudyBoard(member.getNick());
		myservice.deleteStudyrep(member.getNick());
		myservice.deleteQnaBoard(member.getNick());
		myservice.deleteQnarep(member.getNick());
		myservice.deleteSingoBoard(member.getNick());
		myservice.deleteReportReason(member.getNick());

		session.invalidate();
		model.addAttribute("result", result);
		return "mypage/mypage_out";
	}
	
	
}
