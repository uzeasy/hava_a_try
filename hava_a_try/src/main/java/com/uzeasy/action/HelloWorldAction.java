package com.uzeasy.action;

import com.opensymphony.xwork2.ActionSupport;
import com.uzeasy.store.Message;
import org.apache.struts2.interceptor.parameter.StrutsParameter;

public class HelloWorldAction extends ActionSupport {
    private Message message;
    private static int helloCount = 0;

    private String userName;

    public Message getMessageStore() {
        return message;
    }

    public String getUserName() {
        return userName;
    }

//    Used to annotate public getter/setter methods or fields on com.opensymphony.xwork2.Action classes that are intended for parameter injection by the ParametersInterceptor.
     @StrutsParameter
    public void setUserName(String userName) {
        this.userName = userName;
    }

//    Note that even though helloCount is a static field, the get method for helloCount is not static. For Struts 2 to call the getHelloCount method to get the value of helloCount, the getHelloCount method cannot be static.
//    If the value returned by the get method is an object, then the property tag will cause Struts 2 to call the object’s toString method. Of course, you should always override Class Object’s toString method in your model classes.
    public int getHelloCount() {
        return helloCount;
    }

    public String execute() {
        message = new Message();
        if (userName != null) {
            message.setMessage( message.getMessage() + " " + userName);
        }
        helloCount++;
        return SUCCESS;
    }
}