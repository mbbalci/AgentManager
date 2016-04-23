package com.tam.dao;

import com.tam.model.Pax;

public interface PaxDao {
	
	public Pax getPax(Integer id);
	
	public void addPax(Pax pax);
	
	public void updatePax(Pax pax);

}
