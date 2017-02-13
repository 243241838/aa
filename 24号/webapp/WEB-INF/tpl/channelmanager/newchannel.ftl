<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>订单明细</title>
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
             		<form method="post" action="${base}/channelmanager/newsavechannel">
                        <h4 class="ui-info-tit">分销商基本信息</h4>
                        <div class="ui-base-produceinfor">
                        	<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">分销商编号:</label>
         						<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="domainId" data-options="required:true,validType:['integer','maxlen[6]','ajaxNumbere']" missingMessage="请输入分销商编号" />
                                </span>
                 			</div>
                 			<!--
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">分销商渠道类型:</label>
         						<span class="ui-base-data">
                                    <select class="ui-combobox" name="domainType" id="transaceAmount">
										<option value="10" selected>银行</option>
										<option value="11">第三支付</option>
										<option value="12">P2P</option>
										<option value="20">电商</option>
										<option value="1">其它</option>
									</select>
                                </span>
                 			</div>	
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">用户认证:</label>
         						<span class="ui-base-data">
                                	<select class="ui-combobox" name="authSts" id="transaceAmount">
										<option value="1" selected>手机认证</option>
										<option value="2">邮箱认证</option>
										<option value="4">身份证认证</option>
										<option value="64">组织机构代码证认证</option>
										<option value="128">营业照认证</option>
										<option value="256">税务登记证认证</option>
									</select>
                                </span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">结算类型:</label>
         						<span class="ui-base-data">
                                	<select class="ui-combobox" name="settType" id="transaceAmount">
										<option value="10" selected>预付款</option>
										<option value="20">后结算</option>
									</select>
                                </span>
                 			</div>	
                 			-->
                 			<input type="hidden" name="domainType" value="1">
                 			<input type="hidden" name="authSts" value="0">
                 			<input type="hidden" name="settType" value="10">
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">分销商名称:</label>
         						<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="domainName" data-options="required:true,validType:['numLetChina','maxlen[20]','ajaxChannelName',]" missingMessage="请输入分销商名称"/>
                                </span>
                 			</div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">联系人:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="domainContacts" value="" data-options="required:true,validType:['letchi','maxlen[10]']" missingMessage="请输入联系人" />
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">联系电话:</label>
                                <span class="ui-base-data ">
                                    <input class="clause-input ui-channel-inforspan ui-channel-phonemargin easyui-validatebox" type="text" name="fixedPhone" placeholder="固定" data-options="required:true,validType:['integer','length[12]']" missingMessage="请输入联系电话" />
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="phone" placeholder="手机" data-options="required:true,validType:['integer','length[11]']" missingMessage="请输入联系电话" />
                                </span>
                            </div> 
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey ui-month-base">
                                <label class="ui-base-label ui-channel-base-label">合作时间:</label>
                                <span class="ui-base-data">
                                    <input name="effTime" class="easyui-datetimebox ui-channel-inforspan" data-options="editable:false" vlaue=""  validType="md['#channelEndDateTime']" id="startChannelDateTime">
                                    <em>至</em>
                                  <input name="expTime" class="easyui-datetimebox ui-channel-inforspan" data-options="editable:false" vlaue="" validType="mdMs['#startChannelDateTime']" id="channelEndDateTime">
                                </span>
                               <span class="showMessage"></span>
                            </div>           
                        </div>
                        <h4 class="ui-info-tit">分销商银行账户信息</h4>
                        <div class="ui-base-produceinfor">      
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结算账户开户行:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="depositBank" value="" data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入结算账户户行" />
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">结账账户户名:</label>
                                <span class="ui-base-data"><input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="accountName" value="" data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入结算账名" /></span>
                                  <span class="showMessage"></span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结账账户账号:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="accountNo" value="" data-options="required:true,validType:['integer','maxlen[20]']" missingMessage="请输入结算账户账号" />
                                </span>
                            </div> 
                             
                        </div>
                        <div class="ui-btn-double">
                            <input type="button" value="下一步" class="ui-btn-blue ui-submit" id="channelBaseInfor"/>
                            <a href="${base}/channelmanager/channelinformanager"><input type="button" value="取消"  class="ui-btn-grey ui-back"/></a>
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

		//全局变量
		this.isflag = true;

		//验证的元素

		var timestart = $("#startChannelDateTime"),
			timeend = $("#channelEndDateTime"),
			accounttype = $("#accountType"),
			accountname = $("#accouontName"),
			accountnum =$("#accouontNumber"),
			isflag = true;


		$("#channelBaseInfor").click(function(event) {


			var datastart = timestart.datebox('getValue'),
				dataend = timeend.datebox('getValue'),
				target = timestart.parents(".ui-base-colwidth-business").find(".showMessage"),
				form = $(this).parents("form"),isflag = true,str = '';

			if(datastart == '' || dataend == ''){
				str = "请输入合作时间";
				isflag = false;
			}else{
				isflag = true;
			}
			target.html(str)

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