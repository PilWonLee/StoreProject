package com.store.service;

import java.util.List;

import com.store.dto.apiDTO;
import com.store.dto.populationDTO;

public interface IAnalysisService {

	List<populationDTO> getPopulation(String locName)throws Exception;

	void storeHistory(apiDTO history);

}
