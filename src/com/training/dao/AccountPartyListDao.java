/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.model.AccountParty;
import com.training.model.BusinessCustomer;
import com.training.services.AccountPartyListService;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public interface AccountPartyListDao {

	public ArrayList<AccountParty> getAccountPartyList(String branchName, String businessName)
			throws ClassNotFoundException, SQLException;

}
