package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tam.model.Port;


public interface PortRepository extends JpaRepository<Port, String>{
	Port findPortByName(String name);
	Port findByCode(String code);
	@Query(value="select p.* from segment s, port p, coupon c where c.id = ?1 and c.segment_id=s.id and s.dep_port = p.code",nativeQuery=true)
	Port findByDepPortByCouponId(int id);
	@Query(value="select p.* from segment s, port p, coupon c where c.id = ?1 and c.segment_id=s.id and s.arr_port = p.code",nativeQuery=true)
	Port findByArrPortByCouponId(int id);
	
}
