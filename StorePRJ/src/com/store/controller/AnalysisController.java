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
import com.store.service.IAnalysisService;

@Controller
public class AnalysisController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "AnalysisService")
	private IAnalysisService AnalysisService;

	// 嚥≪뮄�젃占쎌뵥 占쎌읈
	@RequestMapping(value = "analysisMain", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("come into analysisMain");
		

		return "/businessAnalysis/analysisMain";

	}

}
