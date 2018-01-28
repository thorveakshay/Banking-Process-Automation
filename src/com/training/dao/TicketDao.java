package com.training.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Ticket;
import com.training.utils.ConnectionUtil;

public interface TicketDao {
	public Long createTicket(Ticket t) throws CommercialCustandAcctMaintenance;

	public Ticket getTicket(long accId, long busid) throws CommercialCustandAcctMaintenance;

	public boolean updateTicket(long tktid, String tktstatus) throws CommercialCustandAcctMaintenance;
}
