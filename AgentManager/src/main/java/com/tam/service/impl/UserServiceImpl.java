package com.tam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.dao.impl.UserDaoImpl;
import com.tam.service.UserInfo;
import com.tam.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDaoImpl userDao;
	
	@Override
	public UserInfo loginUser(String userName, String password) {
		userDao.getUser(userName);
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkUserProcess(UserInfo userInfo, String processCode) {
		// TODO Auto-generated method stub
		return false;
	}

}
