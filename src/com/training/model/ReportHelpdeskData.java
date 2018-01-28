/**
 * 
 */
package com.training.model;

/**
 *  
 *
 */
public class ReportHelpdeskData {
	private int count;
	private String title;

	public ReportHelpdeskData(int count, String title) {
		super();
		this.count = count;
		this.title = title;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
