<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>业务管理</title>
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
	<script type="text/javascript" src="/js/jquery.form.js"></script>
</head>
<body>
<div id="page-form">
<div class="ui-main-container">

  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="" >
			<div class="ui-info-wrap">
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			            <tr class="platform-part">
				            <td class="ui-oddtd">业务编号：</td>
				            <td>
				            	${service?if_exists.serviceId}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">业务名称：</td>
				            <td>
				            	${service?if_exists.serviceName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td>
				            <#if service.serviceSts == 0>下架</#if>
				            <#if service.serviceSts == 10>上架</#if>
				            <#if service.serviceSts == -10>锁定</#if>
				            <#if service.serviceSts == -11>禁用</#if>
				            </td>
				          </tr>
				         
				          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				          	${service.effTimeStr} 	至  ${service.expTimeStr}
				            </td>
				                
				          </tr>
				          
				          <tr class="platform-part">
				            <td class="ui-oddtd">服务时间：</td>
				            <td>
				          	${service.serviceBeginTime} 	至  ${service.serviceEndTime}
				            </td>
				          </tr>
						  </tbody>
		      		</table>
				
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
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
 
</script>
</body>
</html>