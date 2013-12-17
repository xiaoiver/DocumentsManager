$(document).ready(function(){
	/*****表单验证*****/
	$('#registerForm').validate({
		onKeyup : true,
		eachValidField : function() {
			$(this).closest('div').removeClass('has-error').addClass('has-success');
		},
		eachInvalidField : function() {
			$(this).closest('div').removeClass('has-success').addClass('has-error');
		},
		conditional : {
			confirm : function() {
				return $(this).val() == $('#registerForm #password').val();
			}
		}
	});
	
	var rightUserType = parseInt($("#rightUserType").val());
	var registerError = $("#registerError").val();
	
	/*****加载用户类型*****/
	$.ajax({
		url: "user/listUserTypes.action",
	}).done(function(data){
		var userTypes = data.userTypes;
		for(var i=0;i<userTypes.length;i++){
			if(userTypes[i].name != "管理员"){
				if(userTypes[i].userTypeId == rightUserType){
					$("#userTypeList").append("<input type='radio' name='userType' checked='true' value='"+userTypes[i].userTypeId+"' />"+userTypes[i].name);
				}else{
					$("#userTypeList").append("<input type='radio' name='userType' value='"+userTypes[i].userTypeId+"' />"+userTypes[i].name);
				}
			}
		}
		
		if(registerError == "userExist"){
			$("#errorBlock").append("该用户名已被使用");
			$("#errorBlock").css("visibility","visible");
			$("#errorBlock").alert();
			$("#username").focus();
		}
	});
});