<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--To use the Struts 2 tags on the view page, you must include a tag library directive. Typically, the taglib directive is <%@ taglib prefix="s" uri="/struts-tags" %>. So the prefix for all the Struts 2 tags will be s--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic Struts 2 Application - Welcome</title>
</head>
<body>
<h1>Welcome To Struts 2!</h1>
<%-- added a Struts 2 url tag to the index.jsp to create a hyperlink to the hello.action--%>
<%--hello.action return a jsp page named helloWorld.jsp as response--%>
<p><a href="<s:url action='hello'/>">Hello World</a></p>
<%--The value of the var attribute is a reference we can use later in our code to refer to the url created.--%>
<s:url action="hello" var="helloLink">
    <s:param name="userName">Bruce Phillips</s:param>
</s:url>
<%--Notice the value of the href attribute is ${helloLink}. The view page will substitute the hyperlink we created using the url tag for the ${helloLink} reference. Note that the query string parameter will be properly URL-encoded (Bruce+Phillips)--%>
<p><a href="${helloLink}">Hello Bruce Phillips</a></p>
<p>Get your own personal hello by filling out and submitting this form.</p>
<s:form action="hello">
    <s:textfield name="userName" label="Your name" />
    <s:submit value="Submit" />
</s:form>
<%--<p><a href="register.jsp">Please register</a> for our prize drawing.</p>--%>
<s:url action="registerInput" var="registerInputLink" />
<p><s:a href="%{registerInputLink}">Please register</s:a> for our prize drawing.</p>
</body>
</html>