package com.tam.dao;

import com.tam.model.Auction;

public interface IAuctionDoa {

	public Auction get(Integer id);

	public void add(Auction auction);

	public void update(Auction auction);

}