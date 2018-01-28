/**
 * 
 */
package com.training.login;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import com.opensymphony.xwork2.ActionSupport;
import com.training.services.LoginService;
import com.training.utils.AeSimpleSHA1;

/**
 *  
 *
 */
public class LoginAction extends ActionSupport {
	private String username;
	private String password;
	private String epassword;

	public String execute() {
		LoginService lservice = new LoginService();
		int uname = 0;
		if (!(username.equals(null))) {
			uname = Integer.parseInt(username);
			try {
				epassword = AeSimpleSHA1.SHA1(password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		boolean flag = false;
		flag = lservice.getLoginDetails(uname, epassword);
		if (true == flag) {
			return "success";
		}
		/*
		 * if (this.username.equals("veda") && this.password.equals("veda11")) {
		 * 
		 * return "success"; }
		 */

		else {
			System.out.println("in invalid login ");
			addActionError(getText("error.login"));
			return "error";
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
