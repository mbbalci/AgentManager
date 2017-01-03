package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tam.model.Coupon;
import com.tam.model.Pax;
import com.tam.model.Pnr;
import com.tam.model.Segment;
import com.tam.model.Ticket;
import com.tam.repositories.CouponRepository;
import com.tam.repositories.PaxRepository;
import com.tam.repositories.PnrRepository;
import com.tam.repositories.SegmentRepository;
import com.tam.repositories.TicketRepository;

@Service
public class TicketService {

	@Autowired
	private TicketRepository ticketRepository;
	@Autowired 
	private PaxRepository paxRepository;
	@Autowired 
	private PnrRepository pnrRepository;
	@Autowired
	private SegmentRepository segmentRepository;
	@Autowired
	private CouponRepository couponRepository;
	
	@Transactional
	public void saveTicket (List<Ticket> ticket,List<Pax> pax, Pnr pnr,Segment segment,Coupon coupon)
	{
		
		ticketRepository.save(ticket);
		paxRepository.save(pax);
		pnrRepository.save(pnr);
		segmentRepository.save(segment);
		couponRepository.save(coupon);
		
	}
	
	public TicketRepository getTicketRepository() {
		return ticketRepository;
	}
	public void setTicketRepository(TicketRepository ticketRepository) {
		this.ticketRepository = ticketRepository;
	}
	public PaxRepository getPaxRepository() {
		return paxRepository;
	}
	public void setPaxRepository(PaxRepository paxRepository) {
		this.paxRepository = paxRepository;
	}
	public PnrRepository getPnrRepository() {
		return pnrRepository;
	}
	public void setPnrRepository(PnrRepository pnrRepository) {
		this.pnrRepository = pnrRepository;
	}
	public SegmentRepository getSegmentRepository() {
		return segmentRepository;
	}
	public void setSegmentRepository(SegmentRepository segmentRepository) {
		this.segmentRepository = segmentRepository;
	}
	public CouponRepository getCouponRepository() {
		return couponRepository;
	}
	public void setCouponRepository(CouponRepository couponRepository) {
		this.couponRepository = couponRepository;
	}
	
	
}
