<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>操作员权限设置</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/checkTree.js"></script>
</head>
<body>
 <div class="ui-info-box">
	<div class="ui-crumbs" id="crumbs">
	<#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">授权</span>-->
	</div>
	
	<form id ="editMerch" method="post" action="/operator/submitAuthRules" >
      <div class="ui-info-main  ui-info-wrap-tree">
        <h2 class="ui-info-tit">操作员信息</h2>
          <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">操作员ID：</label>
           		${user?if_exists.userId}
				<input type="hidden" name="userId" value="${user?if_exists.userId}"/>
           	</li>
           	<li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl">操作员姓名：</label>
           		${user?if_exists.userName}
				<input type="hidden" name="userName" value="${user?if_exists.userName}"/>
           	</li>
			<li class="ui-info-item">
           		<label class="ui-info-lbl">所属角色：</label>
           		${user?if_exists.roleName}
				<input type="hidden" name="roleName" value="${user?if_exists.roleName}"/>
           	</li>
           	<li class="ui-info-item fn-clear" >
           		<label class="ui-info-lbl authorize-name fn-left">授权资源：</label>
           		<div class="operate-allcheck authorize-list-item">
           			<input name="resourceIds" type="checkbox" class="aut-check" id="" value="">
           			<span class="aut-check-show"  id="allCheck"></span>全选
           			<input type="hidden" value="" id="allSonLen"/>
           		</div>
           		<table  width="80%" class="operate-resouce" border="1" borderColor="#b7b7b7" id="operateAuthor">
					<tr class="operate-list-item authorize-list-item">
						<td>产品</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 10>
					   					<#if itemIds == auditItems.itemId>
					   						<#break>
					   					</#if>
					   					<p>
					   					${auditItems.itemName}
					   					</p>
					   					<#assign itemIds = auditItems.itemId>
					   				</#if>
								</#list>
							</#if>
						</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 10>
					   					<#if auditItems.lastStep gt 0>
					   						<#if itemIds == auditItems.itemId>
						   						<#break>
						   					</#if>
					   						<p>
					           					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditItems.itemId)?if_exists}_1" <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 1>checked</#if> value="${(auditItems.itemId)?if_exists}_1" data-type="">
								            	<span class="aut-check-show aut-check-son <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 1>check-all</#if>"></span>初级审核
						           			</p>
						           			<#assign itemIds = auditItems.itemId>
							           </#if>
					   				</#if>
								</#list>
							</#if>
						</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 10>
					   					<#if auditItems.lastStep == 2>
					   						<#if itemIds == auditItems.itemId>
						   						<#break>
						   					</#if>
					       					<p>
					           					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditItems.itemId)?if_exists}_2" <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 2>checked</#if> value="${(auditItems.itemId)?if_exists}_2" data-type="">
								            	<span class="aut-check-show aut-check-son <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 2>check-all</#if>"></span>一级复审
									        </p>
									        <#assign itemIds = auditItems.itemId>
							           </#if>
					   				</#if>
								</#list>
							</#if>
						</td>
					</tr>
					<tr class="operate-list-item authorize-list-item">
						<td>渠道</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 20>
					   					<#if itemIds == auditItems.itemId>
					   						<#break>
					   					</#if>
					   					<p>
					   					${auditItems.itemName}
					   					</p>
					   					<#assign itemIds = auditItems.itemId>
					   				</#if>
								</#list>
							</#if>
						</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 20>
					   					<#if auditItems.lastStep gt 0>
					   						<#if itemIds == auditItems.itemId>
						   						<#break>
						   					</#if>
					   						<p>
					           					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditItems.itemId)?if_exists}_1" <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 1>checked</#if> value="${(auditItems.itemId)?if_exists}_1" data-type="">
								            	<span class="aut-check-show aut-check-son <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 1>check-all</#if>"></span>初级审核
						           			</p>
						           			<#assign itemIds = auditItems.itemId>
							           </#if>
					   				</#if>
								</#list>
							</#if>
						</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>	
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 20>
					   					<#if auditItems.lastStep == 2>
					   						<#if itemIds == auditItems.itemId>
						   						<#break>
						   					</#if>
					       					<p>
					           					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditItems.itemId)?if_exists}_2" <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 2>checked</#if> value="${(auditItems.itemId)?if_exists}_2" data-type="">
								            	<span class="aut-check-show aut-check-son <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 2>check-all</#if>"></span>一级复审
									        </p>
									        <#assign itemIds = auditItems.itemId>
							           </#if>
					   				</#if>
								</#list>
							</#if>
						</td>
					</tr>
					
					<tr class="operate-list-item authorize-list-item">
						<td>运营</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 30>
					   					<#if itemIds == auditItems.itemId>
					   						<#break>
					   					</#if>
					   					<p>
					   					${auditItems.itemName}
					   					</p>
					   					<#assign itemIds = auditItems.itemId>
					   				</#if>
								</#list>
							</#if>
						</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 30>
					   					<#if auditItems.lastStep gt 0>
					   						<#if itemIds == auditItems.itemId>
						   						<#break>
						   					</#if>
					   						<p>
					           					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditItems.itemId)?if_exists}_1" <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 1>checked</#if> value="${(auditItems.itemId)?if_exists}_1" data-type="">
								            	<span class="aut-check-show aut-check-son <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 1>check-all</#if>"></span>初级审核
						           			</p>
						           			<#assign itemIds = auditItems.itemId>
							           </#if>
					   				</#if>
								</#list>
							</#if>
						</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 30>
					   					<#if auditItems.lastStep == 2>
					   						<#if itemIds == auditItems.itemId>
						   						<#break>
						   					</#if>
					       					<p>
					           					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditItems.itemId)?if_exists}_2" <#if auditItems.auditUsers?if_exists && auditItems.auditStep == 2>checked</#if> value="${(auditItems.itemId)?if_exists}_2" data-type="">
								            	<span class="aut-check-show aut-check-son <#if auditItems.auditUsers?if_exists  && auditItems.auditStep == 2>check-all</#if>"></span>一级复审
									        </p>
									        <#assign itemIds = auditItems.itemId>
							           </#if>
					   				</#if>
								</#list>
							</#if>
						</td>
					</tr>
					
					<tr class="operate-list-item authorize-list-item">
						<td>理赔</td>
						<td>
							<#if auditItemsList?if_exists>
								<#assign itemIds = 0>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 40>
					   					<#if itemIds == auditItems.itemId>
					   						<#break>
					   					</#if>
					   					<p>
					   					${auditItems.itemName}
					   					</p>
					   					<#assign itemIds = auditItems.itemId>
					   				</#if>
								</#list>
							</#if>
						</td>
						<td>
							<#assign signOne = 0>
							<#assign auditRecordsOne = null>
							<#if auditItemsList?if_exists>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 40>
					   					<#if auditItems.lastStep gt 0>
					           				<#if auditItems.auditUsers?if_exists && auditItems.auditStep == 1>
					   							<#assign auditRecordsOne = auditItems>
						           				<#assign signOne = 1>
						           			</#if>	
							           </#if>
					   				</#if>
								</#list>
							</#if>
							<#if signOne == 1>
								<p>
			       					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditRecordsOne.itemId)?if_exists}_1" <#if auditRecordsOne.auditUsers?if_exists && auditRecordsOne.auditStep == 1>checked</#if> value="${(auditRecordsOne.itemId)?if_exists}_1" data-type="">
					            	<span class="aut-check-show aut-check-son <#if auditRecordsOne.auditUsers?if_exists && auditRecordsOne.auditStep == 1>check-all</#if>"></span>初级审核
			       				</p>
		       				<#else>
		       					<p>
			       					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="12_1"  value="12_1" data-type="">
					            	<span class="aut-check-show aut-check-son"></span>初级审核
			       				</p>
							</#if>
						</td>
						<td>
							<#assign sign = 0>
							<#assign auditRecords = null>
							<#if auditItemsList?if_exists>
					   			<#list auditItemsList as auditItems>
					   				<#if auditItems.itemClass == 40>
					   					<#if auditItems.lastStep == 2>
					   						<#if auditItems.auditUsers?if_exists && auditItems.auditStep == 2>
									        	<#assign sign = 1>
									        	<#assign auditRecords = auditItems>
									        </#if>	
							           </#if>
					   				</#if>
								</#list>
							</#if>
							<#if sign == 1>
								<p>
	   	        					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="${(auditRecords.itemId)?if_exists}_2" <#if auditRecords.auditUsers?if_exists && auditRecords.auditStep == 2>checked</#if> value="${(auditRecords.itemId)?if_exists}_2" data-type="">
					            	<span class="aut-check-show aut-check-son <#if auditRecords.auditUsers?if_exists && auditRecords.auditStep == 2>check-all</#if>"></span>一级复审
					        	</p>
					        <#else>
					        	<p>
	   	        					<input name="itemIds" type="checkbox" class="aut-check aut-fourth-check" id="12_2"  value="12_2" data-type="">
					            	<span class="aut-check-show aut-check-son"></span>一级复审
					        	</p>
				        	</#if>
						</td>
					</tr>
           		</table>
           	</li>
           </ul>
       </div>	
	   <div class="ui-btn-double">
	      <input type="button" onclick="authRole(this,'${base}/operator/findListView');" class="ui-btn-blue" value="确定"/>
	      <input type="button" class="ui-btn-grey ui-back" value="返回"/>
	   </div>
	  </form>
