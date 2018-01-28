package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Business;
import com.training.model.Product;
import com.training.utils.ConnectionUtil;

public interface SwitchProductDao {

	public Account getAccount(String accno) throws CommercialCustandAcctMaintenance;

	public Product getProductDao(String accno) throws CommercialCustandAcctMaintenance;

	public Business getBusinessDao(String acc) throws CommercialCustandAcctMaintenance;

	public Boolean switchProduct(Long accid, Long busid, String acctype, Long ano, Long newProductID)
			throws CommercialCustandAcctMaintenance;

	public ArrayList<Product> getListProduct(String accno, long bid, String accType)
			throws CommercialCustandAcctMaintenance;

}