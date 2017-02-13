<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-商户管理-商户类别管理-编辑</title>
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
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
	  $(document).ready(function(){        
			$("#editUserTypeNext").validationEngine({
				maxErrorsPerField: 1
			});
				moneyThousands();
				
		    var str=pad2('${userLevelExtendMdl.id}',6);
			$('span[data-str="str"]').text(str);
		});
	</script>
</head>
<body>
  <div class="ui-main-container">
	 <div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
	 </div>
     <div class="ui-info-content">  
     <form id ="editUserTypeNext" method="post" action="/userManage/sellTypeManage/updateSellTypeNext" >       
		<div class="ui-info-wrap">
           	<h3 class="ui-info-tit">商户类别信息</h3>
			<div class="ui-infobg">
			<table class="ui-center-tab">
	          <tbody>
	          <tr>
	            <td class="ui-oddtd">商户类别ID：</td>
	            <td>
	                <span data-str="str">${userLevelExtendMdl.id}</span>
	      		    <input type="hidden" name="id" data-unique="id" value="${userLevelExtendMdl.id}"/>
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">商户类别：</td>
	            <td>
	                <input type="text" name="levelName" id="levelName" dataType="reqSellType"  value="${userLevelExtendMdl.levelName}" maxlength=40 class="validate[required,custom[typeName],ajax2[ajaxMerchEditType]] ui-dinput"/>
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">日收银限额：</td>
	            <td>
	            	${userLevelExtendMdl.dayMoneyYuan} 元
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">月收银限额：</td>
	            <td>
	            	${userLevelExtendMdl.monthMoneyYuan} 元
	            </td>
	          </tr>
		      </tbody>
		   </table>
	       </div>
	      </div>
		  <input type="hidden" value="${userLevelExtendMdl.dayMoneyYuan}" name="dayMoneyYuan"/>
		  <input type="hidden" value="${userLevelExtendMdl.monthMoneyYuan}" name="monthMoneyYuan"/>
	      <div class="ui-submit-warp">
	        <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	        <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
	      </div>
	    </form>
       </div>
	</div> 
</body>
</html>