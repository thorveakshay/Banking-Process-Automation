package com.training.dao;

import java.util.ArrayList;
import java.util.List;

import com.training.exception.AccountPartyException;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountParty;
import com.training.model.Branch;

public interface AccountPartyDAO {
	public Long createAccountParty(AccountParty ap) throws AccountPartyException;

	public AccountParty getAddressContactDetails(AccountParty ap, String branch, Long accNo)
			throws AccountPartyException;

	public List<AccountParty> viewAccountParty(Long npid) throws AccountPartyException;

	public ArrayList<Branch> getBranchList() throws CommercialCustandAcctMaintenance;

	public AccountParty viewAccountPartyDetails(Long id) throws AccountPartyException;

	public void updateAccountParty(AccountParty ap) throws AccountPartyException;

	public void deleteAccountParty(Long id) throws AccountPartyException;

	public boolean addQuestionDao(long partyId, String question, String answer) throws CommercialCustandAcctMaintenance;

	public void createQuestion(AccountParty ap) throws AccountPartyException;

}
