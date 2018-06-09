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

import com.store.dto.RecommendDTO;
import com.store.dto.userDTO;
import com.store.service.IRecommendService;
import com.store.util.CmmUtil;

@Controller
public class RecommendController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "RecommendService")
	private IRecommendService recommendService;

	// 
	@RequestMapping(value = "recommendMain", method = RequestMethod.GET)
	public String recommendMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info("come into recommendMain");
		System.out.println(CmmUtil.nvl((String) session.getAttribute("email")));
		return "/businessRecommend";
	}
	
	@RequestMapping(value="RegProc",method=RequestMethod.POST)
	public String RegProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
		throws Exception{
		log.info("come into RegProc");
		
		String userNo = CmmUtil.nvl((String)session.getAttribute("userNo"));
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String indsCd = request.getParameter("indsCd");
		String indsName = request.getParameter("indsName");
		String sidoName= request.getParameter("sidoName");
		String sigunguName= request.getParameter("sigunguName");
		
		log.info(userNo);
		log.info(indsCd);
		log.info(sigungu);
		log.info(sido);
		log.info(content);
		log.info(title);
		log.info(indsName);
		log.info(sidoName);
		log.info(sigunguName);
		
		RecommendDTO rDTO = new RecommendDTO();
		rDTO.setContent(content);
		rDTO.setIndsCd(indsCd);
		rDTO.setIndsName(indsName);
		rDTO.setRegUserNo(userNo);
		rDTO.setSido(sido);
		rDTO.setSidoName(sidoName);
		rDTO.setSigungu(sigungu);
		rDTO.setSigunguName(sigunguName);
		rDTO.setTitle(title);
		
		recommendService.insertRecommend(rDTO);
		
		
		return null;
	}
	
	@RequestMapping(value="getRcdList")
	public @ResponseBody List<RecommendDTO> getRcdList(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
		throws Exception{
		log.info("come into getRcdList");
		List<RecommendDTO> list = recommendService.getList();
		return list;
	}
	
	@RequestMapping(value="addList",method = RequestMethod.POST)
	public @ResponseBody List<RecommendDTO> addList(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
		throws Exception{
		log.info("come into addList");
		int start = Integer.valueOf(request.getParameter("start"));
		List<RecommendDTO> list = recommendService.addList(start);
		return list;
	}

}