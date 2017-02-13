<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>新增分销商</title>
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
             		<form id="channelormSave">
                        <h4 class="ui-info-tit">分销商基本信息</h4>
                        <div class="ui-base-produceinfor">   							<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
							     <label class="ui-base-label ui-channel-base-label">分销商编号</label>
         						<span class="ui-base-data channel-basicdata" name="domainId">${domainInfoRequest.domainId}</span>
         					
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">分销商名称:</label>
         						<span class="ui-base-data channel-basicdata" name="domainName">${domainInfoRequest.domainName}</span>
                 			</div>
                 			<!--
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">分销商渠道类型:</label>
         						<span class="ui-base-data">
         							<#if domainInfoRequest.domainType == 10>
         								银行
         							<#elseif domainInfoRequest.domainType == 11>
         								第三支付
         							<#elseif domainInfoRequest.domainType == 12>
         								P2P
         							<#elseif domainInfoRequest.domainType == 20>
         								电商    
         							<#elseif domainInfoRequest.domainType == 1>
         								其它	
         							</#if>
         						</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">用户认证:</label>
         						<span class="ui-base-data" >
         							<#if domainInfoRequest.authSts == 1>
         								手机认证
         							<#elseif domainInfoRequest.authSts == 2>
         								邮箱认证
         							<#elseif domainInfoRequest.authSts == 4>
         								身份证认证
         							<#elseif domainInfoRequest.authSts == 64>
         								组织机构代码证认证
         							<#elseif domainInfoRequest.authSts == 128>
         								营业照认证
         							<#elseif domainInfoRequest.authSts == 256>
         								税务登记证认证
         							</#if>
         						</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">结算类型:</label>
         						<span class="ui-base-data">
         							<#if domainInfoRequest.settType == 10>
         								预付款
         							<#else>
         								后结算
         							</#if>
         						</span>
                 			</div>
                 			-->
                 			<span class="prod-edit-item channel-basicdata" name="authSts">${domainInfoRequest.domainType}</span>
                 			<span class="prod-edit-item channel-basicdata" name="settType">${domainInfoRequest.domainType}</span>
                 			<span class="prod-edit-item  channel-basicdata" name="domainType">${domainInfoRequest.domainType}</span>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">联系人:</label>
                                <span class="ui-base-data channel-basicdata" name="domainContacts">${domainInfoRequest.domainContacts}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">联系电话:</label>
                               <span class="ui-base-data">
                                   <em class="channel-basicdata" name="fixedPhone">${domainInfoRequest.fixedPhone}</em>
                                   <em class="channel-basicdata" name="phone">${domainInfoRequest.phone}</em>
                               </span>
                            </div> 
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">合作时间:</label>
                                <span class="ui-base-data">
                                    <em class="channel-basicdata" name="effTime">${domainInfoRequest.effTime?string('yyyy-MM-dd HH:mm:ss')}</em>至
                                    <em class="channel-basicdata" name="expTime">${domainInfoRequest.expTime?string('yyyy-MM-dd HH:mm:ss')}</em>
                                </span>
                            </div>           
                        </div>
                        <h4 class="ui-info-tit">分销商银行账户信息</h4>
                        <div class="ui-base-produceinfor">      
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结算账户开户行:</label>
                                <span class="ui-base-data channel-basicdata" name="depositBank">${domainInfoRequest.depositBank}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">结账账户户名:</label>
                                <span class="ui-base-data channel-basicdata" name="accountName">${domainInfoRequest.accountName}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结账账户账号:</label>
                                <span class="ui-base-data channel-basicdata" name="accountNo">${domainInfoRequest.accountNo}</span>
                            </div> 
                             
                        </div>
                        <div class="ui-btn-double">
                            <input type="button" value="保存" class="ui-btn-blue ui-submit" id="baseSaveInfor"/>
                            <input type="button" value="返回修改"  class="ui-btn-grey ui-page-back"/>
                        </div>
                    </form>
                </div>	
         	</div>
    	</div>
    	<!--提示添加成功start-->
            <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
                <h3 class="ui-dlg-tit" id="titMessage" >分销商新增成功！</h3>
            </div>
        <!--提示添加成功end-->
        <!--添提示添加失败-->  
  		<div id="dlgFailure" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
             <h3 class="ui-dlg-tit">分销商信息编辑失败！</h3>
    		<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
        </div>    
	</div>

	<script>
	$(function(){
		
	
         $("#baseSaveInfor").click(function(event) {
         	var arrsinfor = $(".channel-basicdata");
         	
         	$.ajax({
         		url : '${base}/channelmanager/addDomainInfos',
         		type :　'post',
         		data : getString(arrsinfor),
         		dataType : "json",
         		success : function(data){
         		
         			//如果返回一个字符串则提示成功否则提示失败
         			if(data.success == "true"){
         				showAlert('dlg');
	            		setTimeout(function(){
	            			
	            			//返回到信息管理的页面
	            			location.href="${base}/channelmanager/channelinformanager";
	            		},1000)
         			}else{
         				showAlert("dlgFailure");
         			}
         			
         		}
         	})              
                
        });
		
		$(".ui-page-back").click(function(){
			
			history.back();
			$("#startChannelDateTime").datebox('setValue', '6/1/2012');
		})
    })
	
	</script>
</body>
</html>