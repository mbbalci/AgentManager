package com.tam.web.beans;

import javax.el.ValueExpression;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import com.tam.model.Port;

@FacesConverter(value="portConverter")
public class portConverter implements Converter{

	@Override
	public Object getAsObject(FacesContext context, UIComponent component, String value) {

        return null;
	}

	@Override
	public String getAsString(FacesContext context, UIComponent component, Object value) {
		// TODO Auto-generated method stub
		return null;
	}

}
