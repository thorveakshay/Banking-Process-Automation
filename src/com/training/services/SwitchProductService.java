package com.training.services;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.dao.AccountDaoImpl;
import com.training.dao.SwitchProductDao;
import com.training.dao.SwitchProductDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Business;
import com.training.model.Product;

public class SwitchProductService {
	SwitchProductDao adao = new SwitchProductDaoImpl();
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public Account getAccount(String accno) throws CommercialCustandAcctMaintenance {
		// logger.info("in services");

		Account acc = new Account();
		acc = adao.getAccount(accno);

		return acc;

	}

	public Product getProduct(String acc) throws CommercialCustandAcctMaintenance {
		Product pro = new Product();
		pro = adao.getProductDao(acc);

		logger.info("in service class product " + pro.getName());
		return pro;
	}

	public Business getBusinessService(String acc) throws CommercialCustandAcctMaintenance {
		Business bus = new Business();

		bus = adao.getBusinessDao(acc);
		logger.info("in service class business === " + bus.getBusinessName());
		return bus;
	}

	public ArrayList<Product> getProductList(String acc, long bid, String accType)
			throws CommercialCustandAcctMaintenance {
		ArrayList<Product> pList = new ArrayList<Product>();

		pList = adao.getListProduct(acc, bid, accType);
		return pList;
	}

	public Boolean switchProduct(Long accid, Long busid, String acctype, Long ano, Long newProductID)
			throws CommercialCustandAcctMaintenance {
		// logger.info("hey sachin product switch service!!!!!");

		return adao.switchProduct(accid, busid, acctype, ano, newProductID);

	}

}
