package com.store.service;

import java.util.List;

import com.store.dto.RecommendDTO;

public interface IRecommendService {

	void insertRecommend(RecommendDTO rDTO);

	List<RecommendDTO> getList();

}
