package com.store.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

import com.store.dto.apiDTO;
import com.store.dto.apiWrappedDTO;
import com.store.service.ICompareService;
import com.store.service.IMainService;
import com.store.util.ApiProcess;
import com.store.util.CmmUtil;

@Controller
public class CompareController {
	private Logger log = Logger.getLogger(this.getClass());
	private Map<String, Integer> storeInfoMap;
	private Map<String, Integer> storeInfoMap2;
	private static int importantStoreCnt;
	private static int importantStoreCnt2;

	@Resource(name = "CompareService")
	private ICompareService compareService;

	//濡쒓렇�씤 �쟾
	@RequestMapping(value = "compareMain", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, ModelMap model,HttpSession session) throws Exception {
		log.info("come into compareMain");
		
		if(CmmUtil.nvl((String)session.getAttribute("email")).equals("")){
			model.addAttribute("url","login.do");
			model.addAttribute("msg","로그인후 이용할 수 있습니다.");
			return "redirect";
		}
		
		return "/businessCompare/compareMain";

	}

	@RequestMapping(value = "compareDetail", method = RequestMethod.POST)
	public String compareDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam("radius") String radius, @RequestParam("cx") String cx, @RequestParam("cy") String cy, @RequestParam("locName") String locName,
			@RequestParam("radius2") String radius2, @RequestParam("cx2") String cx2, @RequestParam("cy2") String cy2, @RequestParam("locName2") String locName2, ModelMap model) throws Exception {
		log.info("come into compareDetail");
		log.info("radius" + radius);
		log.info("cx" + cx);
		log.info("cy" + cy);
		log.info("locName" + locName);
		log.info("radius2" + radius2);
		log.info("cx2" + cx2);
		log.info("cy2" + cy2);
		log.info("locName2" + locName2);

		storeInfoMap = new HashMap<String, Integer>();
		storeInfoMap2 = new HashMap<String, Integer>();

		ApiProcess apiProc = new ApiProcess();
		apiWrappedDTO wDTO = apiProc.startApi(radius, cx, cy, 1);

		List<apiDTO> list = wDTO.getList();
		int totalPage = Integer.parseInt(wDTO.getTotalPage());

		//페이지가 여러페이지일경우 계속해서 값을 추가한다.
		while (totalPage - (500 * Integer.parseInt(wDTO.getPage())) > 0) {
			int inc = Integer.parseInt(wDTO.getPage());
			inc++;
			wDTO = apiProc.startApi(radius, cx, cy, inc);
			list.addAll(wDTO.getList());
		}

		System.out.println("totalCount: " + totalPage);
		System.out.println("list size: " + list.size());

		//두번째 지역 시작
		wDTO = null;
		wDTO = apiProc.startApi(radius2, cx2, cy2, 1);

		List<apiDTO> list2 = wDTO.getList();
		totalPage = Integer.parseInt(wDTO.getTotalPage());

		//페이지가 여러페이지일경우 계속해서 값을 추가한다.
		while (totalPage - (500 * Integer.parseInt(wDTO.getPage())) > 0) {
			int inc = Integer.parseInt(wDTO.getPage());
			inc++;
			wDTO = apiProc.startApi(radius2, cx2, cy2, inc);
			list2.addAll(wDTO.getList());
		}

		System.out.println("totalCount2: " + totalPage);
		System.out.println("list size2: " + list2.size());

		//업종만 리스트에 담기
		List<String> strArr = new ArrayList<>();
		for (apiDTO a : list) {
			strArr.add(a.getIndsLclsNm());
		}
		List<String> strArr2 = new ArrayList<>();
		for (apiDTO a : list2) {
			strArr2.add(a.getIndsLclsNm());
		}
		
		importantStoreCnt = 0;
		importantStoreCnt2 = 0;
		//중요상권 카운트
		for (apiDTO a : list) {
			if (a.getBizesNm().indexOf("베스킨") >= 0) {
				importantStoreCnt++;
			} else if (a.getBizesNm().indexOf("롯데리아") >= 0) {
				importantStoreCnt++;
			} else if (a.getBizesNm().indexOf("스타벅스") >= 0) {
				importantStoreCnt++;
			} else if (a.getBizesNm().indexOf("파리바게뜨") >= 0) {
				importantStoreCnt++;
			}
		}
		for (apiDTO a : list2) {
			if (a.getBizesNm().indexOf("베스킨") >= 0) {
				importantStoreCnt2++;
			} else if (a.getBizesNm().indexOf("롯데리아") >= 0) {
				importantStoreCnt2++;
			} else if (a.getBizesNm().indexOf("스타벅스") >= 0) {
				importantStoreCnt2++;
			} else if (a.getBizesNm().indexOf("파리바게뜨") >= 0) {
				importantStoreCnt2++;
			}
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
		for (String a : strArr2) {
			if (!storeInfoMap2.containsKey(a)) { // first time we've seen this string
				storeInfoMap2.put(a, 1);
			} else {
				int count = storeInfoMap2.get(a);
				storeInfoMap2.put(a, count + 1);
			}
		}
		
		
		model.addAttribute("cx", cx);
		model.addAttribute("cy", cy);
		model.addAttribute("radius", radius);
		model.addAttribute("locName", locName);
		model.addAttribute("cx2", cx2);
		model.addAttribute("cy2", cy2);
		model.addAttribute("radius2", radius2);
		model.addAttribute("locName2", locName2);

		return "/businessCompare/compareDetail";

	}
	
	@RequestMapping(value = "getCompareActivityRate",method= RequestMethod.GET)
	public @ResponseBody apiDTO getCompareActivityRate() throws Exception{
		log.info("come into getActivityRate");
		
		apiDTO a = new apiDTO();
		a.setImportantStoreCnt(String.valueOf(importantStoreCnt));
		a.setImportantStoreCnt2(String.valueOf(importantStoreCnt2));
		System.out.println("importantStoreCnt : "+importantStoreCnt);
		System.out.println("importantStoreCnt2 : "+importantStoreCnt2);
		return a;
	}
	
	@RequestMapping(value = "getStoreInfoCompare", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getStoreInfoCompare(HttpServletRequest request, HttpServletResponse response,
			 ModelMap model) throws Exception {
		log.info("come into getStoreInfoCompare");
		List<String> label = new ArrayList<>();
		Map<String,Object> map= new HashMap<>();
		LinkedHashMap <String,Object> sortMap= new LinkedHashMap<>();
		LinkedHashMap <String,Object> sortMap2= new LinkedHashMap<>();
		
		//업종 많은 순서대로 정렬
		Iterator it = sortByValue(storeInfoMap).iterator();
		int cnt = 0;
        while(it.hasNext()){
        	if(cnt == 5) {
        		break;
        	}else {
        		cnt ++;
        		String temp = (String) it.next();
        		sortMap.put(temp, storeInfoMap.get(temp));
        		label.add(temp);
        	}
        }
        for( String key : sortMap.keySet() ){
            System.out.println( key+" : "+storeInfoMap2.get(key));
            int value ;
            if(storeInfoMap2.get(key) == null) {
            	value = 0;
            }else {
            	value = storeInfoMap2.get(key);
            }
            sortMap2.put(key, value);
        }
        
        for(String s : label) {
        	System.out.println(s);
        }
		map.put("mapObj", sortMap);
		map.put("mapObj2", sortMap2);
		map.put("label", label);
		
		return map;
	}
	//맵 정렬 함수
	 public  List sortByValue(final Map map){
	        List<String> list = new ArrayList();
	        list.addAll(map.keySet());
	        Collections.sort(list,new Comparator(){
	            public int compare(Object o1,Object o2){
	                Object v1 = map.get(o1);
	                Object v2 = map.get(o2);
	                return ((Comparable) v1).compareTo(v2);
	            }
	        });
	        Collections.reverse(list); // 주석시 오름차순
	        return list;
	    }




}