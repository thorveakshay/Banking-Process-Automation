package com.training.model;

public class Proof {
	private int partyId;
	private String document;
	private String submittedDate;
	private String proofStatus;
	private String documentType;

	/**
	 * 
	 */
	private byte[] documentProof;

	/**
	 * @return the documentProof
	 */
	public byte[] getDocumentProof() {
		return documentProof;
	}

	/**
	 * @param documentProof
	 *            the documentProof to set
	 */
	public void setDocumentProof(byte[] documentProof) {
		this.documentProof = documentProof;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public String getSubmittedDate() {
		return submittedDate;
	}

	public void setSubmittedDate(String submittedDate) {
		this.submittedDate = submittedDate;
	}

	public String getStatus() {
		return proofStatus;
	}

	public void setStatus(String proofStatus) {
		this.proofStatus = proofStatus;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

}
