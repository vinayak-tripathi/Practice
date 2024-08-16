package com.iss.training.spring.ui.userservice.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.training.spring.ui.model.request.UserDetailsRequestModel;
import com.iss.training.spring.ui.model.response.UserRest;
import com.iss.training.spring.ui.shared.Utils;
import com.iss.training.spring.ui.userservice.UserService;

@Service
public class UserServiceImplementation implements UserService {
	
	Map<String, UserRest> users;
	Utils utils;
	
	@Autowired
	public UserServiceImplementation(Utils utils) {
		this.utils = utils;
	}
	
	@Override
	public UserRest createUser(UserDetailsRequestModel userDetails) {
		UserRest returnValue = new UserRest();
		returnValue.setEmail(userDetails.getEmail());
		returnValue.setFirstName(userDetails.getFirstName());
		returnValue.setLastName(userDetails.getLastName());
		String userId = utils.generateUserId();
		returnValue.setUserId(userId);
		
		if(users == null) users = new HashMap<>();
		
		
		
		return returnValue;
	}

}
