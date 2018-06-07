package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dto.RecommendDTO;
import com.store.persistence.mapper.RecommendMapper;
import com.store.service.IRecommendService;


@Service("RecommendService")
public class RecommendService implements IRecommendService {
		
	@Resource(name="RecommendMapper")
	private RecommendMapper recommendMapper;

	@Override
	public void insertRecommend(RecommendDTO rDTO) {
		recommendMapper.insertRecommend(rDTO);
	}


	
		
}