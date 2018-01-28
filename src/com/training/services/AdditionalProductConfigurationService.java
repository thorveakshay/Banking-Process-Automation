/**
 * 
 */
package com.training.services;

import java.util.ArrayList;

import com.training.dao.AdditionalProductDao;
import com.training.dao.AdditionalProductDaoInterface;
import com.training.exception.AssignRelationshipManagerException;
import com.training.model.AdditionalProduct;

/**
 *  
 *
 */
public class AdditionalProductConfigurationService {

	private AdditionalProductDaoInterface apdao = new AdditionalProductDao();

	public ArrayList<AdditionalProduct> getAdditionalProductDetails(int productid)
			throws AssignRelationshipManagerException {
		return apdao.getAdditionalProductDetails(productid);
	}

}
