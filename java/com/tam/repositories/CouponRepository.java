package com.tam.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.tam.model.Coupon;
import com.tam.model.Segment;
import com.tam.model.Ticket;

public interface CouponRepository extends JpaRepository<Coupon, Integer>{
	List<Coupon> findBySegment(Segment segment);
	List<Coupon> findByTicket(Ticket ticket);
	Segment findSegmentById(int id);
	
}
