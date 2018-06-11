package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dto.apiDTO;
import com.store.dto.populationDTO;
import com.store.persistence.mapper.AnalysisMapper;
import com.store.persistence.mapper.MainMapper;
import com.store.service.IAnalysisService;

@Service("AnalysisService")
public class AnalysisService implements IAnalysisService{
	
	@Resource(name="AnalysisMapper")
	private AnalysisMapper analysisMapper;
	
	@Override
	public List<populationDTO> getPopulation(String locName) throws Exception {
		return analysisMapper.getPopulation(locName);
	}

	@Override
	public void storeHistory(apiDTO history) {
		analysisMapper.storeHistory(history);
	}

	
	
}
