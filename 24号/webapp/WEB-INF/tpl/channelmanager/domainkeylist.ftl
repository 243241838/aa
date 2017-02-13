<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>渠道秘钥管理</title>
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
    <!-- 列表 -->
    <form id="search-ff">
        <input type="hidden" name="keySts" value="" id="keyStsId" />
    </form>
            <div class="list-item fn-clear">
              <span class="ui-info-list">渠道ID：${domain?if_exists.domainId}</span>
              <span class="ui-info-list">渠道名称：${domain?if_exists.domainName}</span>
                <a href="toAddKey?domainId=${domain?if_exists.domainId}" class="search-btn policy-newcontent">新增秘钥</a>
                <table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">    
                </table>
            </div>
    <a href="${base}/channelmanager/channelinformanager" class="ui-btn-grey">返回</a>
    <!-- 列表end -->
   </div>
  </div>

<script>
  $(function(){
        validExtend();
        //列表
        $("#dg-list").datagrid({
            url:'domainKeyListView?domainId=${domain?if_exists.domainId} ',
            method:'get',
            fitColumns:true,
            rownumbers:true,
            nowrap: true,//当数据长度超出列宽时将会自动截取
            //idField:'userid',//id字段
            //sortName:'effTime',//当数据表格初始化时以哪一列来排序
            //sortOrder:'desc',//'asc'/'desc'（正序/倒序）
            //remoteSort: false,//定义是否通过远程服务器对数据排序
            resizable:false,
            checkOnSelect:false,
            pagination:true,
            pageSize:10,
            columns:[[
            {field:'keyId',align:'center',width:"15%",title:'密钥ID',
                        formatter:function(value,rec){
                            return '<a class="operation-link" href="${base}/channelmanager/editKey?keyId='+rec.keyId+'">'+value+'</a>';
                        } },
            {field:'effTime',align:'center',width:"15%",title:'有效时间',
                    formatter:function(value,rec){
                        return formatDate(rec.effTime);
                    }},
            {field:'expTime',align:'center',width:"15%",title:'失效时间',
                    formatter:function(value,rec){
                        return formatDate(rec.expTime);
                    }},
             {field:'keyType',align:'center',width:"15%",title:'秘钥类型',
                    formatter:function(value,rec){
                        var s = '';
                        if(rec.keyType == 1){
                            s = 'MD5';
                        }
                        if(rec.keyType == 10){
                            s = 'RSA';
                        }
                        if(rec.keyType == 20){
                            s = '3DES';
                        }
                         return s;
                    }   
                },
            {field:'keySts',align:'center',width:"15%",title:'<select class="listsele" name="keySts1" id="keyStsIdSel" onChange="submitForm();">'
                                +'<option value="">状态</option>'
                                +'<option value="10">生效</option>'
                                +'<option value="-10">失效</option>'
                            +'</select>',
            formatter:function(value,rec){
                var s = '';
                if(rec.keySts == 10){
                    s = '生效';
                }
                if(rec.keySts == -10){
                    s = '失效';
                }    
                return s;
             }
            },
            {field:'opt',align:'center',width:"15%",title:'操作',formatter:function(value,rec){
             var phtml=''; 
                   phtml='<a class="operation-link" href="${base}/channelmanager/editKey?keyId='+rec.keyId+'">编辑</a>';
                   return  phtml;
             }
            }
        ]],
        onClickCell:function(rowIndex, field, value){
        if(field=='keyId'){
        window.location.href="/domain/key/tokeyInfo?keyId="+value;
        
        }
        },
       queryParams: eb.form2Json("search-ff"),
        loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
        onLoadSuccess:function(){
              pageCls();
            }
        });
        //分页
        pageAction();

   });
    function submitForm(){
        if($('#search-ff').form('validate')){
                var keySts = $("#keyStsIdSel").val();
                $("#keyStsId").val(keySts);
                //eb.backToFstPage("#datagrid");
                $("#dg-list").datagrid({queryParams : eb.form2Json("search-ff")});
                 pageAction();
                 $("#keyStsIdSel").val(keySts);
            }
    }
    function clearForm(){
        $("#search-ff").form('clear');
    }

</script>
</body>
</html>