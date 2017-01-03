package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.model.Port;
import com.tam.repositories.PortRepository;

@Service("portService")
public class PortService {
	@Autowired
	private PortRepository portRepo;
	
	public List<Port> listPorts(){
		 return portRepo.findAll();
		
	}

	public PortRepository getPortRepo() {
		return portRepo;
	}
	
	public void setPortRepo(PortRepository portRepo) {
		this.portRepo = portRepo;
	}
}
