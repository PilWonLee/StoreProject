package com.store.persistence.mapper;

import java.util.List;

import com.store.config.Mapper;
import com.store.dto.apiDTO;
import com.store.dto.populationDTO;

@Mapper("AnalysisMapper")
public interface AnalysisMapper {

	List<populationDTO> getPopulation(String locName) throws Exception;

	void storeHistory(apiDTO history);

}
