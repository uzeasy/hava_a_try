package com.uzeasy.store;

public class Message {
    private String message;

    public Message() {
        message = "Hello Struts User";
    }

    public String getMessage() {
        return message;
    }

    public String toString() {
        return message + " (from toString)";
    }

    public void setMessage(String s) {
        this.message=s;
    }
}