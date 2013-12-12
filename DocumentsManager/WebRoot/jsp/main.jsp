<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/uploadify.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/dhtmlxscheduler.css">
	
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/easyui-lang-zh_CN.js"></script>		
	<script type="text/javascript" src="<%=basePath %>js/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/main.js"></script>
	<script type="text/javascript" src="js/dhtmlxscheduler.js"></script>
	
	<!--<script type="text/javascript" src="js/dhtmlxscheduler_minical.js"></script>-->
	<!--<script type="text/javascript" src="js/dhtmlxscheduler_recurring.js"></script>-->
	<script type="text/javascript" src="js/dhtmlxscheduler_year_view.js"></script>
	<script type="text/javascript" src="js/dhtmlxscheduler_units.js"></script>
	<script type="text/javascript" src="js/dhtmlxscheduler_timeline.js"></script>
	<script type="text/javascript" src="js/locale_cn.js"></script>
	<script type="text/javascript">
		
	</script>
	

  </head>
  
  <body class="easyui-layout" >
    	<div data-options="region:'north',split:true" title="north" style="height:100px;padding:10px">
    		the north contents
    		<a href="<%=basePath %>index.jsp">登录</a>
    	</div>
    	<div data-options="region:'west',split:true" title="west(menu)" style="width:200px;padding:10px">
    		<ul data-options="url:'menu!getOwnerMenus.action',onClick:function(node){
    			if(node.attributes){
	    			var url = node.attributes.url;
	    			alert(url);
	    			if(!$('#tab').tabs('exists',node.text)){	    			
		   				$('#tab').tabs('add',{
		   					title:node.text,
		   					href:url,
		   					closable:true,
		   					fit:true
		   					,loadingMessage:'加载中...'
		   				});	    			
	    			}	
	    			else{
	    				$('#tab').tabs('select',node.text)
	    			}	    			
    			}
    		
    		}" class="easyui-tree">
    		</ul>
    	</div>
    	<div  data-options="region:'center'"    >
    		<div id="tab" class="easyui-tabs" data-options="fit:true"></div>
    	</div>
  </body>
</html>
