package com.tam.web.beans;


import com.tam.model.ContactInfo;
import com.tam.model.Coupon;
import com.tam.model.Pax;
import com.tam.model.Pnr;
import com.tam.model.Segment;
import com.tam.model.Ticket;
import com.tam.model.User;

public class Item {
	
	public User user=new User();
    public Pax pax= new Pax();
    public Ticket ticket = new Ticket();
    public Pnr pnr1 = new Pnr();
	public ContactInfo contactinfo=new ContactInfo();
    public Coupon coupon=new Coupon();
    public Segment segment=new Segment();

    
   
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

	
    public String toString() {
        return String.format("Item[value=%s],Item[value=%s]", pax.getName(),pax.getSurname());
    }
    public Pnr getPnr() {
		return pnr1;
	}

	public void setPnr(Pnr pnr) {
		this.pnr1 = pnr;
	}

	public ContactInfo getContactinfo() {
		return contactinfo;
	}

	public void setContactinfo(ContactInfo contactinfo) {
		this.contactinfo = contactinfo;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public Segment getSegment() {
		return segment;
	}

	public void setSegment(Segment segment) {
		this.segment = segment;
	}
	




}