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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.dto.apiDTO;
import com.store.service.IHistoryService;
import com.store.util.CmmUtil;

@Controller
public class HistoryController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "HistoryService")
	private IHistoryService historyService;

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
	
	@RequestMapping(value = "getLocInfo")
	public @ResponseBody List<apiDTO> getLocInfo() throws Exception{
		log.info("come into getLocInfo");
		
		List<apiDTO> list = historyService.getLocInfo();
		
		return list;
	}
	
	@RequestMapping(value = "getIndsInfo")
	public @ResponseBody List<apiDTO> getIndsInfo() throws Exception{
		log.info("come into getIndsInfo");
		
		List<apiDTO> list = historyService.getIndsInfo();
		
		return list;
	}
	
	@RequestMapping(value = "getVisitInfo")
	public @ResponseBody List<apiDTO> getVisitInfo() throws Exception{
		log.info("come into getVisitInfo");
		
		List<apiDTO> list = historyService.getVisitInfo();
		
		return list;
	}
	
	@RequestMapping(value = "getMyAnalysis", method = RequestMethod.POST)
	public @ResponseBody List<apiDTO> getMyAnalysis(@RequestParam("userNo")String userNo) throws Exception{
		log.info("come into getMyAnalysis");
		
		List<apiDTO> list = historyService.getMyAnalysis(userNo);
		
		return list;
	}
	
	@RequestMapping(value = "getMyHistory", method = RequestMethod.POST)
	public @ResponseBody List<apiDTO> getMyHistory(@RequestParam("userNo")String userNo) throws Exception{
		log.info("come into getMyHistory");
		
		List<apiDTO> list = historyService.getMyHistory(userNo);
		
		return list;
	}
}