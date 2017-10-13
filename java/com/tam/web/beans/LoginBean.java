package com.tam.web.beans;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tam.model.User;
import com.tam.service.UserSrv;


@ManagedBean
@RequestScoped
public class LoginBean {

	private String userName;
	private String password;
	private User user;

	@Autowired
	@ManagedProperty("#{userSrv}")
	private UserSrv userServicee;
	
	@ManagedProperty("#{sessionBean}")
    private SessionBean sessionBean;
	
	

	
	@PostConstruct
	private void postConstruct() {
		userName = "";
		password = "";
		sessionBean.reConstruct();
	}

	public String login() {
		try {
			if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
				sessionBean.setError("LOGIN", "Wrong or missing credentials");
				return "errorManagement.xhtml?faces-redirect=true";
			}
				user=userServicee.loginUser(userName,password);
				sessionBean.setUser(user);
				return "index.jsf?faces-redirect=true";
		
		} catch (Exception e) {
			sessionBean.setError("LOGIN", e.getMessage());
			return "errorManagement.jsf?faces-redirect=true";
		}
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUsername(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public SessionBean getSessionBean() {
		return sessionBean;
	}

	public void setSessionBean(SessionBean sessionBean) {
		this.sessionBean = sessionBean;
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserSrv getUserServicee() {
		return userServicee;
	}
	public void setUserServicee(UserSrv userServicee) {
		this.userServicee = userServicee;
	}

}
