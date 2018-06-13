package com.store.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.dto.userDTO;
import com.store.service.IMainService;
import com.store.util.AES256Util;
import com.store.util.CmmUtil;
import com.store.util.MailUtil;

@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
	private static String connectIP = "http://192.168.175.10:8899/";
	@Resource(name = "MainService")
	private IMainService mainService;

	// 濡쒓렇�씤 �쟾
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into main");
		System.out.println(CmmUtil.nvl((String) session.getAttribute("email")));
		return "/main";

	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("come into login");
		return "/login";
	}

	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String SignUp(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("come into SignUp");
		return "/signUp";
	}

	@RequestMapping(value = "checkEmail", method = RequestMethod.GET)
	public @ResponseBody int checkEmail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("come into checkEmail");
		String email = request.getParameter("email");
		int result = mainService.emailCheck(email);
		return result;
	}

	@RequestMapping(value = "signUpProc", method = RequestMethod.POST)
	public String SignUpProc(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("come into SignUpProc");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email);
		System.out.println(password);
		userDTO u = new userDTO();
		u.setEmail(email);
		u.setPassword(password);
		mainService.insertUser(u);
		
		userDTO userNoDto = mainService.getUserNo(email);
		String enUserNo = AES256Util.strEncode(userNoDto.getUserNo());
		String url =connectIP+"emailConfirm.do";
		String parameter ="?userNo="+enUserNo;
		String body ="<a href='"+url+parameter+"'>인증 하기</a>";
		MailUtil.sendMail(email, "우리동네 상권분석 인증메일입니다.", body);
		
		model.addAttribute("msg", "가입한 이메일로 인증해주세요.");
		model.addAttribute("url", "login.do");

		return "redirect";
	}
	
	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		String enUserNo = request.getParameter("userNo");
		log.info(enUserNo);
		String userNo = AES256Util.strDecode(enUserNo);
		
		mainService.updateConfirm(userNo);
		
		model.addAttribute("msg", "인증 성공!");
		model.addAttribute("url", "login.do");

		return "redirect";
	}
	
	@RequestMapping(value = "loginProc", method = RequestMethod.POST)
	public String loginProc(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		log.info("come into loginProc");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email);
		System.out.println(password);
		userDTO u = new userDTO();
		u.setEmail(email);
		u.setPassword(password);
		userDTO result = mainService.login(u);
		
		if (result != null) {
			String confirm = CmmUtil.nvl(result.getConfirm());
			if(confirm.equals("N")) {
				model.addAttribute("msg", "이메일 인증을 해주세요.");
				model.addAttribute("url", "login.do");	
			}else {
				model.addAttribute("msg", "로그인되었습니다.");
				model.addAttribute("url", "main.do");
				session.setAttribute("email", result.getEmail());
				session.setAttribute("userNo", result.getUserNo());
			}
		}else{
			model.addAttribute("msg", "일치하는 회원정보가 없습니다.");
			model.addAttribute("url", "login.do");
		}

		return "redirect";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into logout");
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "main.do");
		session.invalidate();

		return "redirect";
	}
	
	
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into findPw");

		return "findPw";
	}
	
	@RequestMapping(value = "findPwProc", method = RequestMethod.POST)
	public String findPwProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into findPwProc");
		
		String email = request.getParameter("email");
		log.info(email);
		
		userDTO userNoDto = mainService.getUserNo(email);
		String enUserNo = AES256Util.strEncode(userNoDto.getUserNo());
		String url =connectIP+"passwordChange.do";
		String parameter ="?userNo="+enUserNo;
		String body ="<a href='"+url+parameter+"'>비밀번호 변경</a>";
		MailUtil.sendMail(email, "우리동네 상권분석 비밀번호 변경 메일입니다.", body);
		
		model.addAttribute("msg", "가입한 이메일을 확인해주세요.");
		model.addAttribute("url", "login.do");
		
		return "redirect";
	}
	@RequestMapping(value = "passwordChange", method = RequestMethod.GET)
	public String passwordChange(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into passwordChange");
		String userNo = request.getParameter("userNo");
		
		request.setAttribute("userNo", userNo);
		return "passwordChange";
	}
	
	@RequestMapping(value = "changePwProc", method = RequestMethod.POST)
	public String changePwProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into changePwProc");
		String password = request.getParameter("password");
		String userNo = AES256Util.strDecode(request.getParameter("userNo"));
		
		log.info(password);
		log.info(userNo);
		userDTO u = new userDTO();
		u.setPassword(password);
		u.setUserNo(userNo);
		
		mainService.changePassword(u);
		
		model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		model.addAttribute("url", "login.do");
		
		return "redirect";
	}
	
	
	@RequestMapping(value = "deleteUser", method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into deleteUser");
		String userNo = request.getParameter("userNo");
		log.info(userNo);
		mainService.deletUser(userNo);
		model.addAttribute("msg", "탈퇴되었습니다.");
		model.addAttribute("url", "main.do");
		session.invalidate();
		
		return "redirect";
	}
	
}