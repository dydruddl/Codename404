package com.myproject.mycode.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mycode.model.ReportReasonModel;
import com.myproject.mycode.model.SingoModel;
import com.myproject.mycode.service.SingoBoardService;
import com.myproject.mycode.service.adminPaging;

@Controller
public class SingoController {

	 @Autowired 
	private SingoBoardService service;
	// 해당유저 신고글 리스트
		@RequestMapping("singo_list.singo")
		public String singoList(String pageNum, SingoModel singo, Model model) {
			
			System.out.println(singo.getCategory_no());
			System.out.println("singo_no" + singo.getSingo_no());
			
			final int pageDataCount = 10;	// 화면에 출력할 데이터 갯수
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
			
			int total = service.getSingoCount(singo);
			
			int startRow = (currentPage - 1) * pageDataCount + 1;
			int endRow = startRow + pageDataCount - 1;
			
			adminPaging ap = new adminPaging(total, pageDataCount, currentPage);
			singo.setStartRow(startRow);
			singo.setEndRow(endRow);
			
			int num = total - startRow + 1;
			
			List<SingoModel> singolist = service.getSingoList(singo);
			model.addAttribute("singolist", singolist);
			model.addAttribute("ap", ap);
			model.addAttribute("num", num);
			
			model.addAttribute("search", singo.getSearch());
			
			
			return "singo/singo_list";
		}
		
		// 신고글 전체 리스트
				@RequestMapping("singo_list_all.singo")
				public String singoListAll(String pageNum, SingoModel singo, Model model) {
					
					System.out.println(singo.getCategory_no());
					
					final int pageDataCount = 10;	// 화면에 출력할 데이터 갯수
					if (pageNum == null || pageNum.equals("")) {
						pageNum = "1";
					}
					int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
					
					int total = service.getSingoCountAll(singo);
					
					int startRow = (currentPage - 1) * pageDataCount + 1;
					int endRow = startRow + pageDataCount - 1;
					
					adminPaging ap = new adminPaging(total, pageDataCount, currentPage);
					singo.setStartRow(startRow);
					singo.setEndRow(endRow);
					
					int num = total - startRow + 1;
					
					List<SingoModel> singolistAll = service.getSingoListAll(singo);
					model.addAttribute("singolistAll", singolistAll);
					model.addAttribute("ap", ap);
					model.addAttribute("num", num);
					
					model.addAttribute("search", singo.getSearch());
					
					
					return "singo/singo_list_all";
				}
	
		// 신고사유 리스트
		@RequestMapping("report_list.singo")
		public String report_list(String pageNum, ReportReasonModel ReportModelDTO, Model model) throws Exception{
		
			final int pageDataCount = 10;	// 화면에 출력할 데이터 갯수
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
			
			int total = service.getReportBoardCount(ReportModelDTO);
			
			int startRow = (currentPage - 1) * pageDataCount + 1;
			int endRow = startRow + pageDataCount - 1;
			
			adminPaging bp = new adminPaging(total, pageDataCount, currentPage);
			ReportModelDTO.setStartRow(startRow);
			ReportModelDTO.setEndRow(endRow);
				
			int num = total - startRow + 1;
			
			List<ReportReasonModel> reportList = service.getReportList(ReportModelDTO);
			model.addAttribute("reportList", reportList);
			model.addAttribute("bp", bp);
			model.addAttribute("num", num);
			model.addAttribute("pageNum", pageNum);

			return "singo/report_list";
		}	
		
		// 상세페이지
		@RequestMapping("report_View.singo")
		public String reportView(Integer singo_no, String pageNum, Model model) {
			
			System.out.println("singo_no" + singo_no);
			//service.updateRe(notice_no); // updateRe
			ReportReasonModel reportboard = service.reportView(singo_no); // 상세정보
			
			model.addAttribute("reportboard", reportboard);
			model.addAttribute("pageNum", pageNum);
			
			return "singo/report_View";
		}
}
