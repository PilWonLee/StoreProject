package com.store.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.store.dto.apiDTO;
import com.store.dto.apiWrappedDTO;

public class ApiProcess {
	public String getString(HashMap<String, String> map) throws Exception {

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/baroApi"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=bfw1QwdYKkozjInhO3oOO2EYjnnQ0NuD2kGSGNoMbde0thgnqlF9R0rARkMmhe6yWNC5hsF5MebZGhSV1Io67w%3D%3D"); /*
																													 * Service
																													 */

		Set set = map.keySet();
		Iterator iterator = set.iterator();

		// 占쏙옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쌘뤄옙 占쌍억옙占쌔댐옙!
		while (iterator.hasNext()) {
			String key = (String) iterator.next();
			urlBuilder.append("&" + URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(map.get(key),
					"UTF-8")); /* 占쏙옙占쌀쏙옙占쏙옙 占식븝옙占싹깍옙 占쏙옙占쏙옙 id. */
		} /*
			 * 占쏙옙占쌀쏙옙占쏙옙 카占쌓곤옙占쏙옙 占쏙옙占쏙옙 baroApi占쏙옙占쏙옙 resId, catId 占쌓몌옙占쏙옙
			 * 占쌕몌옙 占쏙옙占쌜뤄옙占싱쇽옙占쏙옙 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙 占쌍울옙占쏙옙 占쌓몌옙占싱곤옙
			 * 占쏙옙占쌜뤄옙占싱션븝옙 占쌕몌옙 占쌓몌옙占쏙옙 占쏙옙占쌜뤄옙占싱션븝옙占쏙옙 占쏙옙占쏙옙 占쌜쇽옙占쏙옙 占쌓몌옙占쏙옙
			 * 占쏙옙占쏙옙玖占� 占싫댐옙.
			 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		StringBuffer sb = new StringBuffer();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		return sb.toString();
	}

	public Map<String, Integer> getInfo(String locName, String midName) throws Exception {
		String searchWord = locName + " " + midName;
		StringBuilder urlBuilder = new StringBuilder("https://www.googleapis.com/customsearch/v1"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("key", "UTF-8") + "=AIzaSyDIgqxeFzYTT579AmM24PX5M_74rxa1lBo")
				.append("&" + URLEncoder.encode("cx", "UTF-8") + "=011859457498976593040:cqqcv0nq3ri")
				.append("&" + URLEncoder.encode("q", "UTF-8") + "=" + URLEncoder.encode(searchWord, "UTF-8")); /*
																												 * Service
																												 */
		String result = "";
		String result2 = "";

		// 占쏙옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쌘뤄옙 占쌍억옙占쌔댐옙!
		for (int i = 0; i <= 4; i++) {
			String index = Integer.toString(i * 10);
			StringBuilder tmp = new StringBuilder(urlBuilder);
			if (i == 0) {
				urlBuilder.append("&" + URLEncoder.encode("startIndex", "UTF-8") + "=" + index);
			} else {
				urlBuilder.append("&" + URLEncoder.encode("start", "UTF-8") + "=" + index);
			}

			URL url = new URL(urlBuilder.toString());
			System.out.println("url : " + url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			StringBuffer sb = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			// 검색결과 Json으로 Parsing
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(sb.toString());
			JSONArray itemsArray = (JSONArray) jsonObj.get("items");

			for (int j = 0; j < itemsArray.size(); j++) {
				JSONObject tempObj = (JSONObject) itemsArray.get(j);
				result += tempObj.get("title");
				result2 += tempObj.get("snippet");
			}

			urlBuilder = new StringBuilder(tmp);
		}
		// 검색결과 한글만 리스트에 담기
		List<String> list = new ArrayList<>();

		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		for (String word : result.split("\\s")) {
			if (Pattern.matches("^[ㄱ-ㅎ가-힣]*$", word.replaceAll(match, ""))) {
				if (word.replaceAll(match, "").length() > 1) {
					list.add(word.replaceAll(match, ""));
				}
			}
		}
		for (String word : result2.split("\\s")) {
			if (Pattern.matches("^[ㄱ-ㅎ가-힣]*$", word.replaceAll(match, ""))) {
				if (word.replaceAll(match, "").length() > 1) {
					list.add(word.replaceAll(match, ""));
				}
			}
		}
		// 검색결과 WordCount
		Map<String, Integer> map = new HashMap<String, Integer>();
		for (String s : list) {
			if (!s.equals(locName) && !s.equals(midName)) {  //검색어는 빼기
				if (!map.containsKey(s)) { // first time we've seen this string
					map.put(s, 1);
				} else {
					int count = map.get(s);
					map.put(s, count + 1);
				}
			}
		}

		return map;
	}

	public apiWrappedDTO startApi(String radius, String cx, String cy, int page) throws Exception {

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

		System.out.println("length : " + result.length());

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

}
