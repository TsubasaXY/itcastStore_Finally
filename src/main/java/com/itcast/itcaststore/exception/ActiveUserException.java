package com.itcast.itcaststore.exception;
//激活用户
public class ActiveUserException extends Exception {

    private static final long serialVersionUID = 1L;
    public int getMessage;

    public ActiveUserException() {
        super();
    }

    public ActiveUserException(String message, Throwable cause) {
        super(message, cause);
    }

    public ActiveUserException(String message) {
        super(message);
    }

    public ActiveUserException(Throwable cause) {
        super(cause);
    }

}
