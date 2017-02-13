<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>客户端管理-版本管理-查看</title>
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
		<#--<#include "/common/include/power.ftl">-->
    	 <span>当前位置：</span>
    	 <a href="#">客户端管理</a><em>></em>
    	 <span>版本管理</span>
    </div>
    <form id="infoForm" method="post" action="">
    <div class="ui-info-main ui-isoAdd-main <#if versionFlag!='I'>ui-andAdd-main</#if>">
        <h2 class="ui-info-tit">查看版本</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item no-topbor">
         		<label class="ui-info-lbl">版本号</label>
                <span>${phoneVersions.currentVersion}</span>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">适配系统</label>
         		<span>${phoneVersions.systemVersion}</span>
         	</li>
         	<li class="ui-info-item">
         		<label class="ui-info-lbl">发布类型</label>
                <span>
					${phoneVersions.versionStateDesc}
				</span>
         	</li>
	         	<li class="ui-info-item ui-info-item-grey ui-padb ui-andSource-wrap">
		            <label class="ui-info-lbl">发布渠道</label>
		            <#list channelList  as clist>
		            <div class="ui-resureLimit-inner <#if clist_index==0>ui-resureLimit-fir<#else>ui-resureLimit-other</#if>">
		              <span class="ui-detail-text">${clist.channelName}</span>
		              <label class="ui-info-lbl">安装包</label>
		              <a href="${base}/upload${downDir}${clist.verPath}">点击下载</a>
		            </div>
		            </#list>
		            
	            </li>
            </li>
            <li class="ui-info-item ui-info-item-grey">
	            <label class="ui-info-lbl">更新类型</label>
	            <span>${phoneVersions.updateTypeDesc}</span>
            </li>
            <li class="ui-info-item">
	            <label class="ui-info-lbl">更新信息</label>
	             <span>${phoneVersions.verDec}</span>
	        </li>
            <li class="ui-info-item">
	            <label class="ui-info-lbl">提交人</label>
	             <span>${phoneVersions.opName}</span>
            </li>
            <li class="ui-info-item">
	            <label class="ui-info-lbl">提交时间</label>
	             <span>${phoneVersions.createTimeDesc}</span>
	        </li>
           <#-- <li class="ui-info-item ui-info-item-grey">
	            <label class="ui-info-lbl">客户端下载地址</label>
	            <span>${phoneVersions.downUrl}</span>
	          </li>-->
        </ul>
  	</div>
    <div class="ui-btn-double">
      <input type="button"  value="返回" class="ui-btn-blue ui-back"/>
    </div>
   </form>
 </div> 


  
</body>
</html>