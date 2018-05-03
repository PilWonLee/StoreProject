package com.store.persistence.mapper;

import java.util.List;

import com.store.dto.mainDTO;
import com.store.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {

	List<mainDTO> getInfo()throws Exception;

}