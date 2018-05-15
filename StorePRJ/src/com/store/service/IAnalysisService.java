package com.store.service;

import java.util.List;

import com.store.dto.populationDTO;

public interface IAnalysisService {

	List<populationDTO> getPopulation(String locName)throws Exception;

}
