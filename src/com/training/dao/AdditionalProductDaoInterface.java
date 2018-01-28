/**
 * 
 */
package com.training.dao;

import java.util.ArrayList;

import com.training.exception.AssignRelationshipManagerException;
import com.training.model.AdditionalProduct;

/**
 *  
 *
 */
public interface AdditionalProductDaoInterface {
	public ArrayList<AdditionalProduct> getAdditionalProductDetails(int productid)
			throws AssignRelationshipManagerException;
}
