/**
 * 
 */
package com.training.model;

/**
 *  
 *
 */
public class RelationshipManager {
	private int id;
	private String name;
	private String branch;

	/**
	 * 
	 */
	public RelationshipManager() {
	}

	/**
	 * @param id
	 * @param name
	 * @param branch
	 */
	public RelationshipManager(int id, String name, String branch) {
		super();
		this.id = id;
		this.name = name;
		this.branch = branch;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the branch
	 */
	public String getBranch() {
		return branch;
	}

	/**
	 * @param branch
	 *            the branch to set
	 */
	public void setBranch(String branch) {
		this.branch = branch;
	}

}
