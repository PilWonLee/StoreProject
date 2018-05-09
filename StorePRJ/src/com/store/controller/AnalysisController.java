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
import java.util.Set;
import java.util.function.Function;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.store.service.IAnalysisService;
import com.store.util.ApiResultToString;

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
	
	
	
	public apiWrappedDTO startApi(String radius,String cx,String cy,int page) throws Exception{

		HashMap<String, String> map = new HashMap<>();
		map.put("resId", "store");
		map.put("catId", "radius");
		map.put("radius", radius);
		map.put("cx", cx);
		map.put("cy", cy);
		map.put("numOfRows", "500");
		map.put("pageNo", String.valueOf(page));
		
		ApiResultToString apiResult = new ApiResultToString();
		String result = apiResult.getString(map);
		
		System.out.println("length : "+result.length());
		
		// String을 xml로 파싱하고 List에 담기
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser(); // 연결하는거 담고
		parser.setInput(new StringReader(result));
		int eventType = parser.getEventType();
		apiDTO dto = null;
		List<apiDTO> list = null;
		String totalCount = "";
		
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
				case "bizesId":
					if (dto != null)
						dto.setBizesId(parser.nextText());
					break;
				case "bizesNm":
					dto.setBizesNm(parser.nextText());
					break;
				case "indsLclsCd":
					dto.setIndsLclsCd(parser.nextText());
					break;
				case "indsLclsNm":
					dto.setIndsLclsNm(parser.nextText());
					break;
				case "indsMclsCd":
					dto.setIndsMclsCd(parser.nextText());
					break;
				case "indsMclsNm":
					dto.setIndsMclsNm(parser.nextText());
					break;
				case "indsSclsCd":
					dto.setIndsSclsCd(parser.nextText());
					break;
				case "indsSclsNm":
					dto.setIndsSclsNm(parser.nextText());
					break;	
				case "ctprvnCd":
					dto.setCtprvnCd(parser.nextText());
					break;
				case "ctprvnNm":
					dto.setCtprvnNm(parser.nextText());
					break;
				case "signguCd":
					dto.setSignguCd(parser.nextText());
					break;
				case "signguNm":
					dto.setSignguNm(parser.nextText());
					break;
				case "lon":
					dto.setLon(parser.nextText());
					break;	
				case "lat":
					dto.setLat(parser.nextText());
					break;
				case "totalCount":
					totalCount = parser.nextText();
					break;
				}
				break;
			}
			}
			eventType = parser.next();
		}
		
		apiWrappedDTO wDto = new apiWrappedDTO();
		wDto.setList(list);
		wDto.setPage(String.valueOf(page));
		wDto.setTotalPage(totalCount);
		
		return wDto;
	}
	
	@RequestMapping(value = "getStoreInfo", method = RequestMethod.GET)
	public List<apiDTO> getStoreInfo(HttpServletRequest request, HttpServletResponse response,
			 @RequestParam("radius")String radius,@RequestParam("cx")String cx,
			 @RequestParam("cy")String cy,ModelMap model) throws Exception {
		log.info("come into getStoreInfo");
		
		apiWrappedDTO wDTO = startApi(radius, cx, cy,1);
		List<apiDTO> list = wDTO.getList();
		int totalPage = Integer.parseInt(wDTO.getTotalPage());
		
		//페이지가 여러페이지일경우 계속해서 값을 추가한다.
		while(totalPage - (500*Integer.parseInt(wDTO.getPage())) > 0){
			int inc = Integer.parseInt(wDTO.getPage());
			inc++;
			wDTO = startApi(radius, cx, cy, inc);
			list.addAll(wDTO.getList());
		}
		
		System.out.println("totalCount: "+totalPage);
		System.out.println("list size: "+list.size());
		
		
		return null;
	}
	
<<<<<<< Upstream, based on origin/Pilwon
	@RequestMapping(value = "analysisDetail", method = RequestMethod.GET)
	public String analysisDetail(HttpServletRequest request, HttpServletResponse response,
			 @RequestParam("radius")String radius,@RequestParam("cx")String cx,
			 @RequestParam("cy")String cy,ModelMap model) throws Exception {
		log.info("come into analysisDetail");
		
		return "businessAnalysis/analysisDetail";
	}
	
=======
	@RequestMapping(value = "viewTest", method = RequestMethod.GET)
	public String viewTest(HttpServletRequest request, HttpServletResponse response,
			 ModelMap model) throws Exception {
		log.info("come into viewTest");
		
		
		return "businessAnalysis/getStoreInfo";
	}
>>>>>>> 391007a ss
}
