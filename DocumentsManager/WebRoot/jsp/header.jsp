<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ page import="nju.dm.domain.User"%>
<%
String path = request.getContextPath();
User user = (User)session.getAttribute("user");
String keyword = request.getParameter("keyword");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <base href="<%=basePath%>">
    <title>
    	Welcome
    </title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>  
<body>
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">文献管理系统</a>
  </div>

  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">文献类型 <b class="caret"></b></a>
        <ul id="searchDocumentTypeList" class="dropdown-menu">
        </ul>
      </li>
    </ul>
    <form id="searchBar" class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input id="searchInput" type="text" class="form-control" width="300" placeholder="所有文献">
      </div>
      <button type="submit" class="btn btn-default">搜索</button>
    </form>
        
    <ul class="nav navbar-nav navbar-right">
    <%
		if(user == null){
	%>
	<li id="loginDialog">
		<input id="loginError" type="hidden" value="${loginError}" /><!-- 保存错误信息  -->
    	<input id="hiddenUsername" type="hidden" value="${rightUsername}" /><!-- 保存正确的用户名 -->
		<form id="login" class="navbar-form" role="form" action="user/login.action" method="post">
	      <div class="form-group">
	        <input id="username" name="username" type="text" class="form-control">
	      </div>
	      <div class="form-group">
	        <input id="password" name="password" type="password" class="form-control">
	        <input type="text" id="txt" value="请输入密码" class="form-control"/>
	      </div>
	      <button id="loginButton" type="submit" class="btn btn-success">登录</button>
	    </form>
    </li>
	<li><a href="user/register.action">注册</a></li>
     <%
     	}else{
  	%>
  	<li><h4>Hi,<%= user.getUsername() %></h4></li>
	<li><a href="user/personalHomepage.action" id="personalHomepageLink" data-toggle="tooltip" title="查看修改个人资料，录入文献">个人中心</a></li>
    	<% 
			if(user.getUserType().getName().equals("管理员")){
		%>
    	<li><a href="user/manage-userlist.jsp" id="manageUserListLink">用户列表</a></li>
    	<%
			}
		%>
    <li><a href="user/logout.action" id="logoutLink">注销</a></li>
    <%
		}
	%>
    </ul>
  </div>
</nav>

<div id="messageDiv">
	<div id="messageBlock">
	</div>
</div>

<div class="container">
	<div class="row">
		<div id="mainContent" class="col-md-9 col-md-push-3">