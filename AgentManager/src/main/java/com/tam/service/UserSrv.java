package com.tam.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tam.model.User;
import com.tam.repositories.UserRepository;

@Service("userSrv")
public class UserSrv {

	@Autowired
	private UserRepository usrRepo;
	
	
	
	public List<User> getUserList() {
		
        return usrRepo.findAll();
    }
	public User findUser(String username,String password)
	{
		User user=usrRepo.findByuserNameAndUserPassword(username, password);
		return user;
	}
	@Transactional
	public User loginUser(String userName, String password) throws Exception{
		User user;
		user = usrRepo.findByuserNameAndUserPassword(userName, password);
		if (!user.equals(null)) {
			return user;
		}else{
			throw new Exception("Invalid user name or password");
		}
	}
	public UserRepository getUsrRepo() {
		return usrRepo;
	}
	public void setUsrRepo(UserRepository usrRepo) {
		this.usrRepo = usrRepo;
	}
	
}
