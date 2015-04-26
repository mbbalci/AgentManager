package com.tam.web.beans;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tam.model.User;
import com.tam.service.UserService;

@ManagedBean
@RequestScoped
public class LoginBean {

	private String userName;
	private String password;
	

	@ManagedProperty("#{sessionBean}")
    private SessionBean sessionBean;
	
	@Autowired
	UserService userService;
	
	
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
			User user= userService.loginUser(userName,password);
			sessionBean.setUser(user);
			return "main.xhtml?faces-redirect=true";
		} catch (Exception e) {
			sessionBean.setError("LOGIN", e.getMessage());
			return "errorManagement.xhtml?faces-redirect=true";
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
}
