package com.tam.web.util;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.faces.FactoryFinder;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.component.UIViewRoot;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.lifecycle.Lifecycle;
import javax.faces.lifecycle.LifecycleFactory;
import javax.servlet.http.HttpServletRequest;

import com.tam.web.beans.SessionBean;

public abstract class FacesUtil {
	/*
	private static MessageMap messageMap = (MessageMap) getBeanFromSession("messageMap");

    public static String translate(String message) {
        try {
        	messageMap = (MessageMap) getBeanFromSession("messageMap");
            messageMap.setLanguage(CommonMobile.getSessionStruct().getLanguage());
        } catch (Exception e) {
            e.printStackTrace();
        }        
        return messageMap.get(message);
    }*/
    
	public static Application getApplication() {
		return FacesContext.getCurrentInstance().getApplication();
	}

	public static Locale getLocale() {
		return getViewRoot().getLocale();
	}

	public static void setLocale(Locale locale) {
		getViewRoot().setLocale(locale);
	}

	public static UIViewRoot getViewRoot() {
		return getFacesContext().getViewRoot();
	}

	public static Map<?, ?> getApplicationMap() {
		return getExternalContext().getApplicationMap();
	}

	public static ExternalContext getExternalContext() {
		return getFacesContext().getExternalContext();
	}

	public static FacesContext getFacesContext() {
		return FacesContext.getCurrentInstance();
	}

	public static Lifecycle getLifecycle() {
		String lifecycleId = getExternalContext().getInitParameter("javax.faces.LIFECYCLE_ID");
		if (lifecycleId == null || lifecycleId.length() == 0) {
			lifecycleId = LifecycleFactory.DEFAULT_LIFECYCLE;
		}
		LifecycleFactory lifecycleFactory = (LifecycleFactory) FactoryFinder.getFactory(FactoryFinder.LIFECYCLE_FACTORY);
		return lifecycleFactory.getLifecycle(lifecycleId);
	}

	public static HttpServletRequest getRequest() {
		return (HttpServletRequest) FacesContext.getCurrentInstance()
				.getExternalContext().getRequest();
	}

	public static Map<?, ?> getRequestHeaderMap() {
		return getExternalContext().getRequestHeaderMap();
	}

	public static Map<?, ?> getRequestMap() {
		return getExternalContext().getRequestMap();
	}

	public static Map<?, ?> getRequestParameterMap() {
		return getExternalContext().getRequestParameterMap();
	}

	public static Map<String, Object> getSessionMap() {
		return getExternalContext().getSessionMap();
	}

	public static void clearSessionMap() {
		getSessionMap().clear();
	}

	public static void forceNavigationTo(String navigatedPage) {
		getApplication().getNavigationHandler().handleNavigation(FacesContext.getCurrentInstance(), null, navigatedPage);
	}
	
	public static SessionBean getSessionBeanFromSession() {
		return (SessionBean)getSessionMap().get("sessionBean");
	}
	
	public static void putSessionBeanOnSession(SessionBean sessionBean,boolean resetError) {
		if(resetError){
			sessionBean.resetError();
		}
		getSessionMap().put("sessionBean", sessionBean);
	}
	
	public static Object getBeanFromSession(String name) {
		return getSessionMap().get(name);
	}

	public static void putBeanOnSession(String name, Object value) {
		getSessionMap().put(name, value);
	}

	public static void putObjectOnRequestSession(String name, Object value) {
		getRequest().getSession().setAttribute(name, value);
	}

	public static String getRequestParameter(String name) {
		return (String) getExternalContext().getRequestParameterMap().get(name);
	}

	public static String[] getRequestParameterValues(String name) {
		return (String[]) getExternalContext().getRequestParameterValuesMap()
				.get(name);
	}

	public static void log(String message) {
		FacesContext context = getFacesContext();
		ExternalContext econtext = null;
		if (context != null) {
			econtext = context.getExternalContext();
		}
		if (econtext != null) {
			econtext.log(message);
		} else {
			System.out.println(message);
		}
	}

	public static void log(String message, Throwable throwable) {
		FacesContext context = getFacesContext();
		ExternalContext econtext = null;
		if (context != null) {
			econtext = context.getExternalContext();
		}
		if (econtext != null) {
			econtext.log(message, throwable);
		} else {
			System.out.println(message);
			throwable.printStackTrace(System.out);
		}
	}

	public static void info(String summary) {
		getFacesContext().addMessage(null,new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null));
	}

	public static void info(UIComponent component, String summary) {
		FacesContext context = getFacesContext();
		context.addMessage(component.getClientId(context), new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null));
	}

	public static void warn(String summary) {
		getFacesContext().addMessage(null,new FacesMessage(FacesMessage.SEVERITY_WARN, summary, null));
	}

	public static void warn(UIComponent component, String summary) {
		FacesContext context = getFacesContext();
		context.addMessage(component.getClientId(context), new FacesMessage(FacesMessage.SEVERITY_WARN, summary, null));
	}

	public static void error(String summary) {
		getFacesContext().addMessage(null,new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null));
	}

	public static void errorNonTranslated(String summary) {
		getFacesContext().addMessage(null,new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null));
	}

	public static void error(UIComponent component, String summary) {
		FacesContext context = getFacesContext();
		context.addMessage(component.getClientId(context), new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null));
	}

	public static void error(String componentId, String summary) {
		FacesContext context = getFacesContext();
		context.addMessage(componentId, new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null));
	}

	public static void fatal(String summary) {
		getFacesContext().addMessage(null,new FacesMessage(FacesMessage.SEVERITY_FATAL, summary, null));
	}

	public static void fatal(UIComponent component, String summary) {
		FacesContext context = getFacesContext();
		context.addMessage(component.getClientId(context), new FacesMessage(
				FacesMessage.SEVERITY_FATAL, summary, null));
	}

	public static String getErrorMessages() {
		FacesContext context = getFacesContext();
		StringBuilder sb = new StringBuilder();
		for (FacesMessage message : context.getMessageList()) {
			sb.append(message.getSummary());
		}

		return sb.toString();
	}

//	public static CommonValidator getCommonValidator() {
//		CommonValidator commonValidator = null;
//		commonValidator = (CommonValidator) getBeanFromSession("commonValidator");
//		if (commonValidator == null) {
//			commonValidator = new CommonValidator();
//			putBeanOnSession("commonValidator", commonValidator);
//		}
//		return commonValidator;
//	}

	public static String getComponentClienId(String componentId) {
		FacesContext context = FacesContext.getCurrentInstance();
		UIViewRoot root = context.getViewRoot();

		UIComponent c = findComponent(root, componentId);
		return c.getClientId(context);
	}
	
	private static UIComponent findComponent(UIComponent c, String id) {
		if (id.equals(c.getId())) {
			return c;
		}
		java.util.Iterator<UIComponent> kids = c.getFacetsAndChildren();
		while (kids.hasNext()) {
			UIComponent found = findComponent(kids.next(), id);
			if (found != null) {
				return found;
			}
		}
		return null;
	}

	public static UIComponent getUIComponent(String componentId) {
		FacesContext context = FacesContext.getCurrentInstance();
		UIViewRoot root = context.getViewRoot();

		UIComponent c = findComponent(root, componentId);
		return c;
	}
	public static void redirectToPage(String pagePath){
		ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();
		try{
			ec.redirect(pagePath);
		}
		catch (IOException e){
			FacesUtil.error(e.getMessage());
		}
	}

}
