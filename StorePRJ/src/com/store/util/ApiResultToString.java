package com.store.util;

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.net.URL;
import java.net.URLEncoder;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;



public class ApiResultToString {

	public String getString(HashMap<String, String> map) throws Exception {

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/baroApi"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=bfw1QwdYKkozjInhO3oOO2EYjnnQ0NuD2kGSGNoMbde0thgnqlF9R0rARkMmhe6yWNC5hsF5MebZGhSV1Io67w%3D%3D"); /*
																													 * Service
																													 */

		Set set = map.keySet();
		Iterator iterator = set.iterator();
		
		
		//���� ��ü�� ���ڷ� �־��ش�!
		while (iterator.hasNext()) {
			String key = (String) iterator.next();
			urlBuilder.append("&" + URLEncoder.encode(key, "UTF-8") + "="
					+ URLEncoder.encode(map.get(key), "UTF-8")); /* ���ҽ��� �ĺ��ϱ� ���� id. */
		} /*
			 * ���ҽ��� ī�װ��� ���� baroApi���� resId, catId �׸��� �ٸ� ���۷��̼��� �����ϱ� ���� �ֿ��� �׸��̰� ���۷��̼Ǻ� �ٸ�
			 * �׸��� ���۷��̼Ǻ��� ���� �ۼ��� �׸��� ����ϸ� �ȴ�.
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

}
