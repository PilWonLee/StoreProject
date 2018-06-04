package com.store.persistence.mapper;

import java.util.List;

import com.store.dto.userDTO;
import com.store.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {


	int emailCheck(String email)throws Exception;

	void insertUser(userDTO u)throws Exception;

	userDTO login(userDTO u)throws Exception;

}