package com.tam.dao;

import java.util.List;

public interface IGenericDoa<E, K> {

	public void save(E entity);

	public void remove(E entity);

	public E findbyID(K key);

	public List<E> getAll();
}
