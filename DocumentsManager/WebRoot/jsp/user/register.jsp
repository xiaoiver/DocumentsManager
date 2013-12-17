<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="../header.jsp" />

<ol class="breadcrumb">
  <li><a href="#">主页</a></li>
  <li class="active">注册</li>
</ol>

<div class="container" id="regDiv" title="注册">
	<input id="rightUserType" type="hidden" value="${rightUserType}" />
	<input id="registerError" type="hidden" value="${registerError}" />
	<form id="registerForm" action="user/register.action" method="post">
		<div class="input-group input-group-lg">
			<input type="text" name="username" id="username" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 用户名</span>
		</div>
		
		<div class="input-group input-group-lg">
			<input id="password" type="password" name="password" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 密码</span>
		</div>
		
		<div class="input-group input-group-lg">
			<input id="repeat" type="password" name="repeat" class="form-control" data-required data-conditional="confirm" />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 确认密码</span>
		</div>
		
		<div class="input-group input-group-lg" >
			<span id="userTypeList" class="input-group-addon">
      		</span>
		</div>
	
	<div class="btn-group">
		<button type="submit" class="btn btn-primary">确定</button>

		<button type="reset" class="btn">重置</button>
	</div>
	
	</form>
</div>
<jsp:include page="../footer.jsp" />