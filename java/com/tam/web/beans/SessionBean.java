package com.tam.web.beans;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import com.tam.model.User;

@ManagedBean
@SessionScoped
public class SessionBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private User user;
	private String errorCode;
	private String errorMessage;
	
	public SessionBean() {}
	
	public void reConstruct() {
		errorCode=null;
		errorMessage=null;
		setUser(new User());
	}
	
	public void setError(String errorCode,String errorMessage){
		this.errorCode = errorCode;
		this.errorMessage= errorMessage;
	}
	
	public void resetError(){
		this.errorCode = null;
		this.errorMessage= null;
	}
	
	protected void finalize() throws Throwable {
		try {
			setUser(null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			super.finalize();
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
}
