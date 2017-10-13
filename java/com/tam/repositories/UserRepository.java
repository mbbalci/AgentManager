package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tam.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{
		User findByuserNameAndUserPassword(String userName,String userPassword);
}
