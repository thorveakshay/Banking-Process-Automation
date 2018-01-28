package com.training.services;

import java.util.ArrayList;
import java.util.List;

import com.training.dao.AccountPartyDAO;
import com.training.dao.AccountPartyDAOImpl;
import com.training.exception.AccountPartyException;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountParty;

public class AccountPartyManagementService {
	// for module c
	public List<AccountParty> searchByBusinessID(Long npid)
			throws CommercialCustandAcctMaintenance, AccountPartyException {
		AccountPartyDAO apd = new AccountPartyDAOImpl();
		List<AccountParty> list = new ArrayList<AccountParty>();
		List<AccountParty> newlist = new ArrayList<AccountParty>();
		list = apd.viewAccountParty(npid);

		for (AccountParty ap : list) {
			if (ap.getNpid().equals(npid)) {
				newlist.add(ap);
			}
		}
		return newlist;

	}

	public boolean addQuestion(long partyId, String question, String answer) throws CommercialCustandAcctMaintenance {
		AccountPartyDAO apd = new AccountPartyDAOImpl();
		boolean flag = apd.addQuestionDao(partyId, question, answer);
		return flag;

	}

	// for module a
	public List<AccountParty> searchByName(String name, Long npid) throws AccountPartyException {
		AccountPartyDAO apd = new AccountPartyDAOImpl();
		List<AccountParty> list = new ArrayList<AccountParty>();
		List<AccountParty> newlist = new ArrayList<AccountParty>();

		list = apd.viewAccountParty(npid);

		for (AccountParty ap : list) {
			String fullname = ap.getTitle() + " " + ap.getFname() + " " + ap.getMname() + " " + ap.getLname();
			if (fullname.toLowerCase().contains(name.toLowerCase())) {
				newlist.add(ap);
			}
		}

		return newlist;

	}

	public List<AccountParty> searchByRelationship(String relationship, Long npid) throws AccountPartyException {
		AccountPartyDAO apd = new AccountPartyDAOImpl();
		List<AccountParty> list = new ArrayList<AccountParty>();
		List<AccountParty> newlist = new ArrayList<AccountParty>();

		list = apd.viewAccountParty(npid);

		for (AccountParty ap : list) {

			if (ap.getRelationship().equals(relationship)) {
				newlist.add(ap);
			}

		}
		return newlist;

	}

}
