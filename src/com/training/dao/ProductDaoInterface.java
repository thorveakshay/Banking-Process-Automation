
//NBG+CAO
/**
 * 
 */
package com.training.dao;

import java.util.List;

import com.training.exception.ProductManagementException;
import com.training.model.AdditionalProduct;
import com.training.model.BusinessType;
import com.training.model.Product;

/**
 *  
 *
 */
public interface ProductDaoInterface {

	public boolean addProduct(Product Product) throws ProductManagementException;

	public List<BusinessType> viewBusinessType() throws ProductManagementException;

	public List<AdditionalProduct> viewAdditionalProduct() throws ProductManagementException;

	public List<Product> viewProduct() throws ProductManagementException;

	// public List<Product> searchByProductName(String pName) throws
	// ProductManagementException;
	public Product searchByProductId(int productId) throws ProductManagementException;

	public boolean updateProduct(Product product) throws ProductManagementException;

	public boolean deleteProduct(int id) throws ProductManagementException;

	public boolean uploadProduct(List<Product> pList) throws ProductManagementException;

	public boolean validateProductIdDao(int productId) throws ProductManagementException;

}
