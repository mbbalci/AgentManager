package com.tam.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tam.model.Pax;
import com.tam.model.Pnr;

public interface PnrRepository extends JpaRepository<Pnr, Integer> {
 public Pnr findById(Integer id);
 public Pnr findByPnrNo(String pnrNo);

}
