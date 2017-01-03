package com.tam.web.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.model.ContactInfo;
import com.tam.model.Coupon;
import com.tam.model.Pax;
import com.tam.model.PaymentType;
import com.tam.model.Pnr;
import com.tam.model.Port;
import com.tam.model.Ticket;
import com.tam.model.User;
import com.tam.service.PortService;
import com.tam.web.util.FacesUtil;

@ManagedBean
@ViewScoped
public class TicketBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@ManagedProperty("#{sessionBean}")
    private SessionBean sessionBean;

	@Autowired
	@ManagedProperty("#{portService}")
	private PortService portService;
	
	private List<Item> items;
	
	public User user=new User();
	public Pnr pnr=new Pnr();
	public Pax pax=new Pax();
	public ContactInfo contactinfo=new ContactInfo();
	public Ticket ticket=new Ticket();
	public PaymentType payment=new PaymentType();
	public Coupon coupon = new Coupon();
	public Port port=new Port();
	List<Port> portList;
	List<Ticket> ticketList = new ArrayList<Ticket>();
	List<Pax> paxList = new ArrayList<Pax>();
	List<Pnr> pnrList = new ArrayList<Pnr>();
	List<ContactInfo> contacinfoList = new ArrayList<ContactInfo>();
	
	public TicketBean(){
		
	}
	@PostConstruct
	private void postConstruct(){
		 items = new ArrayList<Item>();
	        add();
		portList=portService.listPorts();
		if(!isUserLoggedIn()){
			FacesUtil.redirectToPage("Login.xhtml");
		}
	}

	private boolean isUserLoggedIn(){
		//sessionBean =FacesUtil.getSessionBeanFromSession();
		if (sessionBean==null|| sessionBean.getUser() == null)
			return false;
		else
			return true;
	}
	public void saveTicket()
	{
		user=sessionBean.getUser();
		Date date= new Date();
		payment.setCode("5");
		pnr.setUser(user);
		pnr.setStatus("OK");
		pnr.setRecordDate(date);
		pax.setPnr(pnr);
		ticket.setUser(user);
		ticket.setStatus("OK");
		ticket.setBuyingCurrency("TL");
		ticket.setSellingCurrency("TL");
		ticket.setPax(pax);
		ticket.setPaymentType(payment);
		paxList.add(getPax());
		pnrList.add(getPnr());
		contacinfoList.add(getContactinfo());
		ticketList.add(getTicket());
		System.out.println(ticketList.toString());
		refreshObjects();
	}
	
	public List<Port> getPort()
	{
		portList=portService.listPorts();
		 return portList;
	}
	public void refreshObjects()
	{
		 user=new User();
		 pnr=new Pnr();
		 pax=new Pax();
		 contactinfo=new ContactInfo();
		 ticket=new Ticket();
		 payment=new PaymentType();
	}
	public List<Port> getPortList() {
		return portList;
	}
	public void setPortList(List<Port> portlist) {
		this.portList = portlist;
	}
	public SessionBean getSessionBean() {
		return sessionBean;
	}
	public void setSessionBean(SessionBean sessionBean) {
		this.sessionBean = sessionBean;
	}
	public Ticket getTicket() {
		return ticket;
	}
	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

	public Pax getPax() {
		return pax;
	}
	public void setPax(Pax pax) {
		this.pax = pax;
	}
	public ContactInfo getContactinfo() {
		return contactinfo;
	}
	public void setContactinfo(ContactInfo contactinfo) {
		this.contactinfo = contactinfo;
	}
	public Pnr getPnr() {
		return pnr;
	}
	public void setPnr(Pnr pnr) {
		this.pnr = pnr;
	}
	public List<Ticket> getTicketList() {
		return ticketList;
	}
	public void setTicketList(List<Ticket> ticketList) {
		this.ticketList = ticketList;
	}

	public PortService getPortService() {
		return portService;
	}
	public void setPortService(PortService portService) {
		this.portService = portService;
	}
    public void add() {
    	
        items.add(new Item());
    }

    public void remove(Item item) {
        items.remove(item);
    }
    public List<Item> getItems() {
        return items;
    }
	
}
