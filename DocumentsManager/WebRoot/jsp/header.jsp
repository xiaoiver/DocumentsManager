<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ page import="nju.dm.domain.User"%>
<%
String path = request.getContextPath();
User user = (User)session.getAttribute("user");
String keyword = request.getParameter("keyword");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>
    	Welcome
    </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="stylesheet" type="text/css" href="css/themes/base/jquery-ui.css">
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<style>
		.ui-menu { position: absolute; width: 100px; }
	</style>
</head>
  
  <body>
  
  	<div id="userDiv">
  		<% 
  			if(user == null){ 
  		%>
  		<div>
		  <div>
		    <button id="rerun">新用户，您可以</button>
		    <button id="select">Select an action</button>
		  </div>
		  <ul>
		    <li><a href="javascript:void(0)" id="loginLink">登录</a></li>
		    <li><a href="javascript:void(0)" id="registerLink">注册</a></li>
		  </ul>
		</div>
  		<% 	}else{
  		%>
  		<div>
		  <div>
		    <button id="rerun">欢迎你，<%=user.getUsername() %></button>
		    <button id="select">Select an action</button>
		  </div>
		  <ul>
		    <li><a href="javascript:void(0)" id="updateLink">修改资料</a></li>
		    <li><a href="default/logout.action" id="logoutLink">注销</a></li>
		  </ul>
		</div>
  		<%	
  			}
  		%>
  	</div>
  	
  	<div id="loginDialog" title="登录">
    <input id="loginError" type="hidden" value="${loginError}" />
    <form id="login" action="default/login.action" method="post">
		
		<fieldset id="inputs">
		<div id="errorBlock">用户名或密码错误</div>
		<div class="inputDiv"><input id="username" type="text" name="username" /></div>
		
		<div class="inputDiv"><input id="password" type="password" name="password" /></div>
		
		<div class="inputDiv"><input type="text" id="txt" value="请输入密码"/></div>
		</fieldset>
		
		
		<fieldset id="actions">
		<input id="loginSubmitBtn" class="submit" type="submit" value="登录" />
		</fieldset>

	</form>
	</div>
	
	<div id="regDialog" title="注册">
    <form id="register" action="default/register.action" method="post">
		
		<fieldset id="inputs">
		
		<div class="inputDiv"><input id="username" type="text" name="username" /></div>
		
		<div class="inputDiv"><input id="password" type="password" name="password" /></div>		
		</fieldset>		
		
		<fieldset id="actions">
		<input id="registerSubmitBtn" class="submit" type="submit" value="注册" />
		</fieldset>

	</form>
	</div>