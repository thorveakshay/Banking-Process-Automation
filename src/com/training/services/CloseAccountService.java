/**
 * 
 */
package com.training.services;

import java.sql.SQLException;
import java.text.ParseException;

import com.training.dao.CloseAccountDao;
import com.training.dao.CloseAccountDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;

/**
 *  
 *
 */
public class CloseAccountService {

	CloseAccountDao closeAcccDao;
	Account account;

	public boolean closeAccount(String accNum, String accid) throws CommercialCustandAcctMaintenance {
		boolean flag = false;

		closeAcccDao = new CloseAccountDaoImpl();
		// logger.info("in service class ====:");
		try {
			try {
				flag = closeAcccDao.closeAccount(accNum, accid);
			} catch (NullPointerException e) {
				throw new CommercialCustandAcctMaintenance("Sorry, Data not present");
			} catch (ParseException e) {
				throw new CommercialCustandAcctMaintenance("Sorry, Parsing not appropriate");
			}

			// logger.info("in service class ====:"+flag);
			return flag;
		} catch (SQLException s) {
			throw new CommercialCustandAcctMaintenance("Sorry, Database not responding");
		} catch (ClassNotFoundException c) {
			throw new CommercialCustandAcctMaintenance("Sorry, Application not responding");
		}

	}

}
