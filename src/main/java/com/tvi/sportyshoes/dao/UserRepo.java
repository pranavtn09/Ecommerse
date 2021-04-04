package com.tvi.sportyshoes.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tvi.sportyshoes.model.Users;

public interface UserRepo extends JpaRepository<Users, Integer> {

	@Query("SELECT DISTINCT u.username from Users u")
	List<String> findAllByUsername();
	
	@Query("from Users where username=?1")
	Users findByUsernameLogin(String username);
	
	
}
