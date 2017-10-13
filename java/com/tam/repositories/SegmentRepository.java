package com.tam.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tam.model.Port;
import com.tam.model.Segment;

public interface SegmentRepository extends JpaRepository<Segment, Integer> {
	Segment findSegmentByAaCodeAndFltNo(String aa_code, String flt_no);

	@Query(value = "select s.* from segment s,coupon c where c.id = ?1 and c.segment_id=s.id",nativeQuery=true)
	Segment findByCouponId(int id);

	List<Segment> findByDepDate(Date depDate);

	List<Segment> findByDepDateBetween(Date depDate1, Date depDate2);

	List<Segment> findByPortByDepPortAndPortByArrPort(Port depPort, Port arrPort);

	Segment findByPortByDepPortAndPortByArrPortAndDepDate(Port depPort, Port arrPort, Date depDate);
}
