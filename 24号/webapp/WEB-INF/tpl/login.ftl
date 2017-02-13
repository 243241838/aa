<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>保险经纪管理平台</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/index.css">
	<script>
     
	</script>
</head>
<body style="overflow:hidden;">
	<div class="ui-login-body">
		<div class="sm-ui-header">
			<div class="sm-ui-operation-main">
				<span class="ui-welcome">欢迎您，请登录</span>
			</div>
		</div>
		<div class="ui-login-main">
			<div class="ui-logion-logo">
				<img src="${base}/resource/images/logo.png" width="60" height="58" />
				<img src="${base}/resource/images/logot.png" width="284" height="41" />
			</div>
			<div class="ui-login-form fn-clear">
				<div class="ui-poll-wrap">
          <h3>最新消息</h3>
          <p class="ui-blue-hr"></p>
          <div class="ui-poll-out">
	          <ul class="ui-poll-list fn-clear" id="scroll-list">
	          	<li>
	          		<label>暂无消息</label>
	          		<span></span>
	            </li>
	            <!--
		          	<li>
		          		<label>注册用户</label>
		          		<span>新增 5%</span>
		            </li>
							<li>
								<label>活跃用户</label>
								<span>新增 6%</span>
							</li>
							<li>
								<label>交易总量环比</label>
								<span>新增 5%</span>
							</li>
							<li>
	          		<label>注3册用户</label>
	          		<span>新增 5%</span>
	            </li>
							<li>
								<label>活3跃用户</label>
								<span>新增 6%</span>
							</li>
							<li>
								<label>交3易总量环比</label>
								<span>新增 5%</span>
							</li>
							-->
	          </ul>
	        </div>
          <p class="ui-blue-hr"></p>
          <div class="ui-triangle-bor"></div>
          <div class="ui-triangle"></div>

				</div>
        <div class="ui-login-right">
        	<span style="color:red;position:absolute;top:10px;" id="errorMsg"></span>
        	<form class="ui-login-right-form" id="login-form" action="j_spring_security_check" method="post">
		            <div class="ui-login-item">
		            	<label>帐号</label>
		            	<input type="text" name="username" class="easyui-validatebox ui-login-input" 
		            	       data-options="required:true,validType:['letter']" missingMessage="请输入用户名" placeholder="请输入" value="admin"/>
		            </div>
		            <div class="ui-login-item">
		            	<label>密码</label>
		            	<input type="password" name="password" class="easyui-validatebox ui-login-input"  required=true missingMessage="请输入密码" placeholder="请输入" value="86437666sw"/></div>
		            <div class="ui-login-item">
		            	<label>验证码</label>
		            	<input type="text" name="validateCode" class="ui-login-dinput"  placeholder="请输入"/>
		            	<img src="${base}/resource/images/randImage.jsp" id="randImage" onclick="changeImage();"/>
		            </div>
		            <div class="ui-login-item">
		            	<label> </label>
		            	<input type="checkbox" class="ui-ckbox" id="rembName"/><label class="ui-remb">记住用户名</label>
		            	<input type="button" value="登录"  class="ui-btn-blue" onclick="loginSubmit(this);">
		            </div>
		          </form>
        </div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script>
	var pollTime=0;
	$(function(){
		validExtend();
		$("#scroll-list").iScroll();
		if($.cookie('ebaouser')){
		  $('input[name="username"]').val($.cookie('ebaouser'));
		  $('#rembName').attr('checked',true);
		}
		//点击enter键登录
		$('body').keydown(function(){
		  if(event.keyCode==13){
			  $('.ui-btn-blue').trigger('click');
			}
		});
		
		
	});
	//验证码
	function changeImage(){
		$("#randImage").attr("src", "${base}/resource/images/randImage.jsp?r="+Math.random());
	}
	
	function loginSubmit(obj){
	    var f=$(obj).parents('form');
	    
	    if($('#rembName').is(':checked')){
	       var usname= $('input[name="username"]').val();
	       $.cookie('ebaouser',usname);
	    }else{
	       $.cookie('ebaouser', '');
	    }
	    if(f.form('validate')){
	        f.submit();
	    }
	}
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