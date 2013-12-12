<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



    <table id="userlistrolestab" class="easyui-datagrid" data-options="fit:true,singleSelect:true" >
    	<thead>
	    	<tr>
	    		<th data-options="field:'roleid'">角色编号</th>
	    		<th data-options="field:'rolename'">角色名称</th>
	    		<th data-options="field:'roledesc'">角色描述</th>
	    		<th data-options="field:'regdate'">注册日期</th>
	    	</tr>    	
    	</thead>
    	<tbody>
    	<c:forEach items="${roles }" var="role">
    	<tr>
    		<td>${role.roleid }</td>
    		<td>${role.rolename }</td>
    		<td>${role.roledesc }</td>
    		<td><fmt:formatDate value="${role.regdate }" pattern="yyyy-MM-dd"/></td>
    	</tr>
    	</c:forEach>
    	
    	</tbody>
    	
    </table>

  <!-- 
<table class="easyui-datagrid">  
   <thead>  
       <tr>  
           <th data-options="field:'code'">Code</th>  
           <th data-options="field:'name'">Name</th>  
           <th data-options="field:'price'">Price</th>  
       </tr>  
   </thead>  
   <tbody>  
        <tr>  
            <td>001</td><td>name1</td><td>2323</td>  
        </tr>  
        <tr>  
            <td>002</td><td>name2</td><td>4612</td>  
        </tr>  
    </tbody>  
</table>  
 -->















  
