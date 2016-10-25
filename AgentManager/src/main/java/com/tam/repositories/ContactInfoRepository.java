package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tam.model.ContactInfo;

public interface ContactInfoRepository extends JpaRepository<ContactInfo, Integer> {

}
