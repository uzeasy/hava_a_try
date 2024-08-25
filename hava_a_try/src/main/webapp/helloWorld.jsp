<%--
  Created by IntelliJ IDEA.
  User: 25197
  Date: 2024/5/29
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Hello World!</title>
</head>
<body>
<h2><s:property value="messageStore.message" /></h2>
<%--the getHelloCount method returns an integer type, Struts 2 converted it to type String and placed it into the body of the p tag.--%>
<p>I've said hello <s:property value="helloCount" /> times!</p>
<p><s:property value="messageStore" /></p>

</body>
</html>
