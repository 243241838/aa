<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商户类别风控管理-设置</title>
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
		<!--<a class="crumbs-link" href="#">运营管理 <span>></span></a>
		<a class="crumbs-link" href="#">风控管理 <span>></span></a>
		<span class="crumbs-tit">商户类别风控管理</span>-->
	 </div>
     <div class="ui-info-content">  
     <form id ="editUserTypeNext" method="post" action="/runManage/sellerTypeRisk/confirm" >       
		<div class="ui-info-wrap">
           	<h3 class="ui-info-tit">设置商户类别收银限额</h3>
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
	             ${userLevelExtendMdl.levelName}
	             <input type="hidden" name="levelName" data-unique="levelName" value="${userLevelExtendMdl.levelName}"/>
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">日收银限额：</td>
	            <td>
	             <input type="text" name="dayMoneyYuan" dataType="reqDay" data-valid="minDayM" id="dayMoneyYuan" value="${userLevelExtendMdl.dayMoneyYuan}" data-valid="minMoney" class="validate[required,custom[money],min[0.01],max[9999999999]] ui-dinput qfw"/>
	            	 元
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">月收银限额：</td>
	            <td>
	            <input type="text" name="monthMoneyYuan"  dataType="reqMonth" data-valid="maxDayM" id="monthMoneyYuan" value="${userLevelExtendMdl.monthMoneyYuan}" data-valid="maxMoney" class="validate[required,custom[money],min[0.01],max[9999999999]] ui-dinput qfw"/>
	            	 元
	            </td>
	          </tr>
		      </tbody>
		   </table>
	       </div>
	      </div>
		  
	      <div class="ui-submit-warp">
	        <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	        <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
	      </div>
	    </form>
       </div>
	</div> 
</body>
</html>