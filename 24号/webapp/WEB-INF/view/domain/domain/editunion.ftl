<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>渠道管理-商品编辑</title>
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
			<h3 class="ui-info-tit"> 渠道基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">渠道名称：</td>
				            <td>
				            	${domain?if_exists.domainName}
				            	<input type="hidden" name="domainId" value= "${domain?if_exists.domainId}"/>
				            	<input type="hidden"  name="editsts" id="editsts"/>
				            	
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">账户类型：</td>
				            <td>
				             <#if domainAccount.acctType == 1>信用额度</#if>
				             <#if domainAccount.acctType == 2>预付款</#if>
				            </td>
				          </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">渠道类型：</td>
				            <td>
				             <#if domain.domainType == 10>银行</#if>
				             <#if domain.domainType == 11>第三方支付</#if>
				             <#if domain.domainType == 12>P2P</#if>				                
				             <#if domain.domainType == 20>电商</#if>
				             <#if domain.domainType == 1>其他</#if>
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
				            <td class="ui-oddtd">商品：</td>
				            <td>
				            <select class="ui-dselect" name="productId"    onchange="changelist(this.value,${domain?if_exists.domainId})">
				 	            
							  <#list productList as item >
	                             <option value="${item.productId}">${item.productName}</option>
	                          </#list>
	                          </select>
				            </td>
				          </tr>
				           </tbody>
		      		   </table>
				      </div>
				      <div id="spxz" style="display:none;" class="ui-infobg">
					  <table class="ui-center-tab">
			           <tbody>
				      <tr class="platform-part">
				            <td class="ui-oddtd">基准价格：</td>
				            <td>
				               <select class="ui-dselect" name="benchmarkPrice">
				                	<option value="2">进货价</option>
				                	<option value="1">面值价</option>
				                </select>
				           </td>
				 </tr>
				          
				            <tr class="platform-part" id="styletype3" >
				            <td class="ui-oddtd">加价类型：</td>
				            <td>
				               <input  type="radio" name="settPricing" id="lx2" value="2" onclick="displayjj(this.value);" checked="checked" />按金额比例
                              <input  type="radio" name="settPricing" id="lx1" value="1" onclick="displayjj(this.value);" />按每笔固定金额
				            </tr>
				       </tbody>
		      		   </table>
				     
						<div id="jjlxje" style="display:none;">
				            <table class="ui-center-tab">
			                <tbody>
			                 <tr class="platform-part" id="styletype4" >
				            <td class="ui-oddtd">加价配置：</td>
				            <td>
				            <input id='settValue' 　  type="text" maxlength=40  class=" ui-dinput" name="settValue"   value="0"  />元
				            </td>
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
				      <div id="jjlxbfb" style="display:none;">
				            <table class="ui-center-tab">
			                <tbody>
			               <tr class="platform-part"  >
				            <td class="ui-oddtd">加价配置：</td><td>
				            <input id='settValuebfb' 　  type="text" maxlength=40  class=" ui-dinput" name="settValuebfb"   value="0"  />%
				           </td>
				            </tr>
				             <tr class="platform-part" >
				            <td class="ui-oddtd">下限：</td>
				            <td>
				                <input id='settMinValue' 　  type="text" maxlength=40  class=" ui-dinput" name="settMinValue"   value="0"  />元
				                </tr>
				             <tr class="platform-part" >
				                 <td class="ui-oddtd">上限：</td>
				            <td>
				                <input id='settMaxValue' 　  type="text" maxlength=40  class=" ui-dinput" name="settMaxValue"   value="0" />元
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
				      <table class="ui-center-tab">
			                <tbody>
				            <tr class="platform-part" id="styletype4" >
				            <td class="ui-oddtd">零售价配置：</td>
				            <td>
				               <input  type="radio" name="commValue" id="ls0" value="0" onclick="displayls(this.value);" checked="checked" />同结算价格
                              <input  type="radio" name="commValue" id="ls1"  value="1" onclick="displayls(this.value);" />按每笔固定金额
                                <input  type="radio" name="commValue" id="ls2"  value="2" onclick="displayls(this.value);" />按金额百分比
				            </tr>
				           </tbody>
		      		   </table>
				      <div id="lsjbfb" style="display:none;">
				            <table class="ui-center-tab">
			                <tbody>
			               <tr class="platform-part"  >
				            <td class="ui-oddtd">售价配置：</td><td>
				            <input id='domainValuebfb' 　  type="text" maxlength=40  class=" ui-dinput" name="domainValuebfb"   value="0"  />%
				           </td>
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
				       <div id="lsjgdj" style="display:none;">
				            <table class="ui-center-tab">
			                <tbody>
			               <tr class="platform-part"  >
				            <td class="ui-oddtd">售价配置：</td><td>
				            <input id='domainValue' 　  type="text" maxlength=40  class=" ui-dinput" name="domainValue"   value="0"  />元
				           </td>
				            </tr>
				           </tbody>
		      		   </table>
				      </div>
			</div> </div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <!--<input type="submit" value="保存" class="ui-red-btn ui-pos3"/>--->
	      <input type="button" value="保存" onclick=downproduct(); class="ui-red-btn ui-pos3"/>
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
 
 function changelist(value, domainid) {
    if (value == 0) {
        document.getElementById("spxz").style.display = "none";
    } else {
      document.getElementById("spxz").style.display = "";
        $.ajax({
            url: '/domain/getdomianDaiel?domainid=' + domainid + '&pid=' + value,
            type: 'post',
            datatype: 'text',
            success: function(result) {
                if (result !="") {
                 $("#editsts").val(2);
                    if (result.benchmarkPrice == 1) {
                        $("select[name=benchmarkPrice]").find("option[value=1]").attr("selected","selected");
                    }else{
                     	$("select[name = benchmarkPrice]").find("option[value=2]").attr("selected", "selected");
                    }
                   if (result.settPricing == 1) {
                         document.getElementById("lx1").checked = true;
                         document.getElementById("jjlxje").style.display="";
                         document.getElementById("jjlxbfb").style.display="none";
                         $("#settValue").val(result.settValue);
                    }else{
                          document.getElementById("jjlxje").style.display="none";
                          document.getElementById("jjlxbfb").style.display="";
                     	  document.getElementById("lx2").checked = true;
                     	  $("#settValuebfb").val(result.settValue);
                     	  $("#settMinValue").val(result.settMinValue);
                     	  $("#settMaxValue").val(result.settMaxValue);
                    }
                     if (result.commValue == 1) {
                         document.getElementById("ls1").checked = true;
                         document.getElementById("lsjgdj").style.display="";
                         document.getElementById("lsjbfb").style.display="none";
                         $("#domainValue").val(result.domainValue);
                    }if (result.commValue == 2) {
                        document.getElementById("lsjgdj").style.display="none";
                        document.getElementById("lsjbfb").style.display="";
                        document.getElementById("ls2").checked = true;
                        $("#domainValuebfb").val(result.domainValue);
                    }
                    if (result.commValue == 0) {
                         document.getElementById("ls0").checked = true;
                         document.getElementById("lsjgdj").style.display="none";
                         document.getElementById("lsjbfb").style.display="none";
                    }
                } else {
                     $("#editsts").val(1);
                }
            }
        });

    }
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
 
  function displayls(value){
    if(value==1){
     document.getElementById("lsjgdj").style.display="";
     document.getElementById("lsjbfb").style.display="none";
    }if(value==2){
       document.getElementById("lsjgdj").style.display="none";
       document.getElementById("lsjbfb").style.display="";
    }
    if(value==0){
       document.getElementById("lsjgdj").style.display="none";
       document.getElementById("lsjbfb").style.display="none";
    }
 }
  function downproduct(){
                 $.ajax({
                     url: '/domain/toproduct' ,
                     type: 'post',
                     datatype: 'text',
                     data: $('#editMerch').serialize(),
                     success: function (result) {
                         if (result>0) {
                            $.messager.alert("操作提示", "编辑成功！", "info", function () {
                                 window.location.href="/domain/findListView";
                              });
                         }else{
                          $.messager.alert('提示消息', '编辑失败！', 'warn');
                         }
                     }
                 });
         }
</script>
</body>
</html>