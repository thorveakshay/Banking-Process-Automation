package com.training.services;

import com.training.dao.VerifyCustomerDao;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;

import java.sql.SQLException;
import java.util.ArrayList;

public class VerifyCustomerService {

	public ArrayList<Account> get_account_list(Long Busid) throws CommercialCustandAcctMaintenance

	{
		VerifyCustomerDao vdao = new VerifyCustomerDao();
		return vdao.get_account_list(Busid);

	}

	public boolean VerifyAccountParty(String businessName, String branchName, String apName, int accpId)
			throws CommercialCustandAcctMaintenance {
		VerifyCustomerDao vdao = new VerifyCustomerDao();
		boolean flag = false;
		flag = vdao.verifyCustomer(businessName, branchName, apName, accpId);
		return flag;
	}

	public ArrayList<String> getQuestion(Long apid) throws CommercialCustandAcctMaintenance {
		VerifyCustomerDao vdao = new VerifyCustomerDao();
		return vdao.getQuestion(apid);
	}

	public ArrayList<String> getAnswer(Long apid) throws CommercialCustandAcctMaintenance {
		VerifyCustomerDao vdao = new VerifyCustomerDao();
		return vdao.getAnswer(apid);
	}

	public ArrayList<String> getSecurityQuestionAnswer(Long apid) throws CommercialCustandAcctMaintenance {
		VerifyCustomerDao vdao = new VerifyCustomerDao();
		return vdao.getSecurityQuestionAnswer(apid);
	}
}