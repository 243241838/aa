<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>货品管理-关联</title>
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
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
</head>
<body>
<div id="page-form">
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
       <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post"  action="${action?if_exists}" >
			<div class="ui-info-wrap">
			<h3 class="ui-info-tit"> 货品基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">货品编号：</td>
				            <td>
				            	${product?if_exists.productCode}
				            	
				            	<input type="hidden" id="hiddenresult"  />
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">货品名称：</td>
				            <td>
				            	${product?if_exists.productName}
				            </td>
				          </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">供应商：</td>
				            <td>
				             <#list providerList as item>
				             <#if product.providerId == "${item.providerId}">${item.providerName}</#if>
				             </#list>
				             </td>
				          </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				            ${product.effTimeStr} 	至  ${product.expTimeStr}
				            <input type="hidden" id="hiddenid" value="${product.pid}" />
				            <input type="hidden" name="providerId" value="${product.providerId}" />
				            <input type="hidden" name="productCode" value="${product.productCode}" />
				            </td>
				          </tr>
				          
						  </tbody>
		      		</table>
				</div>
			
  	  			<h3 class="ui-info-tit"> 关联商品信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				           
				         <tr class="platform-part">
				            <td class="ui-oddtd">关联商品：</td>
				            <td>
				            <select class="ui-dselect" name="productId"    onchange="changelist(this.value)">
				 	             <option value="">请选择</option>
							  <#list productList as item >
	                             <option value="${item.productId}">${item.productName}</option>
	                          </#list>
	                          </select>
				            </td>
				          </tr>
				            </tbody>
		      		</table>
				</div>
				            <#list productList as item>
				            <div id="union${item.productId}" style="display:none;" class="ui-infobg">
				            <table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part" >
				            <td class="ui-oddtd">价格类型：</td>
				            <td>
				            	<#if item.pricingMode == 2>浮动价格</#if>
				            	<#if item.pricingMode == 1>固定价格</#if>
				            </td>
				            </tr>
				            <tr class="platform-part" >
				            <td class="ui-oddtd">面值价：</td>
				            <td>
				            	${item.productParvalue}元
				            	<input type="hidden" id="hiddenpricingMode${item.productId}" value="${item.pricingMode}" />
				            </td>
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
				          </#list>
				           <table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part" >
				            <td class="ui-oddtd">进货价来源：</td>
				            <td>
				              <input  type="radio" name="costSource" value="1" onclick="displayTr(this.value);" checked="checked" />从供应商获取
                              <input  type="radio" name="costSource" value="2" onclick="displayTr(this.value);" />手动配置
				            </tr>
				             </tbody>
		      		   </table>
				          <div id="kdsp" style="display:none;" class="ui-infobg">
				            <table class="ui-center-tab">
			                <tbody>
			                
				            <tr class="platform-part"  >
				            <td class="ui-oddtd">进货价：</td>
				            <td>
				             <input id='costValue' 　  type="text" maxlength=40  class=" ui-dinput" name="costValue"   value="0"  />元
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
				       <div id="fdsp" style="display:none;" class="ui-infobg">
				            <table class="ui-center-tab">
			                <tbody>
			                
				            <tr class="platform-part" id="styletype2" >
				            <td class="ui-oddtd">基准价格：</td>
				            <td>
				             <select class="ui-dselect" name="benchmarkPrice">
				                	<option value="1">面值</option>
				                </select>
				            </tr>
				            <tr class="platform-part" id="styletype3" >
				            <td class="ui-oddtd">加价类型：</td>
				            <td>
				               <input  type="radio" name="commPricing" value="2" onclick="displayjj(this.value);" checked="checked" />按金额比例
                              <input  type="radio" name="commPricing" value="1" onclick="displayjj(this.value);" />按每笔固定金额
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
						<div id="jjlxje" style="display:none;" class="ui-infobg">
				            <table class="ui-center-tab">
			                <tbody>
			                 <tr class="platform-part" id="styletype4" >
				            <td class="ui-oddtd">加价配置：</td>
				            <td>
				            <input id='costAddPrice' 　  type="text" maxlength=40  class=" ui-dinput" name="costAddPrice"   value="0"  />元
				            </td>
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
				      <div id="jjlxbfb" style="display:none;" class="ui-infobg">
				            <table class="ui-center-tab">
			                <tbody>
			               <tr class="platform-part"  >
				            <td class="ui-oddtd">加价配置：</td><td>
				            <input id='costAddPricebfb' 　  type="text" maxlength=40  class=" ui-dinput" name="costAddPricebfb"   value="0"  />%
				           </td>
				            </tr>
				             <tr class="platform-part" >
				            <td class="ui-oddtd">下限：</td>
				            <td>
				                <input id='costMinValue' 　  type="text" maxlength=40  class=" ui-dinput" name="costMinValue"   value="0"  />元
				                </tr>
				             <tr class="platform-part" >
				                 <td class="ui-oddtd">上限：</td>
				            <td>
				                <input id='costMaxValue' 　  type="text" maxlength=40  class=" ui-dinput" name="costMaxValue"   value="0"  />元
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <input type="submit" value="保存" class="ui-red-btn ui-pos3"/>
	    </div>
		</form>
	</div>
</div>
</div>
<div id="page-result" style="display:none"></div>
<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
<script>
  $(document).ready(function(){
     
	 $("#editMerch").validationEngine({
		maxErrorsPerField: 1
	});
	
	 $("body").delegate('#back', 'click', function(event) {
            $("#page-form").show();
            $("#page-result").hide().empty();
      });
    $('#editMerch').ajaxForm({
        target: '#page-result',
        success: function() {
            $("#page-form").hide();
            $('#page-result').show();
        }
    });
 });
 
 function changelist(value){
    document.getElementById("hiddenresult").value=value;
	 var s=document.getElementById("hiddenid").value;
	 var id="";
	 var ids = s.split(",");
	  for(var i=0;i<ids.length;i++){ 
		 id=ids[i];
		 if(id==value){
		 document.getElementById("union"+id).style.display="";
		 }else{
		 document.getElementById("union"+id).style.display="none";
		 }
	  }
     document.getElementById("kdsp").style.display="none";
     document.getElementById("fdsp").style.display="none";
     document.getElementById("jjlxje").style.display="none";
     document.getElementById("jjlxbfb").style.display="none";
 }
 
 function displayTr(value){
     var id=document.getElementById("hiddenresult").value;
     var pricingmode=document.getElementById("hiddenpricingMode"+id).value;
    if(pricingmode==1&&value==2){
     document.getElementById("kdsp").style.display="";
    }else if(pricingmode==2&&value==2){
       document.getElementById("fdsp").style.display="";
    }
    else{
     document.getElementById("kdsp").style.display="none";
     document.getElementById("fdsp").style.display="none";
     document.getElementById("jjlxje").style.display="none";
     document.getElementById("jjlxbfb").style.display="none";
    }
 }
 
  function displayjj(value){
    if(value==1){
     document.getElementById("jjlxje").style.display="";
     document.getElementById("jjlxbfb").style.display="none";
    }else{
      document.getElementById("jjlxje").style.display="none";
      document.getElementById("jjlxbfb").style.display="";
    }
 }
 
</script>
</body>
</html>