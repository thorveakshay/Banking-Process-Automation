package com.training.services;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.dao.TicketDao;
import com.training.dao.TicketDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Ticket;

public class CreateTicketService {
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	TicketDao tDao = new TicketDaoImpl();

	Ticket tkt = new Ticket();
	boolean flag = false;

	public Long createTicket(Ticket t) throws CommercialCustandAcctMaintenance {
		return tDao.createTicket(t);

	}

	public Ticket getTicket(long accId, long busid) throws CommercialCustandAcctMaintenance {
		tkt = tDao.getTicket(accId, busid);
		logger.info("rtg" + flag);
		return tkt;
	}

	public boolean updateTicket(long tktid, String status) throws CommercialCustandAcctMaintenance {
		flag = tDao.updateTicket(tktid, status);
		return flag;
	}

}
