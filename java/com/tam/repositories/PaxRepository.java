package com.tam.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tam.model.ContactInfo;
import com.tam.model.Pax;
import com.tam.model.Pnr;


public interface PaxRepository extends JpaRepository<Pax, Integer>{
	List<Pax> findByPnr(Pnr pnr);
	ContactInfo findContactInfoById(int id);
}
