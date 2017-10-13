package com.tam.service;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tam.model.ContactInfo;
import com.tam.model.Coupon;
import com.tam.model.Pax;
import com.tam.model.PaymentType;
import com.tam.model.Pnr;
import com.tam.model.Segment;
import com.tam.model.Ticket;
import com.tam.model.User;
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
	@Autowired
	private ContactInfoRepository contactInfoRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PaymentTypeRepository paymentTypeRepository;
	@Autowired
	private PortRepository portRepository;

	@Transactional
	public void saveContact(ContactInfo contactInfo) {
		contactInfoRepository.save(contactInfo);
	}

	@Transactional
	public void saveSegment(Segment segment) {
		System.out.println(segment.getPortByDepPort().getName() + " + " + segment.getPortByArrPort().getName());

		segment.setPortByDepPort(portRepository.findPortByName(
				segment.getPortByDepPort().getName().substring(0, segment.getPortByDepPort().getName().length() - 6)));
		segment.setPortByArrPort(portRepository.findPortByName(
				segment.getPortByArrPort().getName().substring(0, segment.getPortByArrPort().getName().length() - 6)));
		segment.setAaCode(segment.getAaCode().toUpperCase());
		if (segmentRepository.findSegmentByAaCodeAndFltNo(segment.getAaCode(), segment.getFltNo()) != null)
			return;
		Date dt = new Date();
		segment.setRecordDate(dt);
		segmentRepository.save(segment);
		segment = new Segment();
	}

	@Transactional
	public void savePnr(Pnr pnr) {
		pnr.setUser(userRepository.findOne(1));
		Date dt = new Date();

		pnr.setRecordDate(dt);
		pnrRepository.save(pnr);
		pnr = new Pnr();
	}

	@Transactional
	public void savePax(Pax pax, ContactInfo contactInfo, Pnr pnr) {
		pax.setPnr(pnr);
		pax.setContactInfo(contactInfo);
		pax.setCompany(pax.getCompany().toUpperCase());
		pax.setName(pax.getName().toUpperCase());
		pax.setPassportNo(pax.getPassportNo().toUpperCase());
		pax.setSurname(pax.getSurname().toUpperCase());
		Date dt = new Date();
		pax.setRecordDate(dt);
		paxRepository.save(pax);
	}

	@Transactional
	public void saveTicket(Ticket ticket, Pnr pnr, Pax pax, List<Segment> segments) {
		Date dt = new Date();
		Ticket tc = ticket;
		// Create a coupons set
		Set<Coupon> coupons = new HashSet<Coupon>();

		// Create coupons for each segment in list
		for (Segment segment : segments) {
			if (segment != null) {
				Coupon coupon = new Coupon();
				coupon.setSegment(segment);
				coupon.setRecordDate(dt);
				coupon.setTicket(tc);
				couponRepository.save(coupon);
				coupons.add(coupon);
				coupon = new Coupon();
			}
		}
		ticket.setSellingCurrency(ticket.getBuyingCurrency());
		ticket.setPnr(pnr);
		ticket.setUser(userRepository.findOne(1));
		ticket.setPax(pax);
		ticket.setCoupons(coupons);
		System.out.println(ticket.getTktNo());
		System.out.println(ticket.getBuyingAmount());
		System.out.println(ticket.getSellingAmount());
		System.out.println(ticket.getDos());
		System.out.println(ticket.getStatus());
		System.out.println(ticket.getSellingCurrency());
		System.out.println(ticket.getBuyingCurrency());

		ticketRepository.save(ticket);
		System.out.println("Ticket saved!");
	}

	@Transactional
	public List<PaymentType> getTypes() {
		return paymentTypeRepository.findAll();
	}

	public PaymentTypeRepository getPaymentTypeRepository() {
		return paymentTypeRepository;
	}

	public void setPaymentTypeRepository(PaymentTypeRepository paymentTypeRepository) {
		this.paymentTypeRepository = paymentTypeRepository;
	}

	public UserRepository getUserRepository() {
		return userRepository;
	}

	public void setUserRepository(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public TicketRepository getTicketRepository() {
		return ticketRepository;
	}

	public void setTicketRepository(TicketRepository ticketRepository) {
		this.ticketRepository = ticketRepository;
	}

	public ContactInfoRepository getContactInfoRepository() {
		return contactInfoRepository;
	}

	public void setContactInfoRepository(ContactInfoRepository contactInfoRepository) {
		this.contactInfoRepository = contactInfoRepository;
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

	public PortRepository getPortRepository() {
		return portRepository;
	}

	public void setPortRepository(PortRepository portRepository) {
		this.portRepository = portRepository;
	}
}