</div>
			
<!--成功提示-->	
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">角色授权成功！</h3>
  </div>

<!--失败提示-->	
  <div id="dlg2" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">失败！</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定"/>
  </div>
<script>
    $(function(){
    	//全选
        $("#allCheck").click(function(){
            checkFunc($(this),true,1);
        })
        //子元素的勾选
        $(".aut-check-son").click(function(){
            checkFunc($(this),false,0);
        });
        
    })
   
    function checkFunc(obj,param){
    
        var chkallsub = $("#operateAuthor").find(".aut-fourth-check");
            chsub = chkallsub.length,
            o=obj.siblings(".aut-check"),
            checked=o.is(":checked")?false:true,
            soncheck = $("#operateAuthor").find('.aut-fourth-check');
            sonicon = $("#operateAuthor").find('.aut-check-son');


        checked ? o.prop("checked", true):o.prop("checked", false);
        checked ? obj.addClass("check-all"):obj.removeClass("check-all");
        if(!param){
            if(checked){
                var checkedsub =$("#operateAuthor").find(".aut-fourth-check:checked").length; //获取选中的subcheck的个数
                if (checkedsub == chsub) {
                    $("#allCheck").addClass("check-all");
                    $("#allCheck").prev().prop("checked", true);
                }
            }else{
                $("#allCheck").removeClass("check-all");
                $("#allCheck").prev().prop("checked", false);
            }  
        }       
        if(param == 1){
            if(checked){
                soncheck.prop("checked", true);
                sonicon.addClass("check-all");
            }else{
                soncheck.prop("checked", false);
               sonicon.removeClass("check-all");
            }   
        }
            
    }
</script>
</body>
</html>