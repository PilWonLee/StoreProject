package com.store.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.store.dto.userDTO;
import com.store.persistence.mapper.MainMapper;
import com.store.service.IMainService;

@Service("MainService")
public class MainService implements IMainService {
		
	@Resource(name="MainMapper")
	private MainMapper mainMapper;


	@Override
	public int emailCheck(String email) throws Exception {
		return mainMapper.emailCheck(email);
	}

	@Override
	public void insertUser(userDTO u) throws Exception {
		mainMapper.insertUser(u);
	}

	@Override
	public userDTO login(userDTO u) throws Exception {
		return mainMapper.login(u);
	}

	@Override
	public userDTO getUserNo(String email) {
		return mainMapper.getUserNo(email);
	}

	@Override
	public void updateConfirm(String userNo) {
		mainMapper.updateConfirm(userNo);
	}

	@Override
	public void changePassword(userDTO u) {
		mainMapper.changePassword(u);
	}
		
	
		
}