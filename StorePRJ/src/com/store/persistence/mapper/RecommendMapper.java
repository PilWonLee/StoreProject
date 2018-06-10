package com.store.persistence.mapper;

import java.util.List;

import com.store.config.Mapper;
import com.store.dto.RecommendDTO;


@Mapper("RecommendMapper")
public interface RecommendMapper {

	void insertRecommend(RecommendDTO rDTO);

	List<RecommendDTO> getList();

	List<RecommendDTO> addList(int start);

	void deleteRcd(String rcdNo);

	RecommendDTO getInfo(String rcdNo);

	RecommendDTO getDetail(String rcdNo);

	void updateRecommend(RecommendDTO rDTO);



}