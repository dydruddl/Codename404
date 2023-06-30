package com.myproject.mycode.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.mycode.model.MemberModel;
import com.myproject.mycode.service.MailUtil;
import com.myproject.mycode.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms; // Service 주입
	
	@RequestMapping(value = "findId.do")
	public String findIdform() {
		return "loginform/findidform";
	}
	// ID있는지 확인
	@RequestMapping(value = "finduserid")
	@ResponseBody
	public MemberModel findid(MemberModel member) {
		
		MemberModel findmember = ms.searchId(member);
		System.out.println("membernull값확인 "+ findmember);
		
		if(findmember == null) {
			return findmember;
		}
		
			
		return findmember;
			
	}
	
	@RequestMapping(value = "identifyid.do")
	public String identifyId(String id,String nick,Model model) {
		
		model.addAttribute("id", id);
		model.addAttribute("nick", nick);
		return "loginform/identifyIdform";
	}
	
	
	/* 비밀번호 찾기 폼 */
	@RequestMapping(value = "/findPassword.do") // <- login_form.jsp
	public String findPassword_form() {
		return "loginform/findPassword_form"; // -> findPassword_form.jsp
	}
	
	@GetMapping(value = "finduserpasswd.do",produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String findpw(MemberModel member) throws Exception {
		System.out.println("컨트롤러 들어옴");
		
//		비밀번호 암호화시 security dependency사용후 이 클래스 사용
//		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
		String result=null;
		
		//회원정보 불러오기
		MemberModel findmember = ms.searchPwd(member);
				System.out.println(findmember);
				
				//가입된 이메일이 존재한다면 이메일 전송
				if(findmember!=null) {
					
					//임시 비밀번호 생성(UUID이용)
					String tempPw=UUID.randomUUID().toString().replace("-", "");//-를 제거
					tempPw = tempPw.substring(0,10);//tempPw를 앞에서부터 10자리 잘라줌
					System.out.println("임시 비밀번호 " + tempPw);
					
					findmember.setPasswd(tempPw);//임시 비밀번호 담기
			
					MailUtil mail=new MailUtil(); //메일 전송하기
					mail.sendEmail(findmember);
					
					
//					String securePw = encoder.encode(member.getPasswd());//회원 비밀번호를 암호화하면 vo객체에 다시 저장
//					member.setPasswd(securePw);
						
					ms.updatePwd(findmember);
					result="true";
					System.out.println(result);
					

				}else {
					result="false";
					System.out.println(result);
				}
		
		return result;
	}
	
	// main 페이지로만 이동
	//@RequestMapping("/main")
	//public String main() {
	//	return "main";
	//}
	
	// 회원가입
	@RequestMapping("/insertMember") 
	public String insert(MemberModel member, HttpSession session) {
		// member 등록
		ms.insert(member);
		session.invalidate();	
		
		// insert 후, 메인 페이지로 이동
		return "loginform/afterSignup"; // -> afterSignup.jsp
	}
	
	// 로그인
	@RequestMapping("/login_form")
	public String member_login(@RequestParam("id") String id,
							   @RequestParam("passwd") String passwd,
							   HttpSession session,
							   //MemberModel member
							   Model model) {
		
		int result = 0;
		MemberModel memberModel = ms.userCheck(id);
		
		if(memberModel == null) { // 등록되지 않은 회원인 경우
			result = 1;
			model.addAttribute("result", result);
			return "loginform/loginResult";
			
		} else {	 // 등록된 회원인 경우
			if(memberModel.getPasswd().equals(passwd)) {	// 비번이 같은 경우
				// session.setAttribute("email", email);
				session.setAttribute("memberModel", memberModel);
				String nick = memberModel.getNick();
				model.addAttribute("nick", nick);
				return "main";
				
		} else {	// 비밀번호가 다른 경우
			result = 2;
			model.addAttribute("result", result);
			return "loginform/loginResult";
		}
	}
}
	
	// id 중복검사
		@RequestMapping("/idcheck.do")
		public String idcheck(@RequestParam("id") String id, Model model) {
			System.out.println("idcheck.do 진입");
			System.out.println("id:" + id);

			int cnt = ms.idcheck(id);
			System.out.println("cnt:" + cnt);

			model.addAttribute("cnt", cnt);

			return "loginform/idcheck";
		}

		// nick 중복검사
		@RequestMapping("/nickchk.do")
		public String nickchk(@RequestParam("nick") String nick, Model model) {
			System.out.println("nickchk 진입");
			System.out.println("nick:" + nick);

			int cnt = ms.nickchk(nick);
			System.out.println("cnt:" + cnt);

			model.addAttribute("cnt", cnt);
			return "loginform/nickcheck";
		}
}