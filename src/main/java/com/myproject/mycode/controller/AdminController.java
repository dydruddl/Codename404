package com.myproject.mycode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.MemberModel;
import com.myproject.mycode.service.AdminService;
import com.myproject.mycode.service.adminPaging;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	
	// 관리자 로그인
			@RequestMapping("/adminlogin.manager")
			public String member_login(@RequestParam("admin_id") String admin_id,
									   @RequestParam("admin_passwd") String admin_passwd,
									   HttpSession session,
									   //MemberModel member
									   Model model) {
				
				int result = 0;
				AdminModel adminmodel = service.adminCheck(admin_id);
				//MemberModel memberModel = ms.userCheck(id);
				
				if(adminmodel == null) { // 등록되지 않은 회원인 경우
					result = 1;
					model.addAttribute("result", result);
					return "admin/adminloginResult";
					
				} else {	 // 등록된 회원인 경우
					if(adminmodel.getAdmin_passwd().equals(admin_passwd)) {	// 비번이 같은 경우
						// session.setAttribute("email", email);
						session.setAttribute("adminmodel", adminmodel);
						String adminnick = adminmodel.getAdmin_nick();
						model.addAttribute("adminnick", adminnick);
						return "main";
						
				} else {	// 비밀번호가 다른 경우
					result = 2;
					model.addAttribute("result", result);
					return "admin/adminloginResult";
				}
			}
		}

	// 회원정보 리스트
	@RequestMapping("adminusers.manager")
	public String userList(String pageNum, MemberModel users, Model model) {
		
		System.out.println("state값: "+ users.getState());
		
		final int pageDataCount = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		int total = service.getMemberCount(users);			
		
		if(users.getState() == 1) {
			total = service.getMemberNormalCount(users);
		}else if(users.getState() == 2) {
			total = service.getMemberbanCount(users);
		}
		
		System.out.println("탈퇴회원 수 : "+ total);
		
		int startRow = (currentPage - 1) * pageDataCount + 1;
		int endRow = startRow + pageDataCount - 1;
		
		adminPaging ap = new adminPaging(total, pageDataCount, currentPage);
		users.setStartRow(startRow);
		users.setEndRow(endRow);
		
//		if(ap.getTotalPage() > 0) {
//			System.out.println(ap.getStartPage());
//			System.out.println(ap.getEndPage());
//		}
		
		
		int num = total - startRow + 1;
		
		List<MemberModel> memberlist = service.getMemberList(users);
		
		if(users.getState() == 1) {
			memberlist = service.getMemberNormalList(users);
		}else if(users.getState() == 2) {
			memberlist = service.getMemberBanList(users);
		}
		
		System.out.println("탈퇴회원: "+ memberlist.size());
		
		model.addAttribute("state", users.getState());
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("ap", ap);
		model.addAttribute("num", num);
		
		model.addAttribute("search", users.getSearch());
		model.addAttribute("keyword", users.getKeyword());
		
		return "admin/adminusers";
	}
	
	// 회원 상세보기 정보
	@RequestMapping("adminuserinfo.manager")
	public String userInfo(String pageNum, String id, Model model) {
		MemberModel memberinfo = service.getMember(id);
		model.addAttribute("memberinfo", memberinfo);
		model.addAttribute("pageNum", pageNum);
		
		return "admin/adminuserinfo";
	}
	
	@RequestMapping("adminuserdelete.manager")
	public String userdelete(String id, String nick) {
		service.userDelete(id);
		
		service.deleteUserSingo(nick);
		return "redirect:/adminusers.manager";
	}
	
}
