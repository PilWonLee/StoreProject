package com.store.service;

import java.util.List;

import com.store.dto.mainDTO;
import com.store.dto.userDTO;

public interface IMainService {

	List<mainDTO> getInfo()throws Exception;

	int emailCheck(String email)throws Exception;

	void insertUser(userDTO u)throws Exception;

	userDTO login(userDTO u)throws Exception;
	
	

}