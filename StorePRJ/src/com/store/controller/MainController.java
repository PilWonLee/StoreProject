package com.store.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.dto.mainDTO;
import com.store.service.IMainService;
	
@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "MainService")
	private IMainService mainService;
	
	//濡쒓렇�씤 �쟾
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		log.info("come into main");
		
		List<mainDTO>  mlist = mainService.getInfo();
		
		System.out.println(mlist.size());
		
		for(int i =0; i < mlist.size(); i++) {
			System.out.println(mlist.get(i).getUserName());
		}
		
		model.addAttribute("mList",mlist);
		
		return "/main";
		
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		log.info("come into login");
		return "/login";
	}
	
	@RequestMapping(value="signUp", method=RequestMethod.GET)
	public String SignUp(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		log.info("come into SignUp");
		return "/signUp";
	}
	
	@RequestMapping(value="checkEmail", method=RequestMethod.GET)
	public @ResponseBody String checkEmail(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		log.info("come into checkEmail");
		return "/signUp";
	}


}