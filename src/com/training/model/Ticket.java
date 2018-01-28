/**
 * 
 */
package com.training.model;

import java.util.Date;

/**
 *  
 *
 */
public class Ticket {

	private long id;
	private String title;
	private String summary;
	private Date raisedOnDate;
	private long npId;
	private Date resolvedDate;
	private String resolutionComments;
	private String additionalDetails;
	private String Status;
	private long pid;
	private String priorityId;
	private long raised_by;

	private long assigned_to;
	private String assignedToName;

	public String getAssignedToName() {
		return assignedToName;
	}

	public void setAssignedToName(String assignedToName) {
		this.assignedToName = assignedToName;
	}

	public long getRaised_by() {
		return raised_by;
	}

	public void setRaised_by(long raisedBy) {
		raised_by = raisedBy;
	}

	public String getPriorityId() {
		return priorityId;
	}

	public void setPriorityId(String priorityId) {
		this.priorityId = priorityId;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Date getRaisedOnDate() {
		return raisedOnDate;
	}

	public void setRaisedOnDate(Date raisedOnDate) {
		this.raisedOnDate = raisedOnDate;
	}

	public long getNpId() {
		return npId;
	}

	public void setNpId(long npId) {
		this.npId = npId;
	}

	public Date getResolvedDate() {
		return resolvedDate;
	}

	public void setResolvedDate(Date resolvedDate) {
		this.resolvedDate = resolvedDate;
	}

	public String getResolutionComments() {
		return resolutionComments;
	}

	public void setResolutionComments(String resolutionComments) {
		this.resolutionComments = resolutionComments;
	}

	public String getAdditionalDetails() {
		return additionalDetails;
	}

	public void setAdditionalDetails(String additionalDetails) {
		this.additionalDetails = additionalDetails;
	}

	/**
	 * @return the pid
	 */
	public long getPid() {
		return pid;
	}

	/**
	 * @param pid
	 *            the pid to set
	 */
	public void setPid(long pid) {
		this.pid = pid;
	}

	public long getAssigned_to() {
		return assigned_to;
	}

	public void setAssigned_to(long assignedTo) {
		assigned_to = assignedTo;
	}

}
