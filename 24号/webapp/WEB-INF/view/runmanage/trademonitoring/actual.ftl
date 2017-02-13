<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>交易监控-实时监控</title>
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
    <link rel="stylesheet" type="text/css" href="/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/use.css">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/js/asset/css/carousel.css" rel="stylesheet">
    <link href="/js/asset/css/echartsHome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="/js/assect/html5shiv.min.js"></script>
      <script src="/js/assect/respond.min.js"></script>
    <![endif]-->
    <script src="/js/asset/js/esl/esl.js"></script>
    <script src="/js/asset/js/codemirror.js"></script>
    <script src="/js/asset/js/javascript.js"></script>
    <link href="/js/asset/css/codemirror.css" rel="stylesheet">
    <link href="/js/asset/css/monokai.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
</head>

<body>
	<div class="crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
		<!-- <a class="crumbs-link" href="#">运营管理<span>></span></a>
		<a class="crumbs-link" href="#">交易监控<span>></span></a>
		<span class="crumbs-tit">实时监控</span> -->
	</div>
    <div class="ui-infobg ui-spy-wrap fn-clear">
        <div class="ui-left-narrow">
            <div class="ui-narr-word">交易量监控</div>
        </div>
        <div class="ui-spy-right">
            <div class="ui-spy-search ">
            	<form id="chartForm">
	                <div class="ui-spy-item">
	                    <label>交易类型：</label>
	                    <select name="operType" class="ui-dselect ui-dselect-small">
                       		<option value="">全部</option>
	                    	<#if userObjectBinary?has_content>
	                    		<#list userObjectBinary as list>
	                        		<option value="${list.key?if_exists}">${list.value?if_exists}</option>
	                        	</#list>
	                        </#if>
	                    </select>
	                </div>
	                <div class="ui-spy-item">
	                    <label>刷新频率：</label>
	                    <select name="countFrequency" id="check-time" class="ui-dselect ui-dselect-small">
	                        <option value="1">1分钟</option>
	                        <option value="5" selected>5分钟</option>
	                        <option value="15">15分钟</option>
	                        <option value="30">30分钟</option>
	                        <option value="60">1小时</option>
	                    </select>                
	                    <input class="ui-check" type="checkbox" id="refresh-check" checked>
	                    <label for="refresh-check">自动刷新</label>
	                </div>
	                <div class="ui-spy-item">
	                    <input type="button" id="btn-refresh" class="ui-trans-btn ui-trans-check-btn" value="刷 新">
	                </div>
	            </form>
            </div>
            <div id="main" class="chart-main" data-show-type="actual">
                <span class="load"></span>
            </div>
        </div>
    </div>
    <div class="ui-infobg ui-spy-wrap ui-actual-chart-list fn-clear" style="margin-top:10px;">
        <div class="ui-left-narrow">
            <div class="ui-narr-word">可疑交易</div>
        </div>
        <div class="ui-spy-right ui-actual-right">
            <div class="ui-spy-search ">
            	<form id="chartSpecForm">
	                <div class="ui-spy-item">
	                    <label>交易类型：</label>
	                   <select name="operType" class="ui-dselect ui-dselect-small">
                        		<option value="">全部</option>
		                    	<#if userObjectBinary?has_content>
		                    		<#list userObjectBinary as list>
		                        		<option value="${list.key?if_exists}">${list.value?if_exists}</option>
		                        	</#list>
		                        </#if>
		                    </select>
	                </div>
	                <div class="ui-spy-item">
	                    <label>可疑类型：</label>
	                    <select name="suspiciousType" class="ui-dselect ui-dselect-small">
                        		<option value="">全部</option>
		                    	<#if suspiciousType?has_content>
		                    		<#list suspiciousType as list>
		                        		<option value="${list.key?if_exists}">${list.value?if_exists}</option>
		                        	</#list>
		                        </#if>
		                    </select>              
	                    <input class="ui-check" type="checkbox" id="refresh-check2" checked>
	                    <label for="refresh-check2">自动刷新</label>
	                </div>
	                <div class="ui-spy-item">
	                    <input type="button" id="submit_search" class="ui-trans-btn ui-trans-check-btn" value="刷 新">
	                </div>
	            </form>
            </div>
            <!-- 列表 -->
            <table id="dg-list" class="easyui-tab"  width="100%">   
            </table>
            <!-- 列表end -->
        </div>
    </div>
    <script src="/js/asset/js/bootstrap.min.js"></script>
    <script src="/js/chart.js"></script>
    <script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/jquery.datagrid.js"></script>
    <script>
    $(function(){
        //列表
        $("#dg-list").datagrid({
   			url:'/runManage/tradeMonitoring/suspiciousOrder',
   			method:'get',
   			fitColumns:true,
   			rownumbers:true,
   			nowrap: true,//当数据长度超出列宽时将会自动截取
   			idField:'id',//id字段
   			remoteSort: false,//定义是否通过远程服务器对数据排序
   			resizable:false,
   			checkOnSelect:false,
   			columns:[[
              {field:'orderNo',align:'center',width:"20%",title:'交易流水号',
				formatter:function(value,rec){
			       /*  return '<a class="operation-link" href="/runManage/tradeMonitoring/suspiciousDetail?id='+rec.id+'">'+rec.orderNo+'</a>'; */
			       var html=' ${fButton(list, 'DETAILS','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">\'+rec.orderNo+\'</a>')}'
			        return html;
			      }
              },
              {field:'createTimeString',align:'center',width:"16%",title:'交易时间'},
              {field:'operTypeName',align:'center',width:"16%",title:'交易类型'},
              {field:'transactionMoneyYuan',align:'center',width:"16%",title:'交易金额(元)'},
              {field:'transactionStateName',align:'center',width:"16%",title:'交易状态'},
              {field:'suspiciousTypeName',align:'center',width:"16%",title:'可疑类型'}
   			]],
   		    loadFilter:function(data){
   	            return loadFilter(data);    //自定义过滤方法
   	         }
        });
		
    	function loadFilter(data) {
    		var value = {
    			total: data.succ?data.entity.totalItems:0,
    			rows: []
    		};
    		if(data.succ){
    		for (var i = 0; i < data.entity.items.length; i++) {
    			var o = {};
    			_loadArray(data.entity.items[i], o, "");
    			value.rows.push(o);
    		}
    		}
    		return value;
    	}

    	function _loadArray(data, o, pre) {
    		if (pre)
    			pre = pre + ".";
    		for (var att in data) {
    			var row = data[att];
    			if (typeof(row) == "object") {
    				_loadArray(row, o, pre + att);
    			} else {
    				o[pre + att] = row;
    			}

    		}
    	}
    	function form2Json(id) {
    	       var arr = $("#"+id).serializeArray()
    	       var jsonStr = "";
    	       jsonStr += '{';
    	        $.each(arr, function(i, field){
    	           if(field.value){
    	            jsonStr += '"' + field.name + '":"' + field.value + '",'
    	           }
    	        });
    	        jsonStr = jsonStr.length>1?jsonStr.substring(0, (jsonStr.length - 1)):jsonStr;
    	         jsonStr += '}';
    	         //console.log(jsonStr)
    	        var json = $.parseJSON(jsonStr);
    	        return json
    	}
		//手动刷新
    	$("#submit_search").click(function () {
	   		 var listId=$('.easyui-tab').attr('id');
		     $("#"+listId).datagrid({ queryParams: form2Json("chartSpecForm") });   //点击搜索
    	});
    });
    </script>
</body>
</html>
