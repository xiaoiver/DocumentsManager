<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="../header.jsp" />

<ol class="breadcrumb">
  <li><a href="/">主页</a></li>
  <li><a href="user/personalHomepage.action">个人中心</a></li>
  <li class="active">录入文献</li>
</ol>

<div class="container" id="createDocumentDiv" title="录入文献">
	<div class="btn-group">
	  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	    选择文献类型 <span class="caret"></span>
	  </button>
	  <ul id="documentTypeList" class="dropdown-menu" role="menu">
	  </ul>
	</div>
	<h2 id="documentTypeName"></h2>
	<form id="createDocumentForm" action="document/createDocument.action" method="post">
		<div class="input-group">
			<input type="text" name="title" id="title" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 标题</span>
		</div>

		<div class="input-group">
			<input type="text" name="author" id="author" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 作者</span>
		</div>
		
		<div class="input-group">
			<input type="text" name="year" id="year" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 出版年份</span>
		</div>
		
		<div class="input-group">
			<input type="text" name="pages" id="pages" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 页码</span>
		</div>
		
		<div class="input-group">
			<textarea name="abstracts" id="abstracts" class="form-control" rows="3" cols="20" data-required ></textarea>
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 摘要</span>
		</div>
		
		<div class="input-group">
			<input type="text" name="keywords" id="keywords" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 关键词</span>
		</div>
		
		<div class="input-group">
			<input type="text" name="publisher" id="publisher" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 出版社</span>
		</div>
		
		<div class="input-group">
			<input type="text" name="url" id="url" class="form-control" data-required />
			<span class="input-group-addon glyphicon glyphicon-asterisk"> 在线网址</span>
		</div>
		
		<div id="buttons" class="btn-group">
			<button type="submit" class="btn btn-lg btn-primary">确定</button>
			<button type="reset" class="btn btn-lg">重置</button>
		</div>
	</form>
</div>

<jsp:include page="../footer.jsp" />