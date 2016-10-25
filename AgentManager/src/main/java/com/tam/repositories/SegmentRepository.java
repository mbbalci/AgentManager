package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.tam.model.Segment;

public interface SegmentRepository extends JpaRepository<Segment, Integer> {

}
