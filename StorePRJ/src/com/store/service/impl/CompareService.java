package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dto.RecommendDTO;
import com.store.persistence.mapper.CompareMapper;
import com.store.service.ICompareService;

@Service("CompareService")
public class CompareService implements ICompareService {
		
	@Resource(name="CompareMapper")
	private CompareMapper compareMapper;

	@Override
	public List<RecommendDTO> getList(String locName, String locName2) {
		return CompareMapper.getList(locName,locName2);
	}

		
	
		
}