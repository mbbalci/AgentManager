package com.tam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tam.model.Process;
import com.tam.model.Role;
import com.tam.model.User;
import com.tam.repositories.UserRepository;
import com.tam.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userDao;
	
	@Override
	@Transactional
	public User loginUser(String userName, String password) throws Exception{
		User user;
		user = userDao.findByuserNameAndUserPassword(userName, password);
		if (user != null) {
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
