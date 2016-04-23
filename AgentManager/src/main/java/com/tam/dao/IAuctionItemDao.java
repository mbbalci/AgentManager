package com.tam.dao;

import com.tam.model.AuctionItem;

public interface IAuctionItemDao {
	
	public AuctionItem get(Integer id);
	
	public void add(AuctionItem auctionItem);
	
	public void update(AuctionItem auctionItem);

}
