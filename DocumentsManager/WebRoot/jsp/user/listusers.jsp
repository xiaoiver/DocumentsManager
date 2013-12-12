<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listroles.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>themes/icon.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
	
	
  </head>
  <body >
  	<style>
		#searchusertable  td,.updateusertable  td,.updateusertable  td textarea,.updateusertable  td input,
		#adduserform td,#adduserform input,#importuserexcel div,#importuserexcel span,#importuserexcel td{
			font-size:12px;
		}
	</style>		
	
	<!-- 显示界面 -->
 	<table id="listuserstab"></table>
 	<div id="usertabtoolbar" style="height:auto">
 		<div>
 			<a href="javascript:void(0)" class="easyui-linkbutton" onclick='addUser()' plain="true">添加用户</a>
 			<a href="javascript:void(0)" class="easyui-linkbutton" onclick='$("#importuserexcel").dialog("open");' plain="true">导入excel</a> 			
 		</div>
 		<div> 		 
 			<form id="searchuserform">		
    		<table id="searchusertable">
    			<tr>
    				<td>用户编号</td><td  style="width:100px"><input  name="userid" style="width:80px"/></td>
    				<td>登录名称</td><td  style="width:100px"><input  name="loginname"  style="width:80px"/></td>    				
    				<td>登录密码</td><td  style="width:100px"><input  name="loginpass"   style="width:80px"/></td>
    				<td>真实姓名</td><td  style="width:100px"><input  name="username"  style="width:80px"/></td>
    				<td ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="queryUser()">查询</a></td>
    				<td  ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#searchuserform').form('clear')">清空</a></td>
    			</tr>    			
    		</table>    
    		</form>	
 		</div>
 	</div>
 	
 	<!-- 修改界面 -->
    <div id="updateuserwin" class="easyui-dialog" data-options="modal:true,title:'修改用户',closed:true,width:560,height:420,buttons:[
    	{text:'修改',handler:function(){   
    		var selrolesid = '';
    		$('#selroles div[id]').each(function(){
    			selrolesid+=$(this).attr('id')+','
    		});
    		if(selrolesid.length>0){
    			selrolesid = selrolesid.substring(0,selrolesid.length-1);
    		} 	
    		$('#selrolesid').val(selrolesid);
    		var param = $('#updateuserform').serialize();
    		$.post('user!updateUser.action?'+param,function(obj){  
    				$('#updateuserwin').dialog('close');  				    				
    				if(obj.result){
    					//是页面更新
    					$('#listuserstab').datagrid('reload');
    				}
    				$.messager.alert('消息',obj.msg);
    		},'json');	    		    		
    	}},
    	{text:'重置',handler:function(){
    		updateUser('',updateUserRowIndex);
    	}}
    ]" style="padding:5px;overflow:hidden">
    	<form id="updateuserform" class="easyui-form" method="post">
    		<input type="hidden" name="selrolesid" id="selrolesid"/>
    		<div style="padding-left:15px;padding-top:8px;">
    			<div>    		
		    		<div style="float:left">
			    		<table class="updateusertable" style="line-height:30px">
			    			<tr>
			    				<td>用户编号</td><td><input id='userid' name="userid" class="easyui-validatebox" required="true" readonly="true"/></td>
			    			</tr>
			    			<tr>
			    				<td>登录名称</td><td><input id="loginname" name="loginname" class="easyui-validatebox" required="true"/></td>
			    			</tr>
			    			
			    		</table>
			    	</div>
			    </div>
			    <div style="float:left;margin-left:20px;">
		    			<table class="updateusertable" style="line-height:30px">
		    				<tr>
			    				<td>登录密码</td><td><input id="loginpass" name="loginpass"  class="easyui-validatebox" required="true"/></td>
			    			</tr>
			    			<tr>
			    				<td>真实姓名</td><td><input id="username" name="username" class="easyui-validatebox" required="true" /></td>
			    			</tr>
		    			</table>	
		    	</div>
		    </div>
    	</form>
    	<div style="height:220px;margin-top:10px;padding-left:5px">
	    			<div style="float:left;width:230px;height:200px">
	    				未选角色
	    				<div id="unselroles" style="border:1px solid black;margin-top:3px;width:225px;height:160px;border:1px solid #99BBE8;overflow:auto">
	    					<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">	    					
		    					<div class="select_unsel" onclick="this.className = this.className=='select_unsel'?'select_sel':'select_unsel'">aaa</div>
	    					</div>
	    					<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">	    					
		    					<div class="select_unsel" onclick="this.className = this.className=='select_unsel'?'select_sel':'select_unsel'">bbb</div>
	    					</div>
	    					<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">	    					
		    					<div class="select_unsel" onclick="this.className = this.className=='select_unsel'?'select_sel':'select_unsel'">ccc</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div style="float:left;width:30px;height:200px;margin-left:4px;margin-right:4px;padding-top:45px">
	    				<p><a href="javascript:move('unselroles','selroles')">--></a></p>
	    				<p><a href="javascript:selAll('unselroles');move('unselroles','selroles')">-->></a></p>
	    				<p><a href="javascript:move('selroles','unselroles')">&lt;--</a></p>
	    				<p><a href="javascript:selAll('selroles','unselroles');move('selroles','unselroles')">&lt;&lt;--</a></p>
	    				
	    			</div>
	    			<div style="float:left;width:230px;height:200px;margin-left:5px">
	    				已选角色
	    				<div id="selroles" style="border:1px solid black;margin-top:3px;width:225px;height:160px;border:1px solid #99BBE8;overflow:auto">
	    					
	    				</div>
	    			</div>
	    		</div>
    </div>
    
    <!-- 新加界面 -->
    <div id="adduserwin" class="easyui-dialog" title="添加用户" 
    	data-options="buttons:'#adduserwintoolbar',width:560,height:420,modal:true,closed:true,onClose:function(){
    		$('#unselroles2').empty();
    		$('#selroles2').empty();
    	}"
    	style="padding:5px"
    	>
    	<form id="adduserform" class="easyui-form" method="post">    		
    		<input type="hidden" name="selrolesid" id="selrolesid2"/>
    		<div style="padding-left:15px;padding-top:8px;">
    			<div>    		
		    		<div style="float:left">
			    		<table class="addusertable" style="line-height:30px">			    			
			    			<tr>
			    				<td>登录名称</td><td><input id="loginname" name="loginname" class="easyui-validatebox" required="true"/></td>
			    			</tr>
			    			<tr>
			    				<td>登录密码</td><td><input id="loginpass" name="loginpass"  class="easyui-validatebox" required="true"/></td>
			    			</tr>
			    		</table>
			    	</div>
			    </div>
			    <div style="float:left;margin-left:20px;">
		    			<table class="addusertable" style="line-height:30px">
			    			<tr>
			    				<td>真实姓名</td><td><input id="username" name="username" class="easyui-validatebox" required="true" /></td>
			    			</tr>
		    			</table>	
		    	</div>
		    </div>
    	</form>
    	<div style="clear:both"></div>
    	<div style="height:220px;margin-top:10px;padding-left:5px">
   			<div style="float:left;width:230px;height:200px">
   				未选角色
   				<div id="unselroles2" style="border:1px solid black;margin-top:3px;width:225px;height:160px;border:1px solid #99BBE8;overflow:auto">
   					<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">	    					
    					<div id='1' class="select_unsel" onclick="this.className = this.className=='select_unsel'?'select_sel':'select_unsel'">aaa</div>
   					</div>
   					<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">	    					
    					<div id='2' class="select_unsel" onclick="this.className = this.className=='select_unsel'?'select_sel':'select_unsel'">bbb</div>
   					</div>
   					<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">	    					
    					<div id='3' class="select_unsel" onclick="this.className = this.className=='select_unsel'?'select_sel':'select_unsel'">ccc</div>
   					</div>
   				</div>
   			</div>
   			<div style="float:left;width:30px;height:200px;margin-left:4px;margin-right:4px;padding-top:45px">
   				<p><a href="javascript:move('unselroles2','selroles2')">--></a></p>
   				<p><a href="javascript:selAll('unselroles2');move('unselroles2','selroles2')">-->></a></p>
   				<p><a href="javascript:move('selroles2','unselroles2')">&lt;--</a></p>
   				<p><a href="javascript:selAll('selroles2');move('selroles2','unselroles2')">&lt;&lt;--</a></p>
   				
   			</div>
   			<div style="float:left;width:230px;height:200px;margin-left:5px">
   				已选角色
   				<div id="selroles2" style="border:1px solid black;margin-top:3px;width:225px;height:160px;border:1px solid #99BBE8;overflow:auto">
   					
   				</div>
   			</div>
	    </div>
    	<div id="adduserwintoolbar">
    		<a class="easyui-linkbutton" onClick="
		//取得selrolesid,设置到hidden字段
		
		var arr = [];
    	$.each($('#selroles2 div[id]'),function(){
    			arr.push($(this).attr('id'));
    	});
    	var selrolesid = arr.join(',');		
		$('#selrolesid2').val(selrolesid);
		/*
		$('#adduserform').form('submit',
			{url:'user!addUser.action',
			success:function(data){
				var obj = eval('('+data+')');
				$('#adduserwin').dialog('close',true);
				if(obj.result){
					//刷新表格
					$('#listuserstab').datagrid('reload');
				}
				$.messager.alert('提示',obj.msg);
			}});*/
		if($('#adduserform').form('validate')){
		var a = $('#adduserform').serialize();
			$.post('user!addUser.action?'+a,function(obj){				
				$('#adduserwin').dialog('close',true);
				if(obj.result){
					//刷新表格
					$('#listuserstab').datagrid('reload');
				}
				$.messager.alert('提示',obj.msg);
			});
		}
			">添加</a>&nbsp;&nbsp;    		
    	</div>
    </div>
    <!-- 导入excel表格，批量添加用户 -->
    <div id="importuserexcel" title="批量添加(excel)"  data-options="buttons:'#importuserexcelupload',width:650,height:480,modal:true,closed:true,
    	onBeforeClose:function(){
    					
    					$importuserexcelobj.uploadify('cancel','*');    					
  						$('#importuserexcelfilelist2').empty();
    	}" class="easyui-dialog">
    	<form method="post" action="" enctype="multipart/form-data">
	    	<div style="margin-left:3px"><div style="margin-top:3px"></div><input type="text" id="importuserbutton" />			
						<script type="text/javascript">
							//上传组件
							var $importuserexcelobj = $("#importuserbutton").uploadify({
								"uploader":"user!importuserexcel.action",
								"swf":"js/uploadify.swf",
								"removeTimeout":0,
								"width":80,
								"height":15,
								"buttonText":"选择文件",
								"queueID":"importuserexcelfilelist",								
								"auto":false,
								"removeCompleted":true,
								"fileObjName":"excelFile",
								"fileTypeExts":"*.xls;*.xlsx",
								"fileTypeDesc":"Excel文件",
								"onUploadSuccess":function(file,data,response){
									var obj = eval("("+data+")");									
									var fileid = file.id;
									var fileItem = document.getElementById(fileid);
																		
									//再提供删除方法
									/*
									var aObj = $(fileItem).find(".cancel a");
									aObj.attr("href","javascript:void(0)");
									aObj.click(function(){
										$importuserexcelobj.removeFileFunc(file);
									});
									*/
									//把服务器响应内容显示在fileitem上
									$(fileItem).find("span.data").html(" -- "+obj.msg);											
									if(obj.result){										
										//文件上传成功后，就复制一份显示在已上传成功div中
										var newItem = "<div class='nothandled' style='background:green;width:100%;height:35px;margin-bottom:3px;margin-right:3px;font-weight:bold;font-size:14px'>"+file.name+"</div>";
										$("#importuserexcelfilelist2").append(newItem);
									}
								}
								
							});
							//处理文件
							$("#handleuserfile").bind("click",function(a){
								var $divobjs  = $("#importuserexcelfilelist2 div.nothandled");
								if($divobjs.length>0){									
									$divobjs.each(function(i,obj){
										//alert($(obj).text())
										$.post("user!handleimportuserfile.action",{filename:$(obj).text()},function(rt){
											$("<div style='font-size:10px;font-weight:normal;color:white'>"+rt.msg+"</div>").appendTo($(obj));
											setTimeout(function(){
												$(obj).remove();
											},1000);
										});
									});
									//alert("complete...");
									//刷新表格
									$usertab.datagrid("reload");
								}
								else{
									$.messager.alert("通知",'您还没有上传任何文件.');
								}
								//$.post("user!handleimportuserfile.action",);
							});
							
							$importuserexcelobj.removeFileFunc = function(file){
								var filename = encodeURI(encodeURI(file.name));
								$.get("user!removeuploaduserexcel.action?filename="+filename,function(data){
									$("#"+file.id).find("span.data").html(" -- "+data.msg);
									//setTimeout(function(){
										alert("file.id="+file.id);
										$importuserexcelobj.uploadify("cancel",file.id);
										//$importuserexcelobj.uploadify("clearQueue")
									//},2000);
								});
							}
						</script>					
			</div>
			<div style="height:350px;width:620px;overflow:hidden">
			
				<div style="float:left;width:300px;height:100%;padding-left:10px">			
					待下载列表
			    	<div id="importuserexcelfilelist" style="border:1px solid #C1D3FB;width:290px;height:330px;overflow:auto"></div>
				</div>
				<div style="float:left;width:300px;height:100%;padding-left:10px">			
					已下载列表
			    	<div id="importuserexcelfilelist2" style="border:1px solid #C1D3FB;width:290px;height:330px;overflow:auto"></div>
				</div>
				
	    	</div>
			<div id="importuserexcelupload">
				<a  class="easyui-linkbutton" onclick="$importuserexcelobj.uploadify('upload','*')">上传文件</a>
				<a class="easyui-linkbutton" id="handleuserfile">导入文件内容</a>
			</div>				
    	</form>
    </div>
    
    
    
     <script>
     	var updateUserRowIndex;
     	function addUser(){     		
     		//初始化已选角色列表和未选角色列表
     		/*
     		 * 
     		 <div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">	    					
    					<div id='1' class="select_unsel" onclick="this.className = this.className=='select_unsel'?'select_sel':'select_unsel'">aaa</div>
   					</div> 
     		 */
     		 $('#adduserform input').val("");    		
     		var selroles = $("#selroles2").empty();
     		var unselroles = $("#unselroles2").empty();
     		
     		$.post("user!listUserSelRolesAndUnselRoles.action?userid=",function(data){
     			var selrolesArr = data.selRoles;
     			var unselrolesArr = data.unselRoles;
     			$.each(selrolesArr,function(){
     				var template = '<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">'+	    					
    					'<div id=\''+this.roleid+'\' class="select_unsel" onclick="this.className = this.className==\'select_unsel\'?\'select_sel\':\'select_unsel\'">'+this.rolename+'</div>'+
   					'</div>'; 
     				selroles.append(template);
     			});
     			$.each(unselrolesArr,function(){
     				var template = '<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">'+	    					
    					'<div id=\''+this.roleid+'\' class="select_unsel" onclick="this.className = this.className==\'select_unsel\'?\'select_sel\':\'select_unsel\'">'+this.rolename+'</div>'+
   					'</div>';
     				unselroles.append(template);
     			});
     		});
     		$("#adduserwin").dialog("open")
     		
     	}
     	function updateUser(userid,rowIndex){
     		updateUserRowIndex = rowIndex = parseInt(rowIndex);
     		var rows = $("#listuserstab").datagrid("getRows");
     		var rowData = rows[rowIndex];
     		
     		//加载次用户的已有角色，和未选角色
     		$.get("user!listUserSelRolesAndUnselRoles.action?userid="+userid,function(data){     			
     			var unselRoles = data.unselRoles;
     			var selRoles = data.selRoles;
     			//清空unselroles和selroles
     			var $unselrolesList = $("#unselroles").empty();
     			var $selrolesList = $("#selroles").empty();
     			//alert($unselrolesList.get(0).tagName)
     			
     			//选择的角色添加到div中
     			$.each(selRoles,function(){     				
     				var template = '<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">'+	    					
		    		'<div id="'+this.roleid+'" class="select_unsel" onclick="this.className = this.className==\'select_unsel\'?\'select_sel\':\'select_unsel\'">'+this.rolename+'</div>'+
	    			'</div>';
     				$selrolesList.append(template);     				
     			});
     			//未选角色添加到div中
     			$.each(unselRoles,function(){
     				var template = '<div style="padding:-top:2px;padding-left:2px;padding-right:2px;padding-bottom:1px">'+	    					
		    		'<div id="'+this.roleid+'" class="select_unsel" onclick="this.className = this.className==\'select_unsel\'?\'select_sel\':\'select_unsel\'">'+this.rolename+'</div>'+
	    			'</div>';
     				$unselrolesList.append(template);     				
     			});
     		});
     		
     		$("#updateuserform").form("load",rowData);
     		$("#updateuserwin").dialog("open",true);
     	}
     	$("#updateuserwin").dialog({onClose:function(){
     		var $unselrolesList = $("#unselroles").empty();
     		var $selrolesList = $("#selroles").empty();
     		
     	}});
     	function removeUser(userid,rowIndex){     		
     		var url = "user!removeUser.action?userid="+userid;     		
     		$.messager.confirm('对话框','确实要删除这个用户吗？',function(r){
     			if(r){
     				$.get(url,
     					function(obj){     						
     						if(obj.result){
     							//界面刷新
     							//$("#listuserstab").datagrid("deleteRow",rowIndex);
     							
     							//$usertab.datagrid("deleteRow",rowIndex);
     							$usertab.datagrid("reload");
     						}
     						$.messager.alert('提示',obj.msg);
     					}     				
     				);
     			}
     		}); 	
     	}
     	
  		var $usertab = $("#listuserstab").datagrid({
  			url:'user!listUsersJSON.action'
  			,toolbar:'#usertabtoolbar'
  			,columns:[[
  				{field:'userid',title:'用户编号',width:180},
  				{field:'loginname',title:'登录名称',width:250},
  				{field:'loginpass',title:'登录密码',width:250},
  				{field:'username',title:'真实姓名',width:180},
  				{field:'opt',title:'操作',formatter:function(value,rowData,rowIndex){
  					var userid = rowData.userid;  	
  					//alert(userid);				
 					return "<input type='button' value='删除' onclick='removeUser(\""+userid+"\",\""+rowIndex+"\")'/>"+
 					"&nbsp;&nbsp;<input type='button' value='修改' onclick='updateUser(\""+userid+"\",\""+rowIndex+"\")'/>";
  				}
  				}
  			]],
  			fit:true  			
  			,pagination:true
  			,loadMsg:'数据正在加载中...'
  			,rowNumbers:true
  			,singleSelect:true  	
  			,detailFormatter:function(index,row){
  			 	return '<div id="ddvuser-' + index + '" style="padding:5px 0;overflow:auto"></div>';    			
  			}
  			,view:detailview
  			,onExpandRow:function(index,row){
  				var userid = row.userid;  				
  				$("#ddvuser-"+index).panel({  					
  					height:140,
  					border:true,
  					cache:false,
  					href:"user!listUserRoles.action?userid="+userid,
  					onLoad:function(){
  						$usertab.datagrid("fixDetailRowHeight",index);  						
  					} 
  				});
  				 $usertab.datagrid('fixDetailRowHeight',index);  
  				
  			}
  		});
  		$.fn.serializeObject=function(){
  			var o = {};
  			var $arr = this.serializeArray();
  			$.each($arr,function(){
  				if(o[this.name]){
  					if(!o[this.name].push){
  						
  						o[this.name] = [o[this.name]];
  					}
  					o[this.name].push(this.value||"");  					
  				}
  				else{
  					
  					o[this.name] = this.value||"";
  				}  				
  			});
  			return o;
  		}
  		function queryUser(){
  			var str = $("#searchuserform").serialize();
  			//alert(str);
  			var $obj = $("#searchuserform").serializeObject();  			
  			$usertab.datagrid("load",$obj);  			
  		
  		}
 			
  	</script>
  </body>
</html>
