package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tam.model.Pnr;

public interface PnrRepository extends JpaRepository<Pnr, Integer> {

}
