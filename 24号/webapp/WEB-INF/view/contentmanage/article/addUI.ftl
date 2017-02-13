<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>文章管理-新增</title>
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
	<script type="text/javascript" src="/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
    <script type="text/javascript" src="/js/kindeditor/kindeditor.js"></script>
    <script>
	  $(document).ready(function(){
			$("#addMerchType").validationEngine({
			  maxErrorsPerField: 1
		    });
			moneyThousands();
			
		    richEdit();
			
			$("#columnSelect").change(function(){
				$("#columnName").val($(this).find('option:selected').text());
			});
			 
		});
		
	</script>
</head>

<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	   <#include "/common/include/power.ftl">
	</div>
	<div class="ui-menu-container">
		 <ul id="content-menu">
		 	<!-- 遍历树形 -->
			<#if cataList?if_exists>
				<#list cataList as cata>
					<li class="ui-menu-item ui-meun-item-open">
			 		    <i class="sm-ui-icon-arrow"></i>
			 		    <#assign ps = ""/>
			 		    <#if cata.id == 1>
			 		        <#assign ps = "/content/article/listView?type=s&pid="/>
						<#else>
						    <#assign ps = "/content/article/listView?type=p&pid="/>
			 		    </#if>
			 		    <a class="ui-menu-item-name" href="${ps}${cata.id}" title="${cata?if_exists.title}">${cata?if_exists.title}</a>
						<ul class="ui-submenu-list">
							<#if cata?if_exists.problemList?if_exists>
								<#list cata.problemList as proCata>
									<li class="ui-submenu-item <#if proCata_index == 0>ui-submenu-fir</#if>">
										<a class="ui-submenu-item-name" href="${ps}${proCata.id}" title="${proCata?if_exists.title}">${proCata?if_exists.title}</a>
									</li>
								</#list>
							</#if>
						</ul>
					</li>
				</#list>
			</#if>
	    </ul>
	</div>
	<div  class="ui-info-container">
		<div class="ui-info-content">
	      <form id ="addMerchType" method="post" action="/content/article/addConfirm" <#if problemQuery?if_exists.cataId?if_exists&&problemQuery.cataId == 2>onSubmit="return befSubmit();"</#if> >
			<div class="ui-info-wrap ">
		  	<h3 class="ui-info-tit">文章新增</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr>
			            <td class="ui-oddtd">标题：</td>
			            <td>
			            	<input type="text" name="title" dataType="reqArtTit" maxlength=40 class="validate[required,custom[name],custom[typeName],maxSize[40]] ui-dinput">
			            </td>
			          </tr>
			          <#if problemQuery?if_exists.cataId?if_exists&&problemQuery.cataId == 1>
	            		  <tr>
				            <td class="ui-oddtd">上传图片：</td>
				            <td class="ui-relative ui-file-box fn-left">
				            	<input type="input" dataType="reqPicup" class="validate[required] ui-dinput file-val" name="tdPicture"/>
		    					<input type="button" class="ui-trans-btn file-btn"  value="上传" />
		    					<input type="file" class="file-wrap" id="file-wrap" name="file1" onchange="uploadFile(this,'/upload/picture');" />
				            </td>
				          </tr>
		                  <tr class="ui-pictip">
				            <td class="ui-oddtd"></td>
				            <td style="height:20px;">
				             <div class="ui-inner-pictip">最佳图片分辨率：156px*156px，格式：JPG、BMP、PNG</div>
				            </td>
				          </tr>
				          <tr id="ui-view-tr" class="fn-hide">
				            <td class="ui-oddtd">图片预览：</td>
				            <td>
				                <div class="img-view-wrap">
				            	  <img src="" id="imgview" />
				            	</div>
				            </td>
				          </tr>
	            	   </#if>
			          <tr>
			            <td class="ui-oddtd">所属栏目：</td>
			            <td>
			            	<#if problemQuery?if_exists.parentId?if_exists>
			            		${columnList?if_exists[0].title?if_exists}
			            		<input id="" name="parentId" type="hidden" value="${columnList?if_exists[0].id?if_exists}"/>
			            		<input id="columnName" name="columnName" type="hidden" value="${columnList?if_exists[0].title?if_exists}"/>
			            	<#else>
			            	<input id="columnName" name="columnName" type="hidden" value="${columnList?if_exists[0].title?if_exists}"/>
				            	<select id="columnSelect" class="ui-dselect" name="parentId">
				            		<#if columnList?if_exists>
				            			<#list columnList as col>
				            				<option value="${col?if_exists.id}">${col?if_exists.title}</option>
				            			</#list>
				            		</#if>
				            	</select>
			            	</#if>
			            </td>
			          </tr>			          
			          <tr>
			            <td class="ui-oddtd">所属类别：</td>
			            <td>
			            	<#if problemQuery?if_exists.cataId?if_exists>
			            		<#if problemQuery.cataId == 1>
			            			自助服务
			            			<input name="cataId" value="1" type="hidden"/>
			            			<input name="cataName" value="自助服务" type="hidden"/>
			            		<#elseif problemQuery.cataId == 2>
			            			常见问题
			            			<input name="cataId" value="2" type="hidden"/>
			            			<input name="cataName" value="常见问题" type="hidden"/>
			            		</#if>
			            	<#else>
				               <select class="ui-dselect" name="cataId">
				            		<option value="1">自助服务</option>
				            		<option value="2">常见问题</option>
				            	</select>
				            	<input name="cataName" value="" type="hidden"/>
			            	</#if>
			            </td>
			          </tr>

			          <tr>
			            <td class="ui-oddtd">排序：</td>
			            <td>
			            	<input type="text" name="sorts" dataType="reqArtNum" class="validate[required,custom[integer],min[0],max[999999999]] ui-dinput" value="${problemCata?if_exists.sorts?if_exists}"/>
			            </td>
			          </tr>
			           <#if problemQuery?if_exists.cataId?if_exists>
	            		 <#if problemQuery.cataId == 1>
	            		 <tr>
				            <td class="ui-oddtd">跳转地址：</td>
				            <td>
				              <input type="text" name="tdContent" dataType="reqUrl" class="validate[required,custom[url]] ui-dinput" value="${problemCata?if_exists.sorts?if_exists}"/>
				            </td>
				          </tr>
	            		 <#elseif problemQuery.cataId == 2>
	            		  <tr>
				            <td class="ui-oddtd">内容：</td>
				            <td class="ui-relative">
				            	<textarea data-texta="richEditor" dataType="reqArtCon" name="tdContent" class="validate[required,minSize[2],maxSize[4000]] min-editor"></textarea>
				                <div class="form-validation-field-2formError parentFormaddMerchType formError textError" style="display:none;">
					                <div class="formErrorContent">请输入文章内容。</div>
					                <div class="formErrorArrow">
						                <div class="line10"></div>
						                <div class="line9"></div>
						                <div class="line8"></div>
						                <div class="line7"></div>
						                <div class="line6"></div>
						                <div class="line5"></div>
						                <div class="line4"></div>
						                <div class="line3"></div>
						                <div class="line2"></div>
						                <div class="line1"></div>
					                </div>
				                </div>
				            </td>
				          </tr>
	            		 </#if>
			           </#if>
			           
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
</div>
</body>
</html>