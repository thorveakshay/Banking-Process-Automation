/**
 * 
 */
package com.training.services;

import java.sql.SQLException;

import com.training.dao.ViewAccountDetailDao;
import com.training.dao.ViewAccountDetailDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountView;
import com.training.model.BusinessCustomer;

/**
 *  
 *
 */
public class ViewAccountDetailService {
	public AccountView getAccountDetail(long accno) throws SQLException, ClassNotFoundException {
		// logger.info("in services");

		ViewAccountDetailDao adao = new ViewAccountDetailDaoImpl();
		AccountView av = new AccountView();
		av = adao.getAccountDetail(accno);
		return av;

	}

	public BusinessCustomer getBusinessCustomer(long accNum) throws CommercialCustandAcctMaintenance {
		BusinessCustomer bcust = new BusinessCustomer();
		ViewAccountDetailDao adao = new ViewAccountDetailDaoImpl();
		bcust = adao.getBusinessCustomer(accNum);
		return bcust;
	}
}
