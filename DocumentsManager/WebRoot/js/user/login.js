$(document).ready(function(){
	/**
	 * 保存信息码和对应的信息
	 */
	var messageArray = new Array();
	messageArray['wrong-username']="该用户不存在";
	messageArray['wrong-password']="密码错误";
	
	/**
	 * 在messageBlock中显示反馈信息
	 * @param msgCode 信息码
	 * @param flag 0表示成功信息，1表示错误信息，2表示警告信息
	 */
	function showMessage(msgCode, flag){
		$("#messageBlock").addClass("alert");
		switch(flag){
		case 0:
			$("#messageBlock").addClass("alert-success");
			break;
		case 1:
			$("#messageBlock").addClass("alert-danger");
			break;
		case 2:
			$("#messageBlock").addClass("alert-warning");
			break;
		default:
			$("#messageBlock").addClass("alert-warning");
		}
		
		$("#messageBlock").append(messageArray[msgCode]);
		setTimeout(function(){
			$("#messageBlock").fadeOut("slow");
			$("#messageBlock").removeClass();
			$("#messageBlock").html("");
		},3000);
	}
	
	var hiddenUsername = $("#hiddenUsername");
	var usernameInLogin = $("#loginDialog #username");
	var passwordInLogin = $("#loginDialog #password");
	passwordInLogin.hide();
	$("#txt").show();
	var rightUsername = hiddenUsername.val();
	if(rightUsername =="" || rightUsername == undefined){
		usernameInLogin.blur(
			function(){
				if(usernameInLogin.val()==""){
					usernameInLogin.val("请输入用户名");
			}
	    }
	).focus(function(){
	    if(usernameInLogin.val()=="请输入用户名"){
	    	usernameInLogin.val("");
	    }
	  });
  }else{
	  usernameInLogin.val(rightUsername);
  }
  
  passwordInLogin.blur(
    function(){
      if(passwordInLogin.val()==""){
    	  passwordInLogin.hide();
        $("#txt").show();
      }
    }
  );

  $("#txt").focus(function(){
	  passwordInLogin.show().focus();
    $("#txt").hide();
  });
  
  var errorMessage = $("#loginError").val();
	  
  if(errorMessage == "wrong-username"){
	  showMessage(errorMessage, 1);
	  usernameInLogin.focus();
  }else if(errorMessage == "wrong-password"){
	  showMessage(errorMessage, 1);
	  $("#txt").focus();
  }
});