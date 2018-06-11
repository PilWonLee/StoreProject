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
public class HistoryController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MainService")
	private IMainService mainService;

	@RequestMapping(value = "userHistory", method = RequestMethod.GET)
	public String userHistory(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into userHistory");
		
		if(CmmUtil.nvl((String)session.getAttribute("email")).equals("")){
			model.addAttribute("url","login.do");
			model.addAttribute("msg","로그인후 이용할 수 있습니다.");
			return "redirect";
		}
		
		return "/userHistory";

	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into mypage");
		
		if(CmmUtil.nvl((String)session.getAttribute("email")).equals("")){
			model.addAttribute("url","login.do");
			model.addAttribute("msg","로그인후 이용할 수 있습니다.");
			return "redirect";
		}
		
		return "/mypage";
	}
	
	
}