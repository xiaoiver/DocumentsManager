$(document).ready(function(){
	/**
	 * 为下拉菜单添加响应函数
	 * @param currentId 链接id
	 * @param id documentTypeId
	 * @param name
	 * @param props description字段
	 * 数据表document_type中description字段记录每种文献的特殊字段，
	 * 如图书是"editor:编辑,isbn:ISBN"，
	 * 暂时这样，后面考虑使用单独的一张表存储，方便管理员修改
	 */
	function addOnClickFunc(currentId, id, name, props){
		$("#"+currentId).click(function(){
			$("#documentTypeName").text(name);//显示当前文献类型
			$("#createDocumentForm").attr("action","document/createDocument.action?documentTypeId="+id+"");//通过form的action传文献类型id
			$(".addedInput").remove();//移除所有添加的input
			var allTypes = props.split(",");//暂时使用","和":"分隔，后面考虑使用一张单独的数据表记录每种文献的特殊字段
			for(var i=0; i<allTypes.length; i++){
				currentType = allTypes[i].split(":");
				$("#buttons").before("<div class='addedInput input-group'>"
						+"<input type='text' name='"+currentType[0]+"' id='"+currentType[0]+"' class='form-control' data-required />"
						+"<span class='input-group-addon glyphicon glyphicon-asterisk'>"
						+" "+currentType[1]
						+"</span></div>");
			}
			
			/*****为新添加的字段添加表单验证*****/
			$("#createDocumentForm").validate({
				onKeyup : true,
				eachValidField : function() {
					$(this).closest('div').removeClass('has-error').addClass('has-success');
				},
				eachInvalidField : function() {
					$(this).closest('div').removeClass('has-success').addClass('has-error');
				}
			});
		});
	}
	
	/*****加载文献类型*****/
	$.ajax({
		url: "document/listDocumentTypes.action",
	}).done(function(data){
		var documentTypes = data.documentTypes;
		for(var i=0;i<documentTypes.length;i++){
			var currentId="dt-"+documentTypes[i].documentTypeId+"-Link";
			$("#documentTypeList").append("<li><a href='javascript:void(0)' id='"
					+currentId
					+"'>"
					+documentTypes[i].name
					+"</a></li>");
			addOnClickFunc(currentId,documentTypes[i].documentTypeId,documentTypes[i].name,documentTypes[i].description);
		}
	});
	
	/*****表单验证*****/
	$("#createDocumentForm").validate({
		onKeyup : true,
		eachValidField : function() {
			$(this).closest('div').removeClass('has-error').addClass('has-success');
		},
		eachInvalidField : function() {
			$(this).closest('div').removeClass('has-success').addClass('has-error');
		}
	});
});