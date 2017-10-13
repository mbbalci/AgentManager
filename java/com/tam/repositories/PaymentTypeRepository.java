package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tam.model.PaymentType;

public interface PaymentTypeRepository extends JpaRepository<PaymentType, Integer> {

}
