package com.tam.model;

// Generated Apr 26, 2015 5:10:28 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * TourRestorantId generated by hbm2java
 */
@Embeddable
public class TourRestorantId implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private int tourId;
	private int restorantId;

	public TourRestorantId() {
	}

	public TourRestorantId(int tourId, int restorantId) {
		this.tourId = tourId;
		this.restorantId = restorantId;
	}

	@Column(name = "tour_id", nullable = false)
	public int getTourId() {
		return this.tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	@Column(name = "restorant_id", nullable = false)
	public int getRestorantId() {
		return this.restorantId;
	}

	public void setRestorantId(int restorantId) {
		this.restorantId = restorantId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TourRestorantId))
			return false;
		TourRestorantId castOther = (TourRestorantId) other;

		return (this.getTourId() == castOther.getTourId())
				&& (this.getRestorantId() == castOther.getRestorantId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getTourId();
		result = 37 * result + this.getRestorantId();
		return result;
	}

}
