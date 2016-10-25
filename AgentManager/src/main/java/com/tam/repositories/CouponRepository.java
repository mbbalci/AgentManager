package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.tam.model.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Integer>{

}
