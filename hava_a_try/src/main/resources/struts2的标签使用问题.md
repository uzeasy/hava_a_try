# struts2的标签使用问题记录

## 一些JSP页面中一旦使用s:form标签，就会发生NullPointerException异常，但是一些JSP页面中使用s:form则没有该问题

register.jsp页面内容如下：

```jsp

<%--
  Created by IntelliJ IDEA.
  User: 25197
  Date: 2024/5/31
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Register</title>
</head>
<body>
<h3>Register for a prize by completing this form.</h3>

<s:form action="register">
    <s:textfield name="personBean.firstName" label="First name" />
    <s:textfield name="personBean.lastName" label="Last name" />
    <s:textfield name="personBean.email"  label ="Email"/>
    <s:textfield name="personBean.age"  label="Age"  />
    <s:submit/>
</s:form>

</body>
</html>

```

跳转到上述页面的reference页面代码（index.jsp)内容如下：

```jsp

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
<p><a href="register.jsp">Please register</a> for our prize drawing.</p>
</body>
</html>

```

报错信息如下：

```text

javax.servlet.ServletException: org.apache.jasper.JasperException: java.lang.NullPointerException
	at org.eclipse.jetty.server.handler.HandlerCollection.handle(HandlerCollection.java:162)
	at org.eclipse.jetty.server.handler.HandlerWrapper.handle(HandlerWrapper.java:127)
	at org.eclipse.jetty.server.Server.handle(Server.java:516)
	at org.eclipse.jetty.server.HttpChannel.lambda$handle$1(HttpChannel.java:487)
	at org.eclipse.jetty.server.HttpChannel.dispatch(HttpChannel.java:732)
	at org.eclipse.jetty.server.HttpChannel.handle(HttpChannel.java:479)
	at org.eclipse.jetty.server.HttpConnection.onFillable(HttpConnection.java:277)
	at org.eclipse.jetty.io.AbstractConnection$ReadCallback.succeeded(AbstractConnection.java:311)
	at org.eclipse.jetty.io.FillInterest.fillable(FillInterest.java:105)
	at org.eclipse.jetty.io.ChannelEndPoint$1.run(ChannelEndPoint.java:104)
	at org.eclipse.jetty.util.thread.strategy.EatWhatYouKill.runTask(EatWhatYouKill.java:338)
	at org.eclipse.jetty.util.thread.strategy.EatWhatYouKill.doProduce(EatWhatYouKill.java:315)
	at org.eclipse.jetty.util.thread.strategy.EatWhatYouKill.tryProduce(EatWhatYouKill.java:173)
	at org.eclipse.jetty.util.thread.strategy.EatWhatYouKill.run(EatWhatYouKill.java:131)
	at org.eclipse.jetty.util.thread.ReservedThreadExecutor$ReservedThread.run(ReservedThreadExecutor.java:409)
	at org.eclipse.jetty.util.thread.QueuedThreadPool.runJob(QueuedThreadPool.java:883)
	at org.eclipse.jetty.util.thread.QueuedThreadPool$Runner.run(QueuedThreadPool.java:1034)
	at java.lang.Thread.run(Thread.java:750)
Caused by: org.apache.jasper.JasperException: java.lang.NullPointerException
	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:618)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:498)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:383)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:331)
	at org.eclipse.jetty.jsp.JettyJspServlet.service(JettyJspServlet.java:106)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:790)
	at org.eclipse.jetty.servlet.ServletHolder$NotAsync.service(ServletHolder.java:1459)
	at org.eclipse.jetty.servlet.ServletHolder.handle(ServletHolder.java:799)
	at org.eclipse.jetty.servlet.ServletHandler$ChainEnd.doFilter(ServletHandler.java:1656)
	at org.eclipse.jetty.websocket.server.WebSocketUpgradeFilter.doFilter(WebSocketUpgradeFilter.java:292)
	at org.eclipse.jetty.servlet.FilterHolder.doFilter(FilterHolder.java:193)
	at org.eclipse.jetty.servlet.ServletHandler$Chain.doFilter(ServletHandler.java:1626)
	at org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter.handleRequest(StrutsPrepareAndExecuteFilter.java:154)
	at org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter.tryHandleRequest(StrutsPrepareAndExecuteFilter.java:140)
	at org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter.doFilter(StrutsPrepareAndExecuteFilter.java:128)
	at org.eclipse.jetty.servlet.FilterHolder.doFilter(FilterHolder.java:201)
	at org.eclipse.jetty.servlet.ServletHandler$Chain.doFilter(ServletHandler.java:1626)
	at org.eclipse.jetty.servlet.ServletHandler.doHandle(ServletHandler.java:552)
	at org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:143)
	at org.eclipse.jetty.security.SecurityHandler.handle(SecurityHandler.java:600)
	at org.eclipse.jetty.server.handler.HandlerWrapper.handle(HandlerWrapper.java:127)
	at org.eclipse.jetty.server.handler.ScopedHandler.nextHandle(ScopedHandler.java:235)
	at org.eclipse.jetty.server.session.SessionHandler.doHandle(SessionHandler.java:1624)
	at org.eclipse.jetty.server.handler.ScopedHandler.nextHandle(ScopedHandler.java:233)
	at org.eclipse.jetty.server.handler.ContextHandler.doHandle(ContextHandler.java:1440)
	at org.eclipse.jetty.server.handler.ScopedHandler.nextScope(ScopedHandler.java:188)
	at org.eclipse.jetty.servlet.ServletHandler.doScope(ServletHandler.java:505)
	at org.eclipse.jetty.server.session.SessionHandler.doScope(SessionHandler.java:1594)
	at org.eclipse.jetty.server.handler.ScopedHandler.nextScope(ScopedHandler.java:186)
	at org.eclipse.jetty.server.handler.ContextHandler.doScope(ContextHandler.java:1355)
	at org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:141)
	at org.eclipse.jetty.server.handler.ContextHandlerCollection.handle(ContextHandlerCollection.java:191)
	at org.eclipse.jetty.server.handler.HandlerCollection.handle(HandlerCollection.java:146)
	... 17 more
Caused by: java.lang.NullPointerException
	at org.apache.struts2.components.Component.getNamespace(Component.java:448)
	at org.apache.struts2.components.Component.determineNamespace(Component.java:433)
	at org.apache.struts2.components.ServletUrlRenderer.renderFormUrl(ServletUrlRenderer.java:140)
	at org.apache.struts2.components.Form.populateComponentHtmlId(Form.java:232)
	at org.apache.struts2.components.UIBean.evaluateParams(UIBean.java:796)
	at org.apache.struts2.components.UIBean.end(UIBean.java:550)
	at org.apache.struts2.views.jsp.ComponentTagSupport.doEndTag(ComponentTagSupport.java:38)
	at org.apache.jsp.register_jsp._jspx_meth_s_005fform_005f0(register_jsp.java:335)
	at org.apache.jsp.register_jsp._jspService(register_jsp.java:158)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:790)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:465)
	... 48 more

```