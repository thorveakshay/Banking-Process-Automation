//nbg

package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.training.exception.ProductManagementException;
import com.training.model.AdditionalProduct;
import com.training.model.BusinessType;
import com.training.model.Product;
import com.training.utils.*;

public class ProductDao implements ProductDaoInterface {

	public boolean addProduct(Product product) throws ProductManagementException {
		PreparedStatement ps = null;
		Connection con = null;
		Boolean flag = false;
		int result;

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("insert into product values(?,?,?,?,to_date(?,'yyyy/mm/dd'),?)");
			ps.setInt(1, product.getProductId());
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getDescription());
			ps.setString(4, product.getAccountType());
			ps.setString(5, product.getValidFrom());
			ps.setString(6, product.getStatus());

			result = ps.executeUpdate();
			if (null != product.getBusinessTypeList())
				for (int i = 0; i < product.getBusinessTypeList().size(); i++) {

					ps = con.prepareStatement("insert into product_customer values(?,?)");
					ps.setInt(1, product.getProductId());
					ps.setString(2, product.getBusinessTypeList().get(i).getBusinessName());
					ps.executeUpdate();
				}
			if (null != product.getAdditionalProduct())
				for (int i = 0; i < product.getAdditionalProduct().size(); i++) {
					ps = con.prepareStatement("insert into main_additional_product values(?,?)");
					ps.setInt(1, product.getProductId());
					ps.setInt(2, product.getAdditionalProduct().get(i).getApId());
					ps.executeUpdate();
				}
			if (result > 0) {
				flag = true;
			}

		}

		catch (ClassNotFoundException e) {

			throw new ProductManagementException("Product is already exist");

		} catch (SQLException e) {

			throw new ProductManagementException("Product is already exist");

		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Product is already exist");

			}

		}

		return flag;

	}

	public List<BusinessType> viewBusinessType() throws ProductManagementException {
		PreparedStatement ps = null;
		Connection con = null;

		List<BusinessType> btList = new ArrayList<BusinessType>();
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select business_type from business_type order by business_type");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BusinessType bt = new BusinessType();
				bt.setBusinessName(rs.getString(1));
				btList.add(bt);
			}
		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("Unable to load business type ");

		} catch (SQLException e) {

			throw new ProductManagementException("Unable to load business type ");

		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Unable to load business type ");
			}

		}

		return btList;
	}

	public List<AdditionalProduct> viewAdditionalProduct() throws ProductManagementException {
		PreparedStatement ps = null;
		Connection con = null;

		List<AdditionalProduct> apList = new ArrayList<AdditionalProduct>();
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select apid,apname from additional_product order by apname");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AdditionalProduct ap = new AdditionalProduct();
				ap.setApId(rs.getInt(1));
				ap.setApName(rs.getString(2));

				apList.add(ap);
			}
		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("Unable to load additional products");
		} catch (SQLException e) {

			throw new ProductManagementException("Unable to load additional products");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Unable to load additional products");
			}

		}

		return apList;
	}

	public List<Product> viewProduct() throws ProductManagementException {
		PreparedStatement ps = null;

		Connection con = null;

		List<Product> pList = new ArrayList<Product>();
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select * from product");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setAccountType(rs.getString(4));
				p.setValidFrom(rs.getDate(5).toString());
				p.setStatus(rs.getString(6));

				pList.add(p);
			}
		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("Unable to view the product list");

		} catch (SQLException e) {

			throw new ProductManagementException("Unable to view the product list");

		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Unable to view the product list");

			}

		}

		return pList;
	}

	public Product searchByProductId(int productId) throws ProductManagementException {
		PreparedStatement ps = null;
		Connection con = null;
		Product p = new Product();
		List<BusinessType> btList = null;
		List<AdditionalProduct> apList = null;
		AdditionalProduct ap = null;
		BusinessType bt = null;
		ResultSet rs;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select * from product where id=?");
			ps.setInt(1, productId);

			rs = ps.executeQuery();
			if (rs.next()) {
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setAccountType(rs.getString(4));
				p.setValidFrom(rs.getDate(5).toString().replace('-', '/'));
				p.setStatus(rs.getString(6));

			}
			ps = con.prepareStatement("select * from product_customer where pid=?");
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			btList = new ArrayList<BusinessType>();
			while (rs.next()) {
				bt = new BusinessType();

				bt.setBusinessName(rs.getString(2));
				btList.add(bt);

			}
			p.setBusinessTypeList(btList);

			ps = con.prepareStatement("select * from main_additional_product where pid=?");
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			apList = new ArrayList<AdditionalProduct>();
			while (rs.next()) {
				ap = new AdditionalProduct();
				ap.setApId(rs.getInt(2));
				apList.add(ap);

			}
			p.setAdditionalProduct(apList);

		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("Unable to fetch the data");
		} catch (SQLException e) {

			throw new ProductManagementException("Unable to fetch the data");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Unable to fetch the product");
			}

		}

		return p;
	}

	public boolean updateProduct(Product product) throws ProductManagementException {

		PreparedStatement ps = null;
		Connection con = null;
		boolean flag = true;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"update product set name=?,description=?,account_type=?,valid_from=to_date(?,'yyyy/mm/dd'),status=? where id=?");

			ps.setString(1, product.getProductName());
			ps.setString(2, product.getDescription());
			ps.setString(3, product.getAccountType());
			ps.setString(4, product.getValidFrom());
			ps.setString(5, product.getStatus());
			ps.setInt(6, product.getProductId());

			ps.executeUpdate();

			ps = con.prepareStatement("delete from product_customer where pid=?");
			ps.setInt(1, product.getProductId());
			ps.executeUpdate();
			if (null != product.getBusinessTypeList())
				for (int i = 0; i < product.getBusinessTypeList().size(); i++) {
					ps = con.prepareStatement("insert into product_customer values(?,?)");
					ps.setInt(1, product.getProductId());
					ps.setString(2, product.getBusinessTypeList().get(i).getBusinessName());
					ps.executeUpdate();
				}

			ps = con.prepareStatement("delete from main_additional_product where pid=?");
			ps.setInt(1, product.getProductId());
			ps.executeUpdate();
			if (null != product.getAdditionalProduct())
				for (int i = 0; i < product.getAdditionalProduct().size(); i++) {
					ps = con.prepareStatement("insert into main_additional_product values(?,?)");
					ps.setInt(1, product.getProductId());
					ps.setInt(2, product.getAdditionalProduct().get(i).getApId());
					ps.executeUpdate();

				}

		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("Unable to update the product");

		} catch (SQLException e) {
			throw new ProductManagementException("Unable to update the product");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Unable to update the product");

			}

		}

		return flag;
	}

	public boolean deleteProduct(int pId) throws ProductManagementException {

		PreparedStatement ps = null;
		Connection con = null;
		boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("delete from product where id=?");
			ps.setInt(1, pId);
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("Product is not exist or assigned to the customer");

		} catch (SQLException e) {
			throw new ProductManagementException("Product is not exist or assigned to the customer");

		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Product is not exist or assigned to the customer");

			}

		}
		return flag;
	}

	public boolean uploadProduct(List<Product> pList) throws ProductManagementException {

		PreparedStatement ps = null;
		Connection con = null;
		Boolean flag = false;
		int result;

		try {
			con = ConnectionUtil.getConnection();
			for (Product product : pList) {

				ps = con.prepareStatement("insert into product values(?,?,?,?,to_date(?,'dd/mm/yyyy'),?)");
				ps.setInt(1, product.getProductId());
				ps.setString(2, product.getProductName());
				ps.setString(3, product.getDescription());
				ps.setString(4, product.getAccountType());
				ps.setString(5, product.getValidFrom());
				ps.setString(6, product.getStatus());

				result = ps.executeUpdate();
			}

		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("An Error is occured while uploading document");

		} catch (SQLException e) {
			throw new ProductManagementException("An Error is occured while uploading document");

		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("An Error is occured while uploading document");

			}

		}
		return true;
	}

	/*-------  validating product data----------*/

	public boolean validateProductIdDao(int productId) throws ProductManagementException {
		PreparedStatement ps = null;

		Connection con = null;

		boolean flag = true;
		try {
			con = ConnectionUtil.getConnection();
			System.out.println("product id entered was   " + productId);
			ps = con.prepareStatement("select id from product where  id=?");
			ps.setLong(1, productId);
			ResultSet rs = ps.executeQuery();
			System.out.println("value of flag in dao  " + flag);
			while (rs.next() != false) {

				flag = false;
				System.out.println("value of flag in dao  " + flag);
			}

		} catch (ClassNotFoundException e) {

			throw new ProductManagementException("Product with the same Id already exist");

		} catch (SQLException e) {

			throw new ProductManagementException("Product with the same Id already exist");

		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new ProductManagementException("Product with the same Id already exist");

			}

		}

		return flag;
	}

}
