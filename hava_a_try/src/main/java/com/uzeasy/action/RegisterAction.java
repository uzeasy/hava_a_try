package com.uzeasy.action;

import com.opensymphony.xwork2.ActionSupport;
import com.uzeasy.model.Person;
import org.apache.struts2.interceptor.parameter.StrutsParameter;


public class RegisterAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private Person personBean;

    /**
     *  Used to annotate public getter/setter methods or fields on {@link com.opensymphony.xwork2.Action} classes that are
     *  intended for parameter injection by the  ParametersInterceptor.
     */
    @StrutsParameter(depth = 1)
    public Person getPersonBean() {
        return personBean;
    }

    public void setPersonBean(Person person) {
        personBean = person;
    }

    public String execute() throws Exception {
        //call Service class to store personBean's state in database
        return SUCCESS;
    }

    public void validate(){
        if (personBean.getFirstName().isEmpty()) {
            addFieldError("personBean.firstName", "First name is required.");
        }

        if (personBean.getEmail().isEmpty()) {
            addFieldError("personBean.email", "Email is required.");
        }

        if (personBean.getAge() < 18) {
            addFieldError("personBean.age", "Age is required and must be 18 or older");
        }
    }



}
