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
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="compareDetail", method=RequestMethod.POST)
	public String compareDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("radius")String radius,@RequestParam("cx")String cx,
			 @RequestParam("cy")String cy,@RequestParam("locName")String locName,
			 @RequestParam("radius2")String radius2,@RequestParam("cx2")String cx2,
			 @RequestParam("cy2")String cy2,@RequestParam("locName2")String locName2, 
			ModelMap model) throws Exception {
		log.info("come into compareDetail");
		log.info("radius"+radius);
		log.info("cx"+cx);
		log.info("cy"+cy);
		log.info("locName"+locName);
		log.info("radius2"+radius2);
		log.info("cx2"+cx2);
		log.info("cy2"+cy2);
		log.info("locName2"+locName2);
		
		return "/businessCompare/compareDetail";
		
	}
	
	
	


}