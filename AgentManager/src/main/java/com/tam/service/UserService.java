package com.tam.service;

public interface UserService {

	UserInfo loginUser(String userName, String password);

	boolean checkUserProcess(UserInfo userInfo, String processCode);

}
