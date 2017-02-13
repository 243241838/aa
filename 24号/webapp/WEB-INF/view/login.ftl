<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>增值业务管理平台-登录</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="stylesheet" href="/seaway-ebao-admin-server/css/base.css">
	<link rel="stylesheet" type="text/css" href="/seaway-ebao-admin-server/seaway-ebao-admin-server/css/style.css">
	<link rel="stylesheet" type="text/css" href="/seaway-ebao-admin-server/css/use.css">
	<link rel="stylesheet" type="text/css" href="/seaway-ebao-admin-server/css/validationEngine.jquery.css">
	<script src="/seaway-ebao-admin-server/js/placeholders.js"></script>
	<script type="text/javascript" src="/seaway-ebao-admin-server/js/jquery.min.js"></script>
	<script type="text/javascript" src="/seaway-ebao-admin-server/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/seaway-ebao-admin-server/js/plugins.js"></script>
	<script type="text/javascript" src="/seaway-ebao-admin-server/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/seaway-ebao-admin-server/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
      $(document).ready(function(){
		$("#login-form").validationEngine({
			maxErrorsPerField: 1
		});
	  });
    </script>
</head>
<body>
	<div class="login-out">
		<div class="login-in">
			<div class="login-bg">
				<img class="icon" src="/images/l_logo.png" alt="">
				<div class="login-bg-form">
					<h2 class="tit">增值业务管理平台</h2>
					<!---->
					<form class="ui-login-right-form" id="login-form" action="j_spring_security_check" method="post">
		            <div class="ui-login-item">
		            	<label>帐号</label>
		            	<input type="text" name="username" class="easyui-validatebox ui-login-input" 
		            	       data-options="required:true,validType:['letter']" missingMessage="请输入用户名" placeholder="请输入"/>
		            </div>
		            <div class="ui-login-item">
		            	<label>密码</label>
		            	<input type="password" name="password" class="easyui-validatebox ui-login-input"  missingMessage="请输入密码" placeholder="请输入"/></div>
		            <div class="ui-login-item">
		            	<label>验证码</label>
		            	<input type="text" name="validateCode" class="ui-login-dinput" placeholder="请输入"/>
		            	<img src="images/randImage.jsp" id="randImage" onclick="changeImage();"/>
		            </div>
		            <div class="ui-login-item">
		            	<label> </label>
		            	<input type="checkbox" class="ui-ckbox"/><label class="ui-remb">记住用户名</label>
		            	<input type="submit" value="登录"  class="ui-l-sub">
		            </div>
		          </form>
					
					<!--
					<form action="j_spring_security_check" method="post" class="ui-login-form" id="login-form">
						<div class="ui-l-item ui-login-error" id="errorMsg"></div>
						<div class="ui-l-item">
							<i class="icon user"></i>
							<input class="validate[required] ui-l-input" type="text" name="username" dataType="reqUserName" placeholder="用户名" maxlength=40 value="${username?if_exists}">
						</div>
						<div class="ui-l-item">
							<i class="icon psd"></i>
							<input class="validate[required] ui-l-input" type="password" name="password" dataType="reqPwd" autocomplete="off"  display="密码" placeholder="密码" value="${password?if_exists}">
						</div>
						<div class="ui-l-item fn-clear">
							<i class="icon code"></i>
							<input class="validate[required] fn-left ui-l-input ui-short-input"  dataType="reqCode" name="validateCode" type="text" maxlength="4" placeholder="验证码">
							<img class="fn-right code-img" src="images/randImage.jsp" id="randImage" onclick="changeImage();" src=""/>
						</div>
						<div class="ui-l-item">
							<input class="ui-l-sub" type="submit" value="登 录">
						</div>
					</form>
					-->
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			if(self.frameElement&&self.frameElement.tagName=="IFRAME"){
	             window.parent.location.reload();
	         }
		});
		var result = '${RequestParameters.error}';
		var codeerror = '${errorMsg}';
		if(result == 'true' && codeerror != 'randCodeError'){
			$("#errorMsg").text("您输入的信息有误，若忘记密码请联系管理员。");
		}
		if(codeerror == 'randCodeError'){
			$("#errorMsg").text("验证码错误!");
		}
		
	</script>
</body>
</html>