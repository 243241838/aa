<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>代理人信息</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
        <div class="ui-crumbs" id="crumbs">
        	 <#include "/common/include/power.ftl">
        </div>
        <div class="ui-info-main">
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
             		<form method="post" action="${base}/agent/addSalesman">
                        <h4 class="ui-info-tit">分销商基本信息</h4>
                        <div class="ui-base-produceinfor">
                        	<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
							     <label class="ui-base-label ui-channel-base-label">代理ID:</label>
         						<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="salesamanId" data-options="required:true,validType:['numLetChina','maxlen[20]','ajaxSalesmanID',]" missingMessage="请输入代理ID" />
                                </span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">代理账号:</label>
             					<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="salesamanUser" data-options="required:true,validType:['numLetChina','maxlen[20]','ajaxSalesmanNumbere',]" missingMessage="请输入代理账号" />
                                </span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">代理人名称:</label>
             					<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="salesamanName" missingMessage="请输入代理人名称" />
                                </span>
                 			</div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">代理所属渠道:</label>
                                <span class="ui-base-data channel-basicdata" name="domainId">
                                	<select class="listsele" name="domainId" id="domainIdId" >
                                		<#list domainIdList as domainId>
                                			<option value=${domainId}>${domainId}</option>
                                		</#list>
									</select>
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">代理人状态:</label>
                                <span class="ui-base-data channel-basicdata" name="salesamanSts">
                                	<select class="listsele" name="salesamanSts" id="salesamanStsId" >
										<option value="10">正常</option>
										<option value="-10">禁用</option>
										<option value="-11">后台冻结</option>
										<option value="-12">密码错冻结</option>
										<option value="-13">登录异常冻结</option>
									</select>
                                </span>
                            </div> 
                        </div>
                       
                        <div class="ui-btn-double">
                            <input type="button" value="下一步" class="ui-btn-blue ui-submit" id="channelBaseInfor"/>
                            <a href="${base}/agent/saleManView"><input type="button" value="取消"  class="ui-btn-grey ui-back"/></a>
                        </div>
                    </form>
                </div>	
         	</div>
    	</div>
    	
	</div>

<script>
$(function(){
	validExtend();
	var methods = {
		init : function(){
		$("#channelBaseInfor").click(function(event) {
			var form = $(this).parents("form"),isflag = true,str = '';
			//所有基本信息都输入提交
			if(form.form('validate') && isflag){
				form.submit();
			}   
			});
		}
	}

	methods.init();

})

</script>	
</body>
</html>