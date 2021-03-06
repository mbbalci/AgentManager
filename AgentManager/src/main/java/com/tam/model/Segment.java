package com.tam.model;

// Generated Apr 26, 2015 5:10:28 PM by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Segment generated by hbm2java
 */
@Entity
@Table(name = "segment", catalog = "tam", uniqueConstraints = @UniqueConstraint(columnNames = {
		"flt_no", "dep_date", "aa_code", "dep_port", "arr_port" }))
public class Segment implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Port portByArrPort;
	private Port portByDepPort;
	private String aaCode;
	private String fltNo;
	private Date depDate;
	private Date recordDate;
	private Set<Coupon> coupons = new HashSet<Coupon>(0);

	public Segment() {
	}

	public Segment(Port portByArrPort, Port portByDepPort, String aaCode,
			String fltNo, Date depDate, Date recordDate) {
		this.portByArrPort = portByArrPort;
		this.portByDepPort = portByDepPort;
		this.aaCode = aaCode;
		this.fltNo = fltNo;
		this.depDate = depDate;
		this.recordDate = recordDate;
	}

	public Segment(Port portByArrPort, Port portByDepPort, String aaCode,
			String fltNo, Date depDate, Date recordDate, Set<Coupon> coupons) {
		this.portByArrPort = portByArrPort;
		this.portByDepPort = portByDepPort;
		this.aaCode = aaCode;
		this.fltNo = fltNo;
		this.depDate = depDate;
		this.recordDate = recordDate;
		this.coupons = coupons;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "arr_port", nullable = false)
	public Port getPortByArrPort() {
		return this.portByArrPort;
	}

	public void setPortByArrPort(Port portByArrPort) {
		this.portByArrPort = portByArrPort;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dep_port", nullable = false)
	public Port getPortByDepPort() {
		return this.portByDepPort;
	}

	public void setPortByDepPort(Port portByDepPort) {
		this.portByDepPort = portByDepPort;
	}

	@Column(name = "aa_code", nullable = false, length = 3)
	public String getAaCode() {
		return this.aaCode;
	}

	public void setAaCode(String aaCode) {
		this.aaCode = aaCode;
	}

	@Column(name = "flt_no", nullable = false, length = 4)
	public String getFltNo() {
		return this.fltNo;
	}

	public void setFltNo(String fltNo) {
		this.fltNo = fltNo;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "dep_date", nullable = false, length = 19)
	public Date getDepDate() {
		return this.depDate;
	}

	public void setDepDate(Date depDate) {
		this.depDate = depDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "record_date", nullable = false, length = 19)
	public Date getRecordDate() {
		return this.recordDate;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "segment")
	public Set<Coupon> getCoupons() {
		return this.coupons;
	}

	public void setCoupons(Set<Coupon> coupons) {
		this.coupons = coupons;
	}

}
