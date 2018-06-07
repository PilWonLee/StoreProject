package com.store.persistence.mapper;

import java.util.List;

import com.store.config.Mapper;
import com.store.dto.RecommendDTO;


@Mapper("RecommendMapper")
public interface RecommendMapper {

	void insertRecommend(RecommendDTO rDTO);



}