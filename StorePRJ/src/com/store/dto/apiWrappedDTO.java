package com.store.dto;

import java.util.List;

public class apiWrappedDTO {
	List<apiDTO> list;
	String page;
	String totalPage;
	public String getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(String totalPage) {
		this.totalPage = totalPage;
	}
	public List<apiDTO> getList() {
		return list;
	}
	public void setList(List<apiDTO> list) {
		this.list = list;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
}
