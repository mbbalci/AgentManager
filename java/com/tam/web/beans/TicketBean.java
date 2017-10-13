package com.tam.web.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.tam.model.ContactInfo;
import com.tam.model.Pax;
import com.tam.model.PaymentType;
import com.tam.model.Pnr;
import com.tam.model.Port;
import com.tam.model.Segment;
import com.tam.model.Ticket;
import com.tam.service.PortService;
import com.tam.service.TicketService;

@Component
@ManagedBean
@RequestScoped
public class TicketBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Autowired
	@ManagedProperty("#{ticketService}")
	TicketService ticketService;

	@Autowired
	@ManagedProperty("#{portService}")
	PortService portService;

	public Port port = new Port();
	List<Port> portList;
	public Segment segment = new Segment();
	private List<Segment> segmentList = new ArrayList<Segment>();
	public Ticket ticket = new Ticket();
	private List<Ticket> ticketList = new ArrayList<Ticket>();
	public Pax pax = new Pax();
	public List<Pax> paxList = new ArrayList<Pax>();
	public Pnr pnr = new Pnr();
	private List<Pnr> pnrList = new ArrayList<Pnr>();
	public ContactInfo contactInfo = new ContactInfo();
	private List<ContactInfo> contactInfoList = new ArrayList<ContactInfo>();
	private PaymentType paymentType = new PaymentType();
	private List<PaymentType> paymentTypes = new ArrayList<PaymentType>();
	private List<String> portNames = new ArrayList<String>();
	private List<String> portCodes = new ArrayList<String>();

	@PostConstruct
	public void postConstruct() {
		contactInfo = new ContactInfo();
		segment = new Segment();
		ticket = new Ticket();
		paymentTypes = ticketService.getTypes();
		PaymentTypes();
		pax = new Pax();
		paxList = new ArrayList<Pax>();
		ticketList = new ArrayList<Ticket>();

	}

	// PAYMENT TYPE OLAYI HALLEDİLECEK
	public void PaymentTypes() {
		paymentTypes = ticketService.getTypes();
		for (PaymentType pt : paymentTypes) {
			pt.getCode();
			pt.getExplanation();
		}
	}

	@Transactional
	public void saveContactInfo() {
		System.out.println(contactInfo.getMobile());
		ticketService.saveContact(contactInfo);
	}

	@Transactional
	public void saveSegment() {
		segmentList.add(segment);
		System.out.println(segmentList.size());
		ticketService.saveSegment(segment);
		segment = new Segment();
	}

	@Transactional
	public void savePnr() {
		System.out.println(pnr.getPnrNo());
		ticketService.savePnr(pnr);
	}

	@Transactional
	public void savePax() {
		paxList.add(pax);
		ticketService.savePax(pax, contactInfo, pnr);
		pax = new Pax();
	}

	@Transactional
	public void saveTicket() {
		ticketList.add(ticket);
		ticketService.saveTicket(ticket, pnr, paxList.get(paxList.size() - 1), segmentList);
		ticket = new Ticket();
	}

	public void getParametersFromSearchPage(SearchBean searchBean) {

	}

	public List<String> getPortNames() {
		portNames = portService.listPortNames();
		return portNames;
	}

	public List<String> getPortCodes() {
		portCodes = portService.listPortCodes();
		return portCodes;

	}

	public void setPortCodes(List<String> portCodes) {
		this.portCodes = portCodes;
	}

	public void setPortNames(List<String> portNames) {
		this.portNames = portNames;
	}

	public List<String> complete(String query) {
		List<String> portList = getPortNames();
		List<String> codeList = getPortCodes();
		List<String> completeList = new ArrayList<String>();

		for (int i = 0; i < portList.size(); i++) {
			if (portList.get(i).toLowerCase().contains(query.toLowerCase())) {
				completeList.add(portList.get(i) + " (" + codeList.get(i) + ")");
			}
		}
		Collections.sort(completeList, new Comparator<String>() {
			public int compare(String s1, String s2) {
				return s1.compareToIgnoreCase(s2);
			}
		});
		return completeList;
	}

	public TicketService getTicketService() {
		return ticketService;
	}

	public void setTicketService(TicketService ticketService) {
		this.ticketService = ticketService;
	}

	public PortService getPortService() {
		return portService;
	}

	public void setPortService(PortService portService) {
		this.portService = portService;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public void setPaymentTypes(List<PaymentType> paymentTypes) {
		this.paymentTypes = paymentTypes;
	}

	public List<PaymentType> getPaymentTypes() {
		return paymentTypes;
	}

	public TicketBean() {

	}

	public List<Port> getPort() {
		portList = portService.listPorts();
		return portList;
	}

	public void setPort(Port port) {
		this.port = port;
	}

	public List<Port> getPortList() {
		return portList;
	}

	public void setPortList(List<Port> portList) {
		this.portList = portList;
	}

	public Segment getSegment() {
		return segment;
	}

	public void setSegment(Segment segment) {
		this.segment = segment;
	}

	public List<Segment> getSegmentList() {
		return segmentList;
	}

	public void setSegmentList(List<Segment> segmentList) {
		this.segmentList = segmentList;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

	public List<Ticket> getTicketList() {
		return ticketList;
	}

	public void setTicketList(List<Ticket> ticketList) {
		this.ticketList = ticketList;
	}

	public Pax getPax() {
		return pax;
	}

	public void setPax(Pax pax) {
		this.pax = pax;
	}

	public List<Pax> getPaxList() {
		return paxList;
	}

	public void setPaxList(List<Pax> paxList) {
		this.paxList = paxList;
	}

	public Pnr getPnr() {
		return pnr;
	}

	public void setPnr(Pnr pnr) {
		this.pnr = pnr;
	}

	public List<Pnr> getPnrList() {
		return pnrList;
	}

	public void setPnrList(List<Pnr> pnrList) {
		this.pnrList = pnrList;
	}

	public ContactInfo getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(ContactInfo contactInfo) {
		this.contactInfo = contactInfo;
	}

	public List<ContactInfo> getContactInfoList() {
		return contactInfoList;
	}

	public void setContactInfoList(List<ContactInfo> contactInfoList) {
		this.contactInfoList = contactInfoList;
	}

}