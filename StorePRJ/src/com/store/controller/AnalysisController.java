package com.store.controller;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

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
	
	
	@RequestMapping(value = "searchSigungu", method = RequestMethod.GET)
	public void searchSigungu(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("come into searchSigungu");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml; charset=utf-8");

		String addr = "http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=dong&catId=mega&ServiceKey=";
		String serviceKey = "bfw1QwdYKkozjInhO3oOO2EYjnnQ0NuD2kGSGNoMbde0thgnqlF9R0rARkMmhe6yWNC5hsF5MebZGhSV1Io67w%3D%3D";
		String parameter = "";

		addr = addr + serviceKey;
		URL url = new URL(addr);

		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");

		String tag = null;
		int event_type = xpp.getEventType();

		ArrayList<String> list = new ArrayList<String>();
		
		String ctprvnNm = null;
		while (event_type != XmlPullParser.END_DOCUMENT) {
			if (event_type == XmlPullParser.START_TAG) {
				tag = xpp.getName();
			} else if (event_type == XmlPullParser.TEXT) {
				/**
				 * 약국의 주소만 가져와본다.
				 */
				if (tag.equals("ctprvnNm")) {
					ctprvnNm =xpp.getText();
				}
				
				
			} else if (event_type == XmlPullParser.END_TAG) {
				tag = xpp.getName();
				 if (tag.equals("item")) {
	                    list.add(ctprvnNm);
	                }
			}

			event_type = xpp.next();
		}
		System.out.println(list.size());	
		 for(String entity : list){
	            System.out.println("entity: "+entity);
	     }

	}

}
