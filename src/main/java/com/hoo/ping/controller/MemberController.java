package com.hoo.ping.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoo.ping.domain.MemberVO;
import com.hoo.ping.service.CouponService;
import com.hoo.ping.service.MailSendService;
import com.hoo.ping.service.MemberService;


@Controller
@RequestMapping("/member/")
public class MemberController {
		
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	// 이메일 인증 서비스 주입  api 주입 
	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	private MailSendService mailService;
	
	
	@RequestMapping("login.do")
	public String login() {
		
		return "/member/login";
	}
	
	@RequestMapping("profile.do")
	public String getMemberList() {
		
		return "/member/profile";
	}
	
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String idCheck(MemberVO vo, HttpSession session) throws Exception {
		System.out.println("=== idCheck.do ===");
		System.out.println(vo.getMemberEmail());
		System.out.println(vo.getMemberPwd());

		MemberVO result = memberService.memberCheck_Login(vo);
		
		if (result == null) {
			
			MemberVO manager = memberService.managerCheck_Login(vo);
			
			if(manager == null ) {
				System.out.println(manager);
				return "fail";
			
			}else {
				session.setAttribute("managerId", manager.getManagerId());
				session.setAttribute("managerEmail", manager.getManagerEmail());
				
				return "success";
			}
			
		}
		
    	System.out.println("[" + result.getMemberEmail() + "]");
        session.setAttribute("sessionTime", new Date().toLocaleString());
        session.setAttribute("memberId", result.getMemberId());
        session.setAttribute("memberPwd", result.getMemberPwd());
        session.setAttribute("memberName", result.getMemberName());
        session.setAttribute("memberEmail", result.getMemberEmail());
        session.setAttribute("memberPhoneNum", result.getMemberPhoneNum());
        session.setAttribute("memberRating", result.getMemberRating());
        session.setAttribute("memberSignUpDate", result.getMemberSignUpDate());
        session.setAttribute("memberBaseAddress", result.getMemberBaseAddress());
        session.setAttribute("memberInstagramId", result.getMemberInstagramId());
        System.out.println("login ����");
        System.out.println(result.getMemberName());
        System.out.println(new Date().toLocaleString());
    
		return "success";
		
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
		
	@RequestMapping("signUp.do")
	public String signUp() {
		
		return "/member/signUp";
	}
	
	@RequestMapping("signDetail.do")
	public String signDetail(MemberVO vo, Model model) {
		System.out.println("===signDetail===");
		
		model.addAttribute("MemberVO", vo);
		
		return "/member/signDetail";
	}
	
	@RequestMapping("memberJoin.do")
	public String memberJoin(MemberVO vo) {
		String memberEmail = vo.getUserEmail1()+ vo.getUserEmail2();
		vo.setMemberEmail(memberEmail);
		System.out.println("===memberJoin===");
		memberService.memberJoin(vo);
		vo=memberService.getLastMember();
		vo.setCouponName("회원가입을 축하합니다");
		vo.setCouponPrice("1000");
		couponService.addCoupon(vo);
		
		return "/member/login";
	}
	

	@RequestMapping("memberUpdate.do")
	public String memberUpdate(MemberVO vo, HttpSession session) {
		System.out.println("===memberUpdate===");
		System.out.println(session.getAttribute("memberId"));
		vo.setMemberId((Integer)session.getAttribute("memberId"));
		memberService.memberUpdate(vo);

		System.out.println("===�̰Եǳ�===");
		System.out.println(vo.getMemberId());
		return "redirect:/myPage/myPage.do";
	}
	
	@RequestMapping("memberInfo.do")
	public ModelAndView memberinfo() {
		List<MemberVO> mlist = memberService.getMemberList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("mlist",mlist);
		return mv;
	}
	
	@RequestMapping("getMemberList.do")
	public void getBoardList(Model model) {
//		System.out.println("-----------getBoardList진입--------------");
		model.addAttribute("memberList", memberService.getMemberList());
	}
	
	@RequestMapping("getMember.do")
	public String getMember(MemberVO vo, Model model) {
		model.addAttribute("member",memberService.getMember(vo));

		return "getMember";
	}
	

	@RequestMapping("memberUsing.do")
	@ResponseBody
	public String memberUsing(@RequestParam("memberEmail") String email) {
		System.out.println("���̵� �ߺ�üũ controller ����");
		int cnt = memberService.memberUsing(email);
		return String.valueOf(cnt);
		
	}
	// 이메일 인증 api
	@RequestMapping("mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
}
