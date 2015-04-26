package com.tam.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.dao.UserDao;
import com.tam.model.Role;
import com.tam.model.User;
import com.tam.model.Process;
import com.tam.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User loginUser(String userName, String password) throws Exception{
		User user;
		user = userDao.getUser(userName);
		if (StringUtils.equals(user.getUserPassword(), password)) {
			return user;
		}else{
			throw new Exception("Invalid user name or password");
		}
	}

	@Override
	public boolean checkUserProcess(User user, String processCode) {
		
		boolean result = false;
		search : {
			for (Role role : user.getUserRoles()) {
				for (Process process : role.getProcesses()) {
					if (processCode.equals(process.getCode())) {
						result = true;
						break search;
					}
				}
			}
		}
		return result;
	}

}
