package com.store.service;

import java.util.List;

import com.store.dto.userDTO;

public interface IMainService {

	int emailCheck(String email)throws Exception;

	void insertUser(userDTO u)throws Exception;

	userDTO login(userDTO u)throws Exception;
	
}