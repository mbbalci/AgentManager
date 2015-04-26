package com.tam.service;

import com.tam.model.User;

public interface UserService {

	User loginUser(String userName, String password) throws Exception;

	boolean checkUserProcess(User user, String processCode);

}
