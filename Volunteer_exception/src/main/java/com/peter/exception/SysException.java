package com.peter.exception;

public class SysException extends Exception {

	private static final long serialVersionUID = 1L;
	private String message;

	public SysException(String message) {
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
}
