package com.store.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dto.apiDTO;
import com.store.persistence.mapper.HistoryMapper;
import com.store.service.IHistoryService;

@Service("HistoryService")
public class HistoryService implements IHistoryService {
		
	@Resource(name="HistoryMapper")
	private HistoryMapper historyMapper;

	@Override
	public List<apiDTO> getLocInfo() {
		return historyMapper.getLocInfo();
	}

	@Override
	public List<apiDTO> getIndsInfo() {
		return historyMapper.getIndsInfo();
	}

	@Override
	public List<apiDTO> getVisitInfo() {
		return historyMapper.getVisitInfo();
	}

	@Override
	public List<apiDTO> getMyAnalysis(String userNo) {
		return historyMapper.getMyAnalysis(userNo);
	}

	@Override
	public List<apiDTO> getMyHistory(String userNo) {
		return historyMapper.getMyHistory(userNo);
	}



		
	
		
}