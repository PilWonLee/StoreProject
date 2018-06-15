package com.store.service;

import java.util.List;

import com.store.dto.RecommendDTO;

public interface ICompareService {

	List<RecommendDTO> getList(String locName, String locName2);

}
