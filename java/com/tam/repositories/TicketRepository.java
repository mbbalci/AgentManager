package com.tam.repositories;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tam.model.Pax;
import com.tam.model.Pnr;
import com.tam.model.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, String>{
	//Set<Coupon> findCouponsByTktNo(String tktNo);
	Pax findPaxByTktNo(String tktNo);
	List<Ticket> findByPnr(Pnr pnr);
}
