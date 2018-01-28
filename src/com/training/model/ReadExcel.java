package com.training.model;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFRow;

import com.training.controllers.LoginServlet;
import com.training.exception.ProductManagementException;

public class ReadExcel {
	private String file;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public ReadExcel(String file) {
		// this.file= "C:\\Documents and Settings/664488/sample.xls";
		this.file = file;
	}

	public List<Product> getProductList() throws ProductManagementException {
		List<Product> pList = null;
		Product product = null;
		try {

			InputStream input = new BufferedInputStream(new FileInputStream(file));
			POIFSFileSystem fs = new POIFSFileSystem(input);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb.getSheetAt(0);
			pList = new ArrayList<Product>();

			Iterator rows = sheet.rowIterator();
			rows.next();
			while (rows.hasNext()) {
				HSSFRow row = (HSSFRow) rows.next();
				logger.info("\n");
				Iterator cells = row.cellIterator();
				int count = 0;
				product = new Product();
				while (cells.hasNext()) {

					HSSFCell cell = (HSSFCell) cells.next();
					if (HSSFCell.CELL_TYPE_NUMERIC == cell.getCellType() && count == 0) {
						logger.info(cell.getNumericCellValue() + "   ");
						product.setProductId((int) cell.getNumericCellValue());
						count++;
					} else if (HSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						if (count == 1) {
							logger.info(cell.getStringCellValue() + "     ");
							product.setProductName(cell.getStringCellValue());
						} else if (count == 2) {
							logger.info(cell.getStringCellValue() + "     ");
							product.setDescription(cell.getStringCellValue());
						} else if (count == 3) {
							logger.info(cell.getStringCellValue() + "     ");
							product.setAccountType(cell.getStringCellValue());
						} else if (count == 4) {
							logger.info(cell.getStringCellValue() + "    ");
							product.setValidFrom(cell.getStringCellValue());
						} else if (count == 5) {
							logger.info(cell.getStringCellValue() + "    ");
							product.setStatus(cell.getStringCellValue());
						}

						count++;
					}

					else if (HSSFCell.CELL_TYPE_BOOLEAN == cell.getCellType()) {
						logger.info(cell.getBooleanCellValue() + "     ");
					} else if (HSSFCell.CELL_TYPE_BLANK == cell.getCellType() && count == 2) {
						logger.info("BLANK      ");
						product.setDescription("");

						count++;
					} else {
					}
				}

				pList.add(product);
			}

		} catch (IOException ex) {
			logger.info(ex.getMessage());
			throw new ProductManagementException("Document is unavailable");

		}
		return pList;
	}

}
