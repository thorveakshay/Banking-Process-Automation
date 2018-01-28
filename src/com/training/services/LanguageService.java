/**
 * 
 */
package com.training.services;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 *  
 *
 */
public class LanguageService {

	public String convertLanguage(String language, String country) {
		/*
		 * String language; String country;
		 */
		String msg;

		/*
		 * language = new String(args[0]); country = new String(args[1]);
		 */

		Locale currentLocale;
		ResourceBundle messages;
		currentLocale = new Locale(language, country);
		messages = ResourceBundle.getBundle("com.training.multilingualsupport.MessagesBundle", currentLocale);
		String g = messages.getString("footer");
		msg = g;
		return msg;
	}
}
