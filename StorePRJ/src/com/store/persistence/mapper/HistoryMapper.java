package com.store.persistence.mapper;


import java.util.List;

import com.store.config.Mapper;
import com.store.dto.apiDTO;


@Mapper("HistoryMapper")
public interface HistoryMapper {

	List<apiDTO> getLocInfo();

	List<apiDTO> getIndsInfo();

	List<apiDTO> getVisitInfo();

	List<apiDTO> getMyAnalysis(String userNo);

	List<apiDTO> getMyHistory(String userNo);


}