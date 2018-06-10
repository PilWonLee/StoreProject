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

	@Override
	public List<RecommendDTO> getList() {
		return recommendMapper.getList();
	}

	@Override
	public List<RecommendDTO> addList(int start) {
		return recommendMapper.addList(start);
	}

	@Override
	public void deleteRcd(String rcdNo) {
		recommendMapper.deleteRcd(rcdNo);
	}

	@Override
	public RecommendDTO getDetail(String rcdNo) {
		return recommendMapper.getDetail(rcdNo);
	}

	@Override
	public void updateRecommend(RecommendDTO rDTO) {
		recommendMapper.updateRecommend(rDTO);		
	}
	
	
	
	

	


	
		
}