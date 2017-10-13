package com.tam.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tam.model.ContactInfo;
import com.tam.model.Coupon;
import com.tam.model.Pax;
import com.tam.model.Pnr;
import com.tam.model.Port;
import com.tam.model.Segment;
import com.tam.model.Ticket;
import com.tam.repositories.ContactInfoRepository;
import com.tam.repositories.CouponRepository;
import com.tam.repositories.PaxRepository;
import com.tam.repositories.PaymentTypeRepository;
import com.tam.repositories.PnrRepository;
import com.tam.repositories.PortRepository;
import com.tam.repositories.SegmentRepository;
import com.tam.repositories.TicketRepository;
import com.tam.repositories.UserRepository;

@Service
public class SearchService {

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
	@Autowired
	private ContactInfoRepository contactInfoRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PaymentTypeRepository paymentTypeRepository;
	@Autowired
	private PortRepository portRepository;

	public List<Segment> segments = new ArrayList<Segment>();

	@Transactional
	public Segment searchFlight(String aa_code, String flt_no) {
		return segmentRepository.findSegmentByAaCodeAndFltNo(aa_code, flt_no);
	}

	@Transactional
	public List<Pax> searchPaxByPnr(String pnrNo) {
		return paxRepository.findByPnr(pnrRepository.findByPnrNo(pnrNo));
	}

	@Transactional
	public List<Segment> searchSegmentByDate(Date depDate) {
		return segmentRepository.findByDepDate(depDate);
	}

	@Transactional
	public List<Segment> searchSegmentBetweenDates(Date depDate1, Date depDate2) {
		return segmentRepository.findByDepDateBetween(depDate1, depDate2);
	}

	@Transactional
	public List<Pax> searchPaxesBetweenDates(Date depDate1, Date depDate2) {
		List<Coupon> coupons = new ArrayList<Coupon>();
		List<Pax> paxes = new ArrayList<Pax>();
		for (Segment s : segmentRepository.findByDepDateBetween(depDate1, depDate2)) {
				coupons.addAll(couponRepository.findBySegment(s));
		}		
		for (Coupon c : coupons) {
			paxes.add(c.getTicket().getPax());
			System.out.println(c.getTicket().getPax().getName() + "     " + c.getTicket().getPax().getSurname());
		}
		return paxes;
	}

	

	@Transactional
	public List<Pax> searchPaxesByDepPortAndArrPortAndDepDate(Port port1, Port port2, Date date) {
		List<Coupon> coupons = couponRepository.findBySegment(segmentRepository
				.findByPortByDepPortAndPortByArrPortAndDepDate(portRepository.findPortByName(port1.getName()),
						portRepository.findPortByName(port2.getName()), date));
		List<Pax> paxes = new ArrayList<Pax>();
		for (Coupon c : coupons) {
			paxes.add(c.getTicket().getPax());
		}
		return paxes;
	}

	@Transactional
	public ContactInfo findContactInfo(Pax pax) {
		return contactInfoRepository.findById(pax.getContactInfo().getId());
	}
	
	@Transactional
	public List<Ticket> findTicketByPnr(Pnr pnr) {
		return ticketRepository.findByPnr(pnr);
	}
	@Transactional
	public List<Coupon> findCouponByTicket(Ticket ticket) {
		return couponRepository.findByTicket(ticket);
	}
	
	
	@Transactional
	public Pnr findPnr(Pax pax) {
		return pnrRepository.findById(pax.getPnr().getId());
	}
	public void setTicketRepository(TicketRepository ticketRepository) {
		this.ticketRepository = ticketRepository;
	}

	public TicketRepository getTicketRepository() {
		return ticketRepository;
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

	public ContactInfoRepository getContactInfoRepository() {
		return contactInfoRepository;
	}

	public void setContactInfoRepository(ContactInfoRepository contactInfoRepository) {
		this.contactInfoRepository = contactInfoRepository;
	}

	public UserRepository getUserRepository() {
		return userRepository;
	}

	public void setUserRepository(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public PaymentTypeRepository getPaymentTypeRepository() {
		return paymentTypeRepository;
	}

	public void setPaymentTypeRepository(PaymentTypeRepository paymentTypeRepository) {
		this.paymentTypeRepository = paymentTypeRepository;
	}

	public PortRepository getPortRepository() {
		return portRepository;
	}

	public void setPortRepository(PortRepository portRepository) {
		this.portRepository = portRepository;
	}

	public Segment findSegmentByCoupon(Coupon c) {
		return segmentRepository.findByCouponId(c.getId());
	}

	public Port findArrPortByCoupon(Coupon c) {
		return portRepository.findByArrPortByCouponId(c.getId());
	}

	public Port findDepPortByCoupon(Coupon c) {
		return portRepository.findByDepPortByCouponId(c.getId());
	}



}
