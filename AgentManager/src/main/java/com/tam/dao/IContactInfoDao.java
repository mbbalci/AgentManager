package com.tam.dao;

import com.tam.model.ContactInfo;

public interface IContactInfoDao {

	public ContactInfo get(Integer id);

	public void add(ContactInfo contactInfo);

	public void update(ContactInfo ContactInfo);

}
