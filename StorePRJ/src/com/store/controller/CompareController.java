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

import com.store.dto.mainDTO;
import com.store.service.ICompareService;
import com.store.service.IMainService;
	
@Controller
public class CompareController {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "CompareService")
	private ICompareService compareService;
	
	//濡쒓렇�씤 �쟾
	@RequestMapping(value="compareMain", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		log.info("come into compareMain");
		
		
		return "/businessCompare/compareMain";
		
	}
	
	
	
	
	


}