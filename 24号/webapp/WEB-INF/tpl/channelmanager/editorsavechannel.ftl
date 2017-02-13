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

                        <h4 class="ui-info-tit">分销商信息</h4>
                        <div class="ui-base-produceinfor">		
                 			<div class="ui-base-colsinfor channel-infor-item">
             					<label class="ui-base-label">分销商ID:</label>
         						<span class="ui-base-data">京东商城</span>
                 			</div>
                            <div class="ui-base-colsinfor channel-infor-item">
                                <label class="ui-base-label">分销商名称:</label>
                                <span class="ui-base-data">王道</span>
                            </div>
                           
                            <div class="ui-base-colsinfor channel-infor-item">
                                <label class="ui-base-label">合作时间:</label>
                                <span class="ui-base-data">
                                    <em>2015-01-01</em>至
                                    <em>2015-12-31</em>
                                </span>
                            </div>           
                        </div>
                        <h4 class="ui-info-tit">产品信息</h4>
                        <div class="ui-base-produceinfor">      
                            <div class="ui-base-colsinfor channel-produceinfor-item">
                                <label class="ui-base-label">产品ID:</label>
                                <span class="ui-base-data">123456</span>
                            </div>
                            <div class="ui-base-colsinfor channel-produceinfor-item">
                                <label class="ui-base-label">保险名称:</label>
                                <span class="ui-base-data"><a href="">B计划保险</a></span>
                            </div>
                            <div class="ui-base-colsinfor channel-produceinfor-item">
                                <label class="ui-base-label">产品总量:</label>
                                <span class="ui-base-data">100,00份</span>
                            </div>
                             <div class="ui-base-colsinfor channel-produceinfor-item">
                                <label class="ui-base-label">剩余总量:</label>
                                <span class="ui-base-data"><em class="query-result-num">80,000</em>份</span>
                            </div>   
                        </div>
                        <h4 class="ui-info-tit">合作信息</h4>
                        <div class="ui-base-produceinfor">      
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">合作数量:</label>
                                <span class="ui-base-data">100份</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">上架时间:</label>
                                <span class="ui-base-data">2015-01-10 10:00:20</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">下架时间:</label>
                                <span class="ui-base-data">2015-01-10 10:00:20</span>
                            </div>   
                        </div>
                        <h4 class="ui-info-tit">审核信息</h4>
                        <div class="ui-base-produceinfor ui-channel-checkinfor">      
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">提交时间:</label>
                                <span class="ui-base-data">2015-5-12 10:53:20</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">操作员:</label>
                                <span class="ui-base-data">yangyang</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-dividingline">
                                <label class="ui-base-label ui-channel-base-label">审核状态:</label>
                                <span class="ui-base-data">
                                    <em class="query-result-num">审核通过</em>
                                </span>
                            </div> 
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">提交时间:</label>
                                <span class="ui-base-data">2015-5-12 10:53:20</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">操作员:</label>
                                <span class="ui-base-data">yangyang</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">审核状态:</label>
                                <span class="ui-base-data">
                                         <em class="query-result-num">审核不通过</em>
                                </span>
                            </div> 
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">审核不通过理由:</label>
                                <span class="ui-base-data">
                                         <em class="query-result-num">保险条款选择错误</em>
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">审核时间:</label>
                                <span class="ui-base-data">2015-01-10 10:00:20</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">审核员:</label>
                                <span class="ui-base-data">yingkku</span>
                            </div> 
                             
                        </div>
                        <div class="ui-btn-double">
                            <a href="editorchannel.html"><input type="button" value="编辑" class="ui-btn-blue ui-submit" id="baseSaveInfor"/></a>
                            <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
                        </div>
                </div>	
         	</div>
    	</div>
    	  
	</div>

</body>
</html>