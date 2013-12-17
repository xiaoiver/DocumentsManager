$(document).ready(function(){

	function addOnClickFunc(currentId, id, name){
		$("#"+currentId).click(function(){
			$("#searchInput").attr("placeholder",name);
		});
	}
	
	/*****加载文献类型*****/
	$.ajax({
		url: "document/listDocumentTypes.action",
	}).done(function(data){
		var documentTypes = data.documentTypes;
		for(var i=0;i<documentTypes.length;i++){
			var currentId="dt-"+documentTypes[i].documentTypeId+"-SearchLink";
			$("#searchDocumentTypeList").append("<li><a href='javascript:void(0)' id='"
					+currentId
					+"'>"
					+documentTypes[i].name
					+"</a></li>");
			addOnClickFunc(currentId,documentTypes[i].documentTypeId,documentTypes[i].name);
		}
	});

});