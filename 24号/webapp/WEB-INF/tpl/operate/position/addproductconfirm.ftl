<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-展示位管理-展示内容</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	
	
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
    
     <!-- 表单一-->
    <div class="ui-info-main" id="frm1" style="display:block">
    <form id="infoForm" method="post" action="${base}/operate/findinfoProduct">
    <h2 class="ui-info-tit">新增展示内容</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示位</label>
         		 <#list pList as item>
				             <#if position.posId == "${item.posId}">${item.posName}</#if>
				             </#list>
         		 <input   name="posId" type="hidden" value="${position.posId}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示内容类型</label>
         		             <#if position.contentType == 20>标准产品</#if>
				            <#if position.contentType == 21>专题活动</#if>
				            <#if position.contentType == 22>促销产品</#if>
				             <#if position.contentType == 23>限时抢购产品</#if>
         		 <input   name="contentType" type="hidden" value="${position.contentType}"/> 
         	</li>  
         	
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示内容</label>
         		             <#if position.contentType == 20>
         		              <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">产品ID</th>
	                        <th class="relate-item-style">保险名称</th>
	                        <th class="relate-item-style">保险公司</th>
	                        <th class="relate-item-style">产品总量</th>
	                        <th class="relate-item-style">保费金额(元)</th>
	                        <th class="relate-item-style">保险类别</th>
	                        <th class="relate-item-style">来源</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${product.productId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${product.productName}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${product.insurerName}</td>
	                        <td class="ui-channel-titcolor relate-item-text"> <#if product.maxQuantity==-1>
         		      不限
         		  <#else> ${product.maxQuantity}
         		  </#if></td>
	                        <td class="ui-channel-titcolor relate-item-text">${product.minPremium/100}-${product.maxPremium/100}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${product.className}</td>
	                        <td class="ui-channel-titcolor relate-item-text"> <#if product.productSource == 1>自研</#if><#if product.productSource == 2>保险公司</#if></td>
	                        <input  type="hidden" name="productId" value="${product.productId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		     </#if>
         		     <#if position.contentType == 21>
         		       <#list sList as item>
         		         <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">营销策略ID</th>
	                        <th class="relate-item-style">专题名称</th>
	                        <th class="relate-item-style">促销状态</th>
	                        <th class="relate-item-style">开始时间</th>
	                        <th class="relate-item-style">结束时间</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${item.specialId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.specialName}</td>
	                        <td class="ui-channel-titcolor relate-item-text"><#if item.domainStatus == 1>未开始</#if><#if item.domainStatus == 2>进行中</#if><#if item.domainStatus == 3>已结束</#if></td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.effTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.expTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                        <input  type="hidden" name="specialId" value="${item.specialId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		       </#list>
         		    </#if>
         		     <#if position.contentType == 22>
         		       <#list priceList as item>
         		        <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">促销策略ID</th>
	                        <th class="relate-item-style">保险名称</th>
	                        <th class="relate-item-style">保费金额(元)</th>
	                        <th class="relate-item-style">折扣比例</th>
	                        <th class="relate-item-style">促销状态</th>
	                        <th class="relate-item-style">促销开始时间</th>
	                        <th class="relate-item-style">促销结束时间</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${item.priceId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.productName}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.minPremium/100}-${item.maxPremium/100}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.discountRate}</td>
	                        <td class="ui-channel-titcolor relate-item-text"><#if item.domainStatus == 1>促销未开始</#if><#if item.domainStatus == 2>促销进行中</#if><#if item.domainStatus == 3>促销已结束</#if></td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.effTime?string('yyyy-MM-dd HH:mm:ss')}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.expTime?string('yyyy-MM-dd HH:mm:ss')}</td>
	                         <input  type="hidden" name="priceId" value="${item.priceId}"/>
	                           <input  type="hidden" name="productId" value="${item.productId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		       </#list>
         		    </#if>
         		    
         		     <#if position.contentType == 23>
         		       <#list falshList as item>
         		        <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">抢购策略ID</th>
	                        <th class="relate-item-style">保险名称</th>
	                        <th class="relate-item-style">保费金额(元)</th>
	                        <th class="relate-item-style">折扣比例</th>
	                        <th class="relate-item-style">抢购状态</th>
	                        <th class="relate-item-style">开始时间</th>
	                        <th class="relate-item-style">结束时间</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${item.specialId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.productName}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.minPremium/100}-${item.maxPremium/100}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.discountRate}</td>
	                        <td class="ui-channel-titcolor relate-item-text"><#if item.domainStatus == 1>抢购未开始</#if><#if item.domainStatus == 2>抢购中</#if><#if item.domainStatus == 3>抢购已结束</#if></td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.effTime?string('yyyy-MM-dd HH:mm:ss')}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.expTime?string('yyyy-MM-dd HH:mm:ss')}</td>
	                         <input  type="hidden" name="specialId" value="${item.specialId}"/>
	                           <input  type="hidden" name="productId" value="${item.productId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		       </#list>
         		    </#if>
         		    
         		    
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">排序</label>
         		${position.sortCode}
         		 <input   name="sortCode" type="hidden" value="${position.sortCode}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示位图片</label>
         		 <img src="${base}${position.posLogo}" width=120 height=120/>
         		 <input   name="posLogo" type="hidden" value="${position.posLogo}"/> 
         		 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始时间</label>
         		${position.expTimestr}
         		 <input   name="effTimestr" type="hidden" value="${position.effTimestr}"/> 
         	</li> 
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">结束时间</label>
         		${position.expTimestr}
         		 <input   name="expTimestr" type="hidden" value="${position.expTimestr}"/> 
         	</li>
  	        
        </ul>
	    <div class="ui-btn-double">
	      <input type="button" value="完成"  class="ui-btn-blue"  onclick="domainok()"/>
	      <input type="button" value="返回修改"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
    
    <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
    
	<script>
          function domainok(){
             $.ajax({
                 url: '${base}/operate/insertPosition',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("dlg");
                     }else{
                       showAlert("dlgm");
                     }
                 }
             });
   }
   
   function tomain(){
   window.location.href="${base}/operate/showInfoView";
   }
	</script>
</body>
</html>