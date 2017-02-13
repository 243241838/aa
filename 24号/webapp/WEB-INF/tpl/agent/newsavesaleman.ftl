<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>新增代理人</title>
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
							     <label class="ui-base-label ui-channel-base-label">代理ID</label>
         						<span class="ui-base-data channel-basicdata" name="salesamanId">${salesmanRequest.salesamanId}</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">代理账号:</label>
         						<span class="ui-base-data channel-basicdata" name="salesamanUser">${salesmanRequest.salesamanUser}</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">代理人名称:</label>
         						<span class="ui-base-data channel-basicdata" name="salesamanName">${salesmanRequest.salesamanName}</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">代理所属渠道:</label>
         						<span  name="domainId" class="ui-base-data channel-basicdata fn-hide" >${salesmanRequest.domainId}</span>
         						<span class="ui-base-data channel-data" name="telcomCode">
         							${salesmanRequest.domainId}
         						</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
             					<label class="ui-base-label ui-channel-base-label">代理人状态:</label>
         						<span  name="salesamanSts" class="ui-base-data channel-basicdata fn-hide" >${salesmanRequest.salesamanSts}</span>
         						<span class="ui-base-data channel-data" name="telcomCode">
         							<#assign x = '${salesmanRequest.salesamanSts}'>
         								<#if x == '10'>
         									正常
         								<#elseif x == '-10'>
         								 	禁用
         								 <#elseif x == '-11'>
         								 	后台冻结
         								 <#elseif x == '-12'>
         								 	密码错冻结
         								 <#elseif x == '-13'>
         								 	登录异常冻结
         							</#if>
         						</span>
                 			</div>
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
                <h3 class="ui-dlg-tit" id="titMessage" >代理人新增成功！</h3>
            </div>
        <!--提示添加成功end-->
        <!--添提示添加失败-->  
  		<div id="dlgFailure" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
             <h3 class="ui-dlg-tit">代理人信息编辑失败！</h3>
    		<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
        </div>    
	</div>
	<script>
	$(function(){
		
	
         $("#baseSaveInfor").click(function(event) {
         	var arrsinfor = $(".channel-basicdata");
         	
         	$.ajax({
         		url : '${base}/agent/addSalesmanInfo',
         		type :　'post',
         		data : getString(arrsinfor),
         		dataType : "json",
         		success : function(data){
         		
         			//如果返回一个字符串则提示成功否则提示失败
         			if(data.success == "true"){
         				showAlert('dlg');
	            		setTimeout(function(){
	            			//返回到信息管理的页面
	            			location.href="${base}/agent/saleManView";
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