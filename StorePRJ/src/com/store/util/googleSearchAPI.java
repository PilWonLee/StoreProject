package com.store.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class googleSearchAPI {

	public String getInfo(String searchWord) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("https://www.googleapis.com/customsearch/v1"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("key", "UTF-8") + "=AIzaSyBfYaGgeo9QaIljnq0Gr3RLg18xy28uZNM")
				.append("&" + URLEncoder.encode("cx", "UTF-8") + "=011859457498976593040:cqqcv0nq3ri")
				.append("&" + URLEncoder.encode("q", "UTF-8") + "=" + URLEncoder.encode(searchWord, "UTF-8")); /*
																												 * Service
																												 */
		String result = "";
		String result2 = "";
		// 占쏙옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쌘뤄옙 占쌍억옙占쌔댐옙!
		for (int i = 0; i <= 4; i++) {
			String index = Integer.toString(i * 10);

			urlBuilder.append("?" + URLEncoder.encode("start", "UTF-8") + "=" + index);
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
				/* System.out.println(line); */
			}
			rd.close();
			conn.disconnect();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(sb.toString());
			JSONArray itemsArray = (JSONArray) jsonObj.get("items");

			for (int j = 0; j < itemsArray.size(); j++) {
				JSONObject tempObj = (JSONObject) itemsArray.get(j);
				result += tempObj.get("title");
				result2 += tempObj.get("snippet");
			}
		}

		List<String> list = new ArrayList<>();

		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		for (String word : result.split("\\s")) {
			if (word.replaceAll(match, "").length() > 1) {
				list.add(word.replaceAll(match, ""));
			}
		}
		for (String word : result2.split("\\s")) {
			if (word.replaceAll(match, "").length() > 1) {
				list.add(word.replaceAll(match, ""));
			}
		}

		Map<String, Integer> map = new HashMap<String, Integer>();
		for (String s : list) {

			if (!map.containsKey(s)) { // first time we've seen this string
				map.put(s, 1);
			} else {
				int count = map.get(s);
				map.put(s, count + 1);
			}
		}
		
		for (String key : map.keySet()) {
			System.out.println(" key : " + key + " / value : " + map.get(key));
		}


		return null;
	}

}
