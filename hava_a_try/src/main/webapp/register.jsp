<%--
  Created by IntelliJ IDEA.
  User: 25197
  Date: 2024/5/31
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<s:head/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Register</title>
</head>
<body>
<h3>Register for a prize by completing this form.</h3>

<%--
   <s:form action="register" namespace="test">
       <s:textfield name="personBean.firstName" label="First name" />
       <s:textfield name="personBean.lastName" label="Last name" />
       <s:textfield name="personBean.email"  label ="Email"/>
       <s:textfield name="personBean.age"  label="Age"  />
       <s:submit/>
   </s:form>
--%>
<%--
    Instead of specifying the name and label attributes we can just use the key attribute.
    The value for the key attribute instructs the Struts 2 framework to use the same value for the name attribute (personBean.firstName).
    For the label attribute’s value the value of the key attribute is used by the Struts 2 framework to find a key in a properties file with the same value. So in our example,
    Struts 2 will look in Register.properties for a key with a value of personBean.firstName. The value of that key (First name) will be used as the label attribute’s value.
--%>
<%--为何有些情况下必须为form表单指定namespace属性，否则就会发生form表单标签找不到的问题--%>
<s:form action="register">
    <s:textfield key="personBean.firstName"/>
    <s:textfield key="personBean.lastName"/>
    <s:textfield key="personBean.email"/>
    <s:textfield key="personBean.age"/>
    <s:submit/>
</s:form>
<%--上述表单在提交之后，为何没有返回thans.jsp页面--%>

</body>
</html>