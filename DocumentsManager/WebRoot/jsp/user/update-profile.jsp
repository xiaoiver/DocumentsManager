<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="../header.jsp" />

<ol class="breadcrumb">
  <li><a href="#">主页</a></li>
  <li><a href="user/personalHomepage.action">个人中心</a></li>
  <li class="active">修改资料</li>
</ol>

<div class="container" id="updateDiv" title="更新个人信息">
	<h2>${user.username}，欢迎您</h2>
	<form id="updateProfileForm" action="user/updateProfile.action" method="post">
		<div class="input-group input-group-lg">
			<input type="text" name="name" id="name" class="form-control" value="${user.name}" />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 姓名</span>
		</div>

		<div class="input-group input-group-lg">
			<input type="text" name="phone" id="phone" class="form-control" value="${user.phone}" />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 电话</span>
		</div>
		
		<div class="input-group input-group-lg">
			<input type="text" name="email" id="email" class="form-control" value="${user.email}" />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> E-mail</span>
		</div>
		
		<div class="input-group input-group-lg">
			<input type="text" disabled="disabled" class="form-control" value="${user.regDate}" />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 注册日期</span>
		</div>
		
		<div class="btn-group">
			<button type="submit" class="btn btn-lg btn-primary">确定</button>
			<button type="reset" class="btn btn-lg">重置</button>
		</div>
	</form>
</div>

<jsp:include page="../footer.jsp" />
