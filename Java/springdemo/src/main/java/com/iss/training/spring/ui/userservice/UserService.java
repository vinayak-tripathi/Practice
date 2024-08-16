package com.iss.training.spring.ui.userservice;

import com.iss.training.spring.ui.model.request.UserDetailsRequestModel;
import com.iss.training.spring.ui.model.response.UserRest;

public interface UserService {
	UserRest createUser(UserDetailsRequestModel userDetails);
}
