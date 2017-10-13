package com.tam.web.beans;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;

import org.apache.commons.lang.StringUtils;


@ManagedBean
@RequestScoped
public class ErrorManagementBean implements Serializable {

	private static final long serialVersionUID = 4842515720067352888L;

	@ManagedProperty("#{sessionBean}")
    private SessionBean sessionBean;
	private String errorCode;
	private String errorMessage;
	
	public ErrorManagementBean(){
		
	}

	@PostConstruct
	private void postConstruct() {
		//sessionBean =(SessionBean)FacesUtil.getSessionBeanFromSession();
		if(sessionBean!=null && !StringUtils.isBlank(sessionBean.getErrorCode())){
			this.errorCode = sessionBean.getErrorCode();
			this.errorMessage = sessionBean.getErrorMessage();
		}else{
			this.errorCode = "UNERR";
			this.errorMessage = "An unexpected error has occurred. Please contact system administrator!";
		}
	}
	
	public SessionBean getSessionBean() {
		return sessionBean;
	}

	public void setSessionBean(SessionBean sessionBean) {
		this.sessionBean = sessionBean;
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
