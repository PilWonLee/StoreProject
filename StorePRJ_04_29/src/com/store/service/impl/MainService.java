package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dto.mainDTO;
import com.store.persistence.mapper.MainMapper;
import com.store.service.IMainService;

@Service("MainService")
public class MainService implements IMainService {
		
	@Resource(name="MainMapper")
	private MainMapper mainMapper;

	@Override
	public List<mainDTO> getInfo() throws Exception {
		return mainMapper.getInfo();
	}
		
	
		
}