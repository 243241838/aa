<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>秘钥管理-设置</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
</head>
<body>
<div id="page-form">
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
       <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post"  action="${action?if_exists}" >
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit"> 渠道基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">渠道ID：</td>
				            <td>
				              <input id="getRoleId" type="hidden" name="domainId" value="${domain?if_exists.domainId}"/>
				               ${domain?if_exists.domainId}
				            </td>
				            <td></td>
				            <td></td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道名称：</td>
				            <td>
				              <input id="domainName" type="hidden" name="domainName" value="${domain?if_exists.domainName}"/>
				              ${domain?if_exists.domainName}
				            </td>
				            <td></td>
				            <td></td>
				          </tr>
						  </tbody>
		      		</table>
				</div>
				<h3 class="ui-info-tit"> 渠道密钥信息</h3>
				<div class="ui-infobg" id="setkeys">
					<table class="ui-center-tab" >
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td colspan="3">
				            <input id="effTime" name="effTimeStr" class="easyui-datebox" value="${countDayBegin}" validType="mdM['#effTime']">
					<em>至</em>
					<input id="expTime"   name="expTimeStr"   class="easyui-datebox" value="${countDayEnd}" validType="mdM['#expTime']">
				            </td>
				          </tr>
				          
				          <tr class="platform-part">
				            <td class="ui-oddtd">密钥：</td>
				            <td>
				             <input type="hidden" name="aests" value="0"/>
				                <input id='publicKey' 　  type="text" maxlength=4000  class="validate[required,custom[typeName]] ui-dinput"   name="publicKey" />
				            </td>
				            <td></td>
				            <td></td>
				          </tr>
						  </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <input type="submit" value="下一步" class="ui-red-btn ui-pos3"/>
	      
	    </div>
		</form>
	</div>
</div>
</div>
<div id="page-result" style="display:none"></div>
<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
<script>
  $(document).ready(function(){
     
	 $("#editMerch").validationEngine({
		maxErrorsPerField: 1
	});
	
	 $("body").delegate('#back', 'click', function(event) {
            $("#page-form").show();
            $("#page-result").hide().empty();
      });
    $('#editMerch').ajaxForm({
        target: '#page-result',
        success: function() {
            $("#page-form").hide();
            $('#page-result').show();
        }
    });
 });
 
 function changelist(value){
 if(value==1){   
   document.getElementById("styletype").style.display="";
 }else{
   document.getElementById("styletype").style.display="none";
 }
 }
 
$(document).ready(function() {
	var cou=0;
	$("#add").click(function() {  // add为添加input的id
        cou++;
		var divTest = $(this).parent();  //获取div
                  var newDiv = divTest.clone(true);
	$('#hiddenvalue').val(cou);
		divTest.after(newDiv);
		
                 });
	$("#del").click(function() { // del为删除input的id
		$(this).parent().remove();
	});
	
});
</script>
</body>
</html>