package com.tam.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tam.model.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, String>{

}
