package com.training.exception;

public class EmployeeManagementException extends Exception {

	public EmployeeManagementException() {
	}

	public EmployeeManagementException(String message) {
		super(message);
	}

	public EmployeeManagementException(Throwable cause) {
		super(cause);
	}

	public EmployeeManagementException(String message, Throwable cause) {
		super(message, cause);
	}

}
