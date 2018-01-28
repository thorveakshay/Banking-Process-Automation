package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.model.*;
import com.training.utils.ConnectionUtil;

public interface UnresolvedTicketsDao {

	ArrayList<Ticket> ticketList = new ArrayList<Ticket>();

	public ArrayList<Ticket> getUnresolvedTickets(Long uid) throws SQLException, ClassNotFoundException;

	public ArrayList<Ticket> getUnresolvedCATTickets(Long uid) throws SQLException, ClassNotFoundException;

	public ArrayList<Ticket> getUnassignedTickets() throws SQLException, ClassNotFoundException;

	public ArrayList<Ticket> getTicketsAssignedByAdmin(Long uid) throws ClassNotFoundException, SQLException;

}
