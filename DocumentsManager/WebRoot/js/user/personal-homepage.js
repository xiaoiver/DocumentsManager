$(document).ready(function(){
	var activePanelName = $("#activePanel").val();
	if(activePanelName == "document"){
		$("#personalHomepageTab a[href='#documentPanel']").tab('show');
	}else{
		$("#personalHomepageTab a[href='#profilePanel']").tab('show');
	}
});