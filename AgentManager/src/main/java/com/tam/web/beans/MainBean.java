package com.tam.web.beans;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;

import com.tam.web.util.FacesUtil;

@ManagedBean
@RequestScoped
public class MainBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@ManagedProperty("#{sessionBean}")
    private SessionBean sessionBean;
	
	private String userName;
	
	public MainBean(){
		
	}

	@PostConstruct
	private void postConstruct(){
		if(!isUserLoggedIn()){
			FacesUtil.redirectToPage("Login.xhtml");
		}
	}
	
	private boolean isUserLoggedIn(){
		//sessionBean =FacesUtil.getSessionBeanFromSession();
		if (sessionBean==null|| sessionBean.getUser() == null)
			return false;
		else
			return true;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public SessionBean getSessionBean() {
		return sessionBean;
	}

	public void setSessionBean(SessionBean sessionBean) {
		this.sessionBean = sessionBean;
	}
}
