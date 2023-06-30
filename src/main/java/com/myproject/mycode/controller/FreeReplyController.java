package com.myproject.mycode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.freeboard;
import com.myproject.mycode.model.freeboardreply;
import com.myproject.mycode.service.FreeBoardReplyService;
import com.myproject.mycode.service.FreeBoardService;

@Controller
public class FreeReplyController {
	@Autowired
	private FreeBoardService fbs;
	
	@Autowired
	private FreeBoardReplyService fbrs; 
		
	//댓글목록
	@RequestMapping("free_relist.free")				// free_view.jsp 
	public String free_relist(int free_no,HttpSession session, Model model) {
		freeboard freeboard = fbs.select(free_no);
		List<freeboardreply> free_relist = fbrs.list(free_no);
		
		AdminModel adminmodel = (AdminModel) session.getAttribute("adminmodel");
		
		System.out.println("freeboard:"+ freeboard);
		System.out.println("free_relist:" + free_relist);
		
		model.addAttribute("freeboard",freeboard);
		model.addAttribute("free_relist",free_relist);
		model.addAttribute("adminmodel", adminmodel);
		
		return "freeboard/free_relist";
	}
	
	//댓글 입력
	@RequestMapping("reinsert.free")					// free_view.jsp
	public String reinsert(freeboardreply fbr, Model model, HttpSession session) {
		
		fbrs.insert(fbr);
		
		return "redirect:free_relist.free?free_no="+fbr.getFree_no();
	}
	
	//댓글 수정
	@RequestMapping("reupdate.free")					// free_relist.jsp
	public String reupdate(freeboardreply fbr, Model model) {
		
		fbrs.update(fbr);
		return "redirect:free_relist.free?free_no="+fbr.getFree_no();
	}
	
	//댓글 삭제
	@RequestMapping("redelete.free")			// free_relist.jsp, free_view.jsp	
	public String delete(freeboardreply fbr, Model model) {
		
		fbrs.delete(fbr.getFree_rno());
		return "redirect:free_relist.free?free_no="+fbr.getFree_no();
	}

}
