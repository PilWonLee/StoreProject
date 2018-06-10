package com.store.service;

import java.util.List;

import com.store.dto.RecommendDTO;

public interface IRecommendService {

	void insertRecommend(RecommendDTO rDTO);

	List<RecommendDTO> getList();

	List<RecommendDTO> addList(int start);

	void deleteRcd(String rcdNo);

	RecommendDTO getDetail(String rcdNo);

	void updateRecommend(RecommendDTO rDTO);



}
