<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="../header.jsp" />

<ol class="breadcrumb">
  <li><a href="#">主页</a></li>
  <li class="active">个人中心</li>
</ol>

<input type="hidden" id="activePanel" name="activePanel" value="${activePanel}" />
<ul class="nav nav-tabs" id="personalHomepageTab">
  <li><a href="#profilePanel" data-toggle="tab">个人资料</a></li>
  <li><a href="#documentPanel" data-toggle="tab">我的文献</a></li>
</ul>

<div class="tab-content">
  <div class="tab-pane" id="profilePanel">
  	<div>
	  	姓名：${user.name}
	  	电话：${user.phone}
	  	E-mail：${user.email}
  	</div>
  	<div class="btn-group btn-group-lg">
  		<a href="user/updateProfile.action" class="btn btn-lg btn-primary">修改个人资料</a>
	</div>
  </div>
  <div class="tab-pane" id="documentPanel">
  	<table class="table table-striped">
  		<thead>
  			<tr>
  				<th>文献名</th>
  				<th>文献类型</th>
  				<th>作者</th>
  				<th>关键字</th>
  				<th>添加时间</th>
  				<th>操作</th>
  			</tr>
  		</thead>
  		<tbody>
	  		<c:choose>
				<c:when test="${documents!=null}">
				<c:forEach var="document" items="${documents}">
				<tr>
					<td>
						${document.title}
					</td>
					<td>
						${document.documentType.name}
					</td>
					<td>
						${document.author}
					</td>
					<td>
						${document.keywords}
					</td>
					<td>
						${document.addTime}
					</td>
					<td>
						<a href="document/editDocument.action?documentId=${document.documentId}" class="btn btn-sm btn-primary">修改文献</a>
					</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<p>没有找到结果</p>
				</c:otherwise>
			</c:choose>
  		</tbody>
  	</table>
  	
  	<div>
	<ul class="pagination">
		<c:if test="${totalPageNum>0}">
			<c:if test="${currentPage!=1}">
			<li>
				<a href="user/personalHomepage.action?pageNum=${currentPage-1}">
					&laquo;
				</a>
			</li>
			</c:if>
			
			<c:forEach var="num" begin="1" end="${totalPageNum}">
				<c:if test="${currentPage==num}">
					<li class="active">
				</c:if>
				<c:if test="${currentPage!=num}">
					<li>				
				</c:if>
				<a href="user/personalHomepage.action?pageNum=${num}">
						${num}
				</a>
			<li>
			</c:forEach>
			
			<c:if test="${currentPage!=totalPageNum}">
			<li>
				<a href="user/personalHomepage.action?pageNum=${currentPage+1}">
					&raquo;
				</a>
			</li>
			</c:if>
		</c:if>
	</ul>
	</div>
	
	<div class="btn-group btn-group-lg">
  		<a href="document/createDocument.action" class="btn btn-lg btn-primary">录入文献</a>
  	</div>
  </div>
</div>

<jsp:include page="../footer.jsp" />