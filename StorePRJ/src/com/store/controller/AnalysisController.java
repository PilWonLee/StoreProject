package com.store.controller;

import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.BufferedReader;
import java.net.URL;
import java.net.URLEncoder;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

import javax.annotation.Resource;
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
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.store.dto.apiDTO;
import com.store.dto.apiWrappedDTO;
import com.store.dto.populationDTO;
import com.store.service.IAnalysisService;
import com.store.util.ApiProcess;
import com.store.util.ApiResultToString;
import com.store.util.CmmUtil;
import com.store.util.googleSearchAPI;

@Controller
public class AnalysisController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "AnalysisService")
	private IAnalysisService AnalysisService;
	private static List<apiDTO> importantStore;
	private Map<String, Integer> storeInfoMap;
	// 嚥≪뮄�젃占쎌뵥 占쎌읈
	@RequestMapping(value = "analysisMain", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session,ModelMap model) throws Exception {
		log.info("come into analysisMain");
		
		if(CmmUtil.nvl((String)session.getAttribute("email")).equals("")){
			model.addAttribute("url","login.do");
			model.addAttribute("msg","로그인후 이용할 수 있습니다.");
			return "redirect";
		}
		
		return "/businessAnalysis/analysisMain";
	}

	@RequestMapping(value = "searchSido", method = RequestMethod.GET)
	public @ResponseBody List<apiDTO> searchSido(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("come into searchSido");

		HashMap<String, String> map = new HashMap<>();
		map.put("resId", "dong");
		map.put("catId", "mega");
		
		//API결과를 String 변환 
		ApiResultToString apiResult = new ApiResultToString();
		String result = apiResult.getString(map);

		// String을 xml로 파싱하고 List에 담기
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser(); // 연결하는거 담고
		parser.setInput(new StringReader(result));
		int eventType = parser.getEventType();
		apiDTO dto = null;
		List<apiDTO> list = null;
		while (eventType != XmlPullParser.END_DOCUMENT) {
			switch (eventType) {
			case XmlPullParser.END_DOCUMENT:// 문서의 끝
				break;
			case XmlPullParser.START_DOCUMENT:
				list = new ArrayList<apiDTO>();
				break;
			case XmlPullParser.END_TAG: {
				String tag = parser.getName();
				if (tag.equals("item")) {
					list.add(dto);
					dto = null;
				}
			}
			case XmlPullParser.START_TAG: { // 무조건 시작하면 만남
				String tag = parser.getName();
				switch (tag) {
				case "item": // item가 열렸다는것은 새로운 책이 나온다는것
					dto = new apiDTO();
					break;
				case "ctprvnCd":
					if (dto != null)
						dto.setCtprvnCd(parser.nextText());
					break;
				case "ctprvnNm":
					dto.setCtprvnNm(parser.nextText());
					break;
				}
				break;
			}
			}
			eventType = parser.next();
		}
		return list;
	}
	
	@RequestMapping(value = "searchSigungu", method = RequestMethod.GET)
	public @ResponseBody List<apiDTO> searchSigungu(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("ctprvnCd")String ctprvnCd, ModelMap model) throws Exception {
		log.info("come into searchSigungu");

		HashMap<String, String> map = new HashMap<>();
		map.put("resId", "dong");
		map.put("catId", "cty");
		map.put("ctprvnCd",ctprvnCd);

		ApiResultToString apiResult = new ApiResultToString();
		String result = apiResult.getString(map);

		// String을 xml로 파싱하는 부분
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser(); // 연결하는거 담고
		parser.setInput(new StringReader(result));
		int eventType = parser.getEventType();
		apiDTO dto = null;
		List<apiDTO> list = null;
		while (eventType != XmlPullParser.END_DOCUMENT) {
			switch (eventType) {
			case XmlPullParser.END_DOCUMENT:// 문서의 끝
				break;
			case XmlPullParser.START_DOCUMENT:
				list = new ArrayList<apiDTO>();
				break;
			case XmlPullParser.END_TAG: {
				String tag = parser.getName();
				if (tag.equals("item")) {
					list.add(dto);
					dto = null;
				}
			}
			case XmlPullParser.START_TAG: { // 무조건 시작하면 만남
				String tag = parser.getName();
				switch (tag) {
				case "item": // item가 열렸다는것은 새로운 책이 나온다는것
					dto = new apiDTO();
					break;
				case "signguCd":
					if (dto != null)
						dto.setSignguCd(parser.nextText());
					break;
				case "signguNm":
					dto.setSignguNm(parser.nextText());
					break;
				}
				break;
			}
			}
			eventType = parser.next();
		}
		return list;
	}
	
	@RequestMapping(value = "searchBigInds", method = RequestMethod.GET)
	public @ResponseBody List<apiDTO> searchBigInds(HttpServletRequest request, HttpServletResponse response,
			 ModelMap model) throws Exception {
		log.info("come into searchBigInds");

		HashMap<String, String> map = new HashMap<>();
		map.put("resId", "upjong");
		map.put("catId", "large");

		ApiResultToString apiResult = new ApiResultToString();
		String result = apiResult.getString(map);

		// String을 xml로 파싱하고 List에 담기
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser(); // 연결하는거 담고
		parser.setInput(new StringReader(result));
		int eventType = parser.getEventType();
		apiDTO dto = null;
		List<apiDTO> list = null;
		while (eventType != XmlPullParser.END_DOCUMENT) {
			switch (eventType) {
			case XmlPullParser.END_DOCUMENT:// 문서의 끝
				break;
			case XmlPullParser.START_DOCUMENT:
				list = new ArrayList<apiDTO>();
				break;
			case XmlPullParser.END_TAG: {
				String tag = parser.getName();
				if (tag.equals("item")) {
					list.add(dto);
					dto = null;
				}
			}
			case XmlPullParser.START_TAG: { // 무조건 시작하면 만남
				String tag = parser.getName();
				switch (tag) {
				case "item": // item가 열렸다는것은 새로운 책이 나온다는것
					dto = new apiDTO();
					break;
				case "indsLclsCd":
					if (dto != null)
						dto.setIndsLclsCd(parser.nextText());
					break;
				case "indsLclsNm":
					dto.setIndsLclsNm(parser.nextText());
					break;
				}
				break;
			}
			}
			eventType = parser.next();
		}
		return list;
	}
	
	
	
	@RequestMapping(value = "searchMidInds", method = RequestMethod.GET)
	public @ResponseBody List<apiDTO> searchMidInds(HttpServletRequest request, HttpServletResponse response,
			 @RequestParam("indsLclsCd")String indsLclsCd ,ModelMap model) throws Exception {
		log.info("come into searchMidInds");

		HashMap<String, String> map = new HashMap<>();
		map.put("resId", "upjong");
		map.put("catId", "middle");
		map.put("indsLclsCd", indsLclsCd);
		
		ApiResultToString apiResult = new ApiResultToString();
		String result = apiResult.getString(map);

		// String을 xml로 파싱하고 List에 담기
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser(); // 연결하는거 담고
		parser.setInput(new StringReader(result));
		int eventType = parser.getEventType();
		apiDTO dto = null;
		List<apiDTO> list = null;
		while (eventType != XmlPullParser.END_DOCUMENT) {
			switch (eventType) {
			case XmlPullParser.END_DOCUMENT:// 문서의 끝
				break;
			case XmlPullParser.START_DOCUMENT:
				list = new ArrayList<apiDTO>();
				break;
			case XmlPullParser.END_TAG: {
				String tag = parser.getName();
				if (tag.equals("item")) {
					list.add(dto);
					dto = null;
				}
			}
			case XmlPullParser.START_TAG: { // 무조건 시작하면 만남
				String tag = parser.getName();
				switch (tag) {
				case "item": // item가 열렸다는것은 새로운 책이 나온다는것
					dto = new apiDTO();
					break;
				case "indsMclsCd":
					if (dto != null)
						dto.setIndsMclsCd(parser.nextText());
					break;
				case "indsMclsNm":
					dto.setIndsMclsNm(parser.nextText());
					break;
				}
				break;
			}
			}
			eventType = parser.next();
		}
		return list;
	}
	
	@RequestMapping(value = "getStoreInfo", method = RequestMethod.POST)
	public @ResponseBody Map<String, Integer> getStoreInfo(HttpServletRequest request, HttpServletResponse response,
			 ModelMap model) throws Exception {
		log.info("come into getStoreInfo");
		
		return storeInfoMap;
	}
	
	
	
	@RequestMapping(value = "getImportantInfo", method = RequestMethod.GET)
	public @ResponseBody List<apiDTO> getImportantInfo(HttpServletRequest request,
			HttpServletResponse response,ModelMap model)throws Exception {
		log.info("come into getImportantInfo");
		
		List<apiDTO> list = importantStore;
		
		for(apiDTO a : list) {
			System.out.println("bizname: "+a.getBizesNm());
		}
		
		return list;
	}
	
	@RequestMapping(value = "analysisDetail", method = RequestMethod.POST)
	public String analysisDetail(HttpServletRequest request, HttpServletResponse response,
			 @RequestParam("radius")String radius,@RequestParam("cx")String cx,
			 @RequestParam("cy")String cy,@RequestParam("locName")String locName, 
			 @RequestParam("midCd")String midCd,@RequestParam("midName")String midName
			 ,ModelMap model) throws Exception {
		log.info("come into analysisDetail");
		
		log.info("radius"+radius);
		log.info("cx"+cx);
		log.info("cy"+cy);
		log.info("locName"+locName);
		
		importantStore = new ArrayList<>();
		storeInfoMap = new HashMap<String, Integer>();
		
		ApiProcess apiProc = new ApiProcess();
		apiWrappedDTO wDTO = apiProc.startApi(radius, cx, cy,1);
		List<apiDTO> list = wDTO.getList();
		int totalPage = Integer.parseInt(wDTO.getTotalPage());
		
		//페이지가 여러페이지일경우 계속해서 값을 추가한다.
		while(totalPage - (500*Integer.parseInt(wDTO.getPage())) > 0){
			int inc = Integer.parseInt(wDTO.getPage());
			inc++;
			wDTO = apiProc.startApi(radius, cx, cy, inc);
			list.addAll(wDTO.getList());
		}
		
		System.out.println("totalCount: "+totalPage);
		System.out.println("list size: "+list.size());
		
		/*for(apiDTO a : list){
			System.out.println(a.getBizesNm());
		}*/
		
		//해당되는업종만 리스트에 담기
		List<String> strArr = new ArrayList<>();
		for(apiDTO a : list) {
			if(a.getIndsLclsCd().equals(midCd)) {
				strArr.add(a.getIndsMclsNm());
			}
		}
		
		
		//주요상권 리스트에 담기
		for(apiDTO a : list) {
			
			if(a.getBizesNm().indexOf("베스킨") >= 0) {
				setImpt(a);
			}else if(a.getBizesNm().indexOf("롯데리아") >= 0){
				setImpt(a);
			}else if(a.getBizesNm().indexOf("스타벅스") >= 0){
				setImpt(a);
			}else if(a.getBizesNm().indexOf("파리바게뜨") >= 0){
				setImpt(a);
			}
		}
		
		
		for(apiDTO a : importantStore) {
			System.out.println(a.getBizesNm());
			System.out.println(a.getLon());
			System.out.println(a.getLat());
		}
		
		//업종 카운트
		for (String s : strArr) {

			if (!storeInfoMap.containsKey(s)) { // first time we've seen this string
				storeInfoMap.put(s, 1);
			} else {
				int count = storeInfoMap.get(s);
				storeInfoMap.put(s, count + 1);
			}
		}
		
		model.addAttribute("cx",cx);
		model.addAttribute("cy",cy);
		model.addAttribute("radius",radius);
		model.addAttribute("locName",locName);
		model.addAttribute("midName",midName);
		
		
		return "businessAnalysis/analysisDetail";
	}
	
	//중요 상권 저장 함수
	public void setImpt(apiDTO a) {
		apiDTO tmpDto = new apiDTO();
		tmpDto.setLat((a.getLat()));
		tmpDto.setLon((a.getLon()));
		tmpDto.setBizesNm((a.getBizesNm()));
		importantStore.add(tmpDto);
		tmpDto = null;
	}
	
	@RequestMapping(value = "getCrawling",method= RequestMethod.POST)
	public @ResponseBody Map<String,Integer> getCrawling(@RequestParam(value="locName")String locName,
			@RequestParam(value="midName")String midName) throws Exception{
		log.info("come into getCrawling");
		//특수문자 제거
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		midName = midName.replaceAll(match, " ");
		System.out.println(locName+" "+midName);
		
		ApiProcess apiProc = new ApiProcess();
		Map<String,Integer> map = apiProc.getInfo(locName,midName);
		
		return map;
	}
	
	@RequestMapping(value = "getPopulation",method= RequestMethod.POST)
	public @ResponseBody List<populationDTO> getPopulation(@RequestParam(value="locName")String locName
			) throws Exception{
		log.info("come into getPopulation");
		System.out.println(locName);
		
		List<populationDTO> list = AnalysisService.getPopulation(locName);
		
		return list;
	}
	
	@RequestMapping(value = "getActivityRate",method= RequestMethod.GET)
	public @ResponseBody String getActivityRate() throws Exception{
		log.info("come into getActivityRate");
		
		return String.valueOf(importantStore.size());
	}
}
