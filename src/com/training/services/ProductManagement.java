
//CAO+nbg
/**
 * 
 */
package com.training.services;

import java.util.List;

import com.training.dao.ProductDao;
import com.training.dao.ProductDaoInterface;
import com.training.exception.ProductManagementException;
import com.training.model.AdditionalProduct;
import com.training.model.BusinessType;
import com.training.model.Product;

/**
 *  
 *
 */
public class ProductManagement {

	private ProductDaoInterface pDao = new ProductDao();

	public boolean addProduct(Product Product) throws ProductManagementException {
		return pDao.addProduct(Product);
	}

	public List<BusinessType> viewBusinessType() throws ProductManagementException {
		return pDao.viewBusinessType();
	}

	public List<AdditionalProduct> viewAdditionalProduct() throws ProductManagementException {
		return pDao.viewAdditionalProduct();
	}

	public List<Product> viewProduct() throws ProductManagementException {
		return pDao.viewProduct();
	}

	public Product searchByProductId(int productId) throws ProductManagementException {
		return pDao.searchByProductId(productId);
	}
	/*
	 * public List<Product> searchByProductName(String pName) throws
	 * ProductManagementException {
	 * 
	 * return pDao.searchByProductName(pName); }
	 * 
	 */

	public boolean deleteProduct(int id) throws ProductManagementException {
		return pDao.deleteProduct(id);

	}

	public boolean updateProduct(Product Product) throws ProductManagementException {
		return pDao.updateProduct(Product);

	}

	public boolean uploadProduct(List<Product> pList) throws ProductManagementException {
		return pDao.uploadProduct(pList);

	}

	public boolean validateProductId(int productId) throws ProductManagementException {
		return pDao.validateProductIdDao(productId);

	}

}
