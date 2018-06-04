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
public class RecommendController {
	private Logger log = Logger.getLogger(this.getClass());

	/*@Resource(name = "RecommendService")
	private IRecommendService recommendService;*/

	// 
	@RequestMapping(value = "recommendMain", method = RequestMethod.GET)
	public String recommendMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into recommendMain");
		System.out.println(CmmUtil.nvl((String) session.getAttribute("email")));
		return "/businessRecommend";
	}

	

}