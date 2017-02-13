<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>无标题文档</title>
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
             		<form method="post" action="${base}/domain/sureAddDomainUserInfo">
                        <h4 class="ui-info-tit">渠道用户基本信息</h4>
                        <div class="ui-base-produceinfor">
                        	<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
							     <label class="ui-base-label ui-channel-base-label">账户:</label>
         						<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="username" data-options="required:true"  missingMessage="请输入账户" />
                                </span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">姓名:</label>
             					<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="realName" data-options="required:true"  missingMessage="请输入姓名" />
                                </span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">密码:</label>
             					<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="password" data-options="required:true,validType:['integer','length[6,8]']"  missingMessage="请输入密码" />
                                </span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">手机号:</label>
             					<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="mobile" data-options="required:true,validType:['phone','length[11]']" missingMessage="请输入手机号" />
                                </span>
                 			</div>
                 			<input type="hidden"  name="channelCode" value="${domainId}">
                        </div>
                       
                        <div class="ui-btn-double">
                            <input type="button" value="下一步" class="ui-btn-blue ui-submit" id="channelBaseInfor"/>
                            <a href="${base}/domain/userManager?domainId=${domainId}"><input type="button" value="取消"  class="ui-btn-grey ui-back"/></a>
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