package br.com.msystem.exceptions;

public class SystemException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9133271661590605251L;

	public SystemException(Throwable cause) {
		super(cause);
	}

	public SystemException(String message) {
		super(message);
	}

}
