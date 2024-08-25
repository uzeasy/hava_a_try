<%--
  Created by IntelliJ IDEA.
  User: 25197
  Date: 2024/5/31
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Registration Successful</title>
</head>
<body>

<%--
    <h3>Thank you for registering for a prize.</h3>
--%>
<%--text tag instead of the h3 tag--%>
<h3><s:text name="thankyou" /></h3>

<p>Your registration information: <s:property value="personBean" /> </p>

<p><a href="<s:url action='index' />" >Return to home page</a>.</p>
</body>
</html>
