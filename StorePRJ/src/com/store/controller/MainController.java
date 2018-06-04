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
import com.store.util.CmmUtil;

@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());

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

		model.addAttribute("msg", "회원가입되었습니다.");
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
			model.addAttribute("msg", "로그인되었습니다.");
			model.addAttribute("url", "main.do");
			session.setAttribute("email", result.getEmail());
		} else {
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

}