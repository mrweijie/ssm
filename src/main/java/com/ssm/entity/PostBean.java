package com.ssm.entity;

public class PostBean {
    private String state;
    private String message;

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public PostBean() {
    }

    public PostBean(String state, String message) {
        this.state = state;
        this.message = message;
    }
}
