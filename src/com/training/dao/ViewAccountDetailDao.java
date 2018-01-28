/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountView;
import com.training.model.BusinessCustomer;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public interface ViewAccountDetailDao {
	public AccountView getAccountDetail(long accno) throws SQLException, ClassNotFoundException;

	public BusinessCustomer getBusinessCustomer(long accNum) throws CommercialCustandAcctMaintenance;
}
