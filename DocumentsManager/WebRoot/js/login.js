$(document).ready(function(){
  $("#password").hide();
  $("#txt").show();
  $("#username").val("请输入用户名");
  
  
  $("#username").blur(
    function(){
      if($("#username").val()==""){
        $("#username").val("请输入用户名");
      }
    }
  ).focus(function(){
    if($("#username").val()=="请输入用户名"){
      $("#username").val("");
    }
  });
  
  $("#password").blur(
    function(){
      if($("#password").val()==""){
        $("#password").hide();
        $("#txt").show();
      }
    }
  );

  $("#txt").focus(function(){
    $("#password").show().focus();
    $("#txt").hide();
  });
  
  /*登录*/
  $("#errorBlock").css("visibility","hidden");
  var loginDialog = $("#loginDialog").dialog({
	  autoOpen: false,
	  modal: true,
	  height: 300,
	  width: 500,
	  draggable: false,
	  position: "center"
  });
  
  if($("#loginError").val()=="error"){
	  loginDialog.dialog("open");
	  $("#errorBlock").css("visibility","visible");
	  $("#username").focus();
  }
  
  $("#loginLink").click(function(){
	  loginDialog.dialog("open");
  });
  
  $("#loginSubmitBtn").submit(function(){
	  loginDialog.dialog("close");
  });
  
  /*注册*/
  var regDialog = $("#regDialog").dialog({
	  autoOpen: false,
	  modal: true,
	  height: 300,
	  width: 500,
	  draggable: false,
	  position: "center"
  });
  
  $("#registerLink").click(function(){
	  regDialog.dialog("open");
  });
  
  $("#registerSubmitBtn").submit(function(){
	  regDialog.dialog("close");
  });
  
  /**/
  
	$( "#rerun" )
	  .button()
	  .next()
	    .button({
	      text: false,
	      icons: {
	        primary: "ui-icon-triangle-1-s"
	      }
	    })
	    .click(function() {
	      var menu = $( this ).parent().next().show().position({
	        my: "left top",
	        at: "left bottom",
	        of: this
	      });
	      $( document ).one( "click", function() {
	        menu.hide();
	      });
	      return false;
	    })
	    .parent()
	      .buttonset()
	      .next()
	        .hide()
	        .menu();
});