package com.training.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;

//simple SHA256 Algorithm for password message digest
public class AeSimpleSHA1 {
	public static int cnt = 0;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	private static String convertToHex(byte[] data) {

		StringBuffer buf = new StringBuffer();
		logger.info("data length is " + data.length);

		for (int i = 0; i < data.length; i++) {

			int halfbyte = (data[i] >>> 4) & 0x0F;
			int two_halfs = 0;
			do {

				if ((0 <= halfbyte) && (halfbyte <= 9))
					buf.append((char) ('0' + halfbyte));
				else
					buf.append((char) ('a' + (halfbyte - 10)));
				halfbyte = data[i] & 0x0F;
				cnt++;
				logger.info("\n\nRound : " + cnt + ", String : " + buf.toString());

			} while (two_halfs++ < 1);
			// cnt++;
			// logger.info("\n\nRound : "+cnt+", String : "+buf.toString());

		}
		return buf.toString();
	}

	public static String SHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md;
		md = MessageDigest.getInstance("SHA-256");
		byte[] sha1hash = new byte[40];
		md.update(text.getBytes("iso-8859-1"), 0, text.length());
		sha1hash = md.digest();
		logger.info("\n\nBefore converting into hex  : " + sha1hash);

		return convertToHex(sha1hash);
	}
	/*
	 * public static void main(String []args) throws NoSuchAlgorithmException,
	 * UnsupportedEncodingException { logger.info(SHA1("relmanager")); }
	 */}
