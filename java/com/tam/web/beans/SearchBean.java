package com.tam.web.beans;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import org.primefaces.component.datatable.DataTable;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tam.model.ContactInfo;
import com.tam.model.Coupon;
import com.tam.model.Pax;
import com.tam.model.Pnr;
import com.tam.model.Port;
import com.tam.model.Segment;
import com.tam.model.Ticket;
import com.tam.service.PortService;
import com.tam.service.SearchService;
import com.tam.service.TicketService;
import com.tam.web.util.FacesUtil;

@Component
@ManagedBean
@ViewScoped
public class SearchBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Autowired
	@ManagedProperty("#{ticketService}")
	TicketService ticketService;

	@Autowired
	@ManagedProperty("#{portService}")
	PortService portService;

	@Autowired
	@ManagedProperty("#{searchService}")
	SearchService searchService;

	@Autowired
	@ManagedProperty("#{ticketBean}")
	TicketBean ticketBean;

	public Pnr pnr = new Pnr();
	public Segment segment = new Segment();
	public Date date = new Date();
	public Date date1 = new Date();
	public Date date2 = new Date();
	public Date date3 = new Date();
	public Pax pax = new Pax();
	public List<Pax> paxes = new ArrayList<Pax>();
	public List<Segment> segments = new ArrayList<Segment>();
	public Port port1 = new Port();
	public Port port2 = new Port();
	private List<String> portNames = new ArrayList<String>();
	private List<String> portCodes = new ArrayList<String>();
	private boolean searchPaxByPnrB, searchPaxesBetweenDatesB, searchPaxesByDepPortAndArrPortAndDepDateB;

	private int index;

	@PostConstruct
	public void postConstruct() {
		port1 = new Port();
		port2 = new Port();
		date = new Date();
		port1.setName("");
		port2.setName("");
		segment = new Segment();
		pax = new Pax();
		segment.setPortByArrPort(port1);
		segment.setPortByDepPort(port2);
		segment.setDepDate(date);
		paxes = new ArrayList<Pax>();
		segments = new ArrayList<Segment>();
		searchPaxByPnrB = false;
		searchPaxesBetweenDatesB = false;
		searchPaxesByDepPortAndArrPortAndDepDateB = false;
	}

	@Transactional
	public void searchFlight() {
		System.out.println(segment.getAaCode());
		segment = searchService.searchFlight(segment.getAaCode(), segment.getFltNo());
		System.out.println(segment.getPortByArrPort().getName());
	}

	@Transactional
	public List<Pax> searchPaxByPnr() {
		paxes = searchService.searchPaxByPnr(pnr.getPnrNo());
		for (Pax pax : paxes) {
			pax.getContactInfo().getEmail();
			pax.getPnr().getPnrNo();
		}
		System.out.println(paxes.size());
		if (paxes.size() != 0)
			searchPaxByPnrB = true;
		else
			searchPaxByPnrB = false;
		return paxes;
	}

	@Transactional
	public List<Segment> searchSegmentByDate() {
		segments = searchService.searchSegmentByDate(segment.getDepDate());
		for (Segment seg : segments) {
			seg.getPortByArrPort().getName();
			seg.getPortByDepPort().getName();
		}
		return segments;
	}

	@Transactional
	public List<Segment> searchSegmentBetweenDates() {
		segments = searchService.searchSegmentBetweenDates(date1, date2);
		for (Segment seg : segments) {
			seg.getPortByArrPort().getName();
			seg.getPortByDepPort().getName();
		}
		return segments;
	}

	@Transactional
	public List<Pax> searchPaxesBetweenDates() {
		paxes = searchService.searchPaxesBetweenDates(date1, date2);
		for (Pax p : paxes)
			System.out.println(p.getName() + "  " + p.getSurname());
		System.out.println(paxes.size());
		if (paxes.size() != 0)
			searchPaxesBetweenDatesB = true;
		else
			searchPaxesBetweenDatesB = false;
		return paxes;
	}

	@Transactional
	public List<Pax> searchPaxesByDepPortAndArrPortAndDepDate() {
		paxes = searchService.searchPaxesByDepPortAndArrPortAndDepDate(port1, port2, date3);
		for (Pax p : paxes)
			p.getName();
		System.out.println(paxes.size());
		if (paxes.size() != 0)
			searchPaxesByDepPortAndArrPortAndDepDateB = true;
		else
			searchPaxesByDepPortAndArrPortAndDepDateB = false;
		return paxes;
	}

	public int getSelectedRowIndex(int index) {
		this.index = index;
		return this.index;
	}

	public void onRowSelect(SelectEvent event) throws IOException {

		ticketBean.setPaxList(new ArrayList<Pax>());
		ticketBean.setContactInfo(new ContactInfo());
		ticketBean.setPnr(new Pnr());
		ticketBean.setTicketList(new ArrayList<Ticket>());
		ticketBean.setSegmentList(new ArrayList<Segment>());
		ticketBean.getPaxList().add(paxes.get(index));
		ticketBean.setContactInfo(searchService.findContactInfo(paxes.get(index)));
		ticketBean.setPnr(searchService.findPnr(paxes.get(index)));
		ticketBean.setTicketList(searchService.findTicketByPnr(paxes.get(index).getPnr()));
		for (Ticket t : searchService.findTicketByPnr(paxes.get(index).getPnr())) {
			for (Coupon c : searchService.findCouponByTicket(t)) {
				Segment s = searchService.findSegmentByCoupon(c);
				s.setPortByArrPort(searchService.findArrPortByCoupon(c));
				s.setPortByDepPort(searchService.findDepPortByCoupon(c));
				ticketBean.getSegmentList().add(s);
			}
		}

		FacesContext.getCurrentInstance().getExternalContext().redirect("ucakBilet.jsf?");

	}

	public List<String> getPortCodes() {
		portCodes = portService.listPortCodes();
		return portCodes;

	}

	public void onRowUnselect(UnselectEvent event) {

		FacesMessage msg = new FacesMessage("Pax Unselected");
		FacesContext.getCurrentInstance().addMessage(null, msg);
	}

	public void setPortCodes(List<String> portCodes) {
		this.portCodes = portCodes;
	}

	public void setPortNames(List<String> portNames) {
		this.portNames = portNames;
	}

	public List<String> getPortNames() {
		portNames = portService.listPortNames();
		return portNames;
	}

	public List<String> complete(String query) {
		List<String> portList = getPortNames();
		List<String> codeList = getPortCodes();
		List<String> completeList = new ArrayList<String>();

		for (int i = 0; i < portList.size(); i++) {
			if (portList.get(i).toLowerCase().contains(query.toLowerCase())) {
				completeList.add(portList.get(i));
			}
		}
		Collections.sort(completeList, new Comparator<String>() {
			public int compare(String s1, String s2) {
				return s1.compareToIgnoreCase(s2);
			}
		});
		return completeList;
	}

	public Pnr getPnr() {
		return pnr;
	}

	public void setPnr(Pnr pnr) {
		this.pnr = pnr;
	}

	public Pax getPax() {
		return pax;
	}

	public void setPax(Pax pax) {
		this.pax = pax;
	}

	public List<Pax> getPaxes() {
		return paxes;
	}

	public void setPaxes(List<Pax> paxes) {
		this.paxes = paxes;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public Port getPort1() {
		return port1;
	}

	public void setPort1(Port port) {
		this.port1 = port;
	}

	public Port getPort2() {
		return port2;
	}

	public void setPort2(Port port) {
		this.port2 = port;
	}

	public List<Segment> getSegments() {
		return segments;
	}

	public void setSegments(List<Segment> segments) {
		this.segments = segments;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public List<Segment> getSegmetns() {
		return segments;
	}

	public void setSegmetns(List<Segment> segments) {
		this.segments = segments;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public Segment getSegment() {
		return segment;
	}

	public void setSegment(Segment segment) {
		this.segment = segment;
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

	public Date getDate3() {
		return date3;
	}

	public void setDate3(Date date3) {
		this.date3 = date3;
	}

	public boolean isSearchPaxByPnrB() {
		return searchPaxByPnrB;
	}

	public void setSearchPaxByPnrB(boolean searchPaxByPnrB) {
		this.searchPaxByPnrB = searchPaxByPnrB;
	}

	public boolean isSearchPaxesBetweenDatesB() {
		return searchPaxesBetweenDatesB;
	}

	public void setSearchPaxesBetweenDatesB(boolean searchPaxesBetweenDatesB) {
		this.searchPaxesBetweenDatesB = searchPaxesBetweenDatesB;
	}

	public boolean isSearchPaxesByDepPortAndArrPortAndDepDateB() {
		return searchPaxesByDepPortAndArrPortAndDepDateB;
	}

	public void setSearchPaxesByDepPortAndArrPortAndDepDateB(boolean searchPaxesByDepPortAndArrPortAndDepDateB) {
		this.searchPaxesByDepPortAndArrPortAndDepDateB = searchPaxesByDepPortAndArrPortAndDepDateB;
	}

	public TicketBean getTicketBean() {
		return ticketBean;
	}

	public void setTicketBean(TicketBean ticketBean) {
		this.ticketBean = ticketBean;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

}
