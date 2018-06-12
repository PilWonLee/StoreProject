package com.store.service;


import java.util.List;

import com.store.dto.apiDTO;


public interface IHistoryService {

	List<apiDTO> getLocInfo();

	List<apiDTO> getIndsInfo();

	List<apiDTO> getVisitInfo();

	List<apiDTO> getMyAnalysis(String userNo);

	List<apiDTO> getMyHistory(String userNo);

	
}