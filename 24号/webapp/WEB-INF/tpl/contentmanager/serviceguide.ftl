<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>服务指南类-内容管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    
    <div class="ui-info-main"> 
    <form id="search-ff" class="ui-search-form ui-service-search" method="post">
          <ul class="search-list fn-clear">
            <li>
              <label class="name">关键字：</label>
              <span class="textbox ui-service-searchpt"><input class="textbox-text textbox-prompt" type="text" id="articleTitle" name="articleTitle" 
              	<#if articleTitle??>
              	 value="${articleTitle}" placeholder="${articleTitle}"
              	<#else>
              	 value="" placeholder="栏目/文章名称"
              	</#if>
              />
              </span>
            </li>
            <li class="btn-group">
              <a href="javascript:void(0)" class="search-btn" onclick="submitOtherForm(this);">搜索</a>
                <a href="javascript:void(0)" class="search-btn" onclick="clearVal()">重置</a>
            </li>
          </ul>
    </form>
  
    <form id="infoForm" method="post" action="">
        <ul class="ui-info-list ui-insurance-info" id="guarantList">
         	<li class="ui-info-item ui-guarant-item" >
         		<div class="ui-guarant-wrap">
         			<ul class="ui-guarant-list">
                <li class="ui-info-item" style="border-top:0;">
                  <label class="ui-info-lbl">
                    <a class="search-btn policy-newcontent" id="newOneMenu">新增一级</a>
                  </label>
                  <label class="ui-info-lbl">操作</label>
                </li>
         		<#list artList as item>
                <li class="ui-menu-item">
                  <div class="ui-guarant-tit ui-rowcontent">
  	              	<a href="javascript:;" onclick="toggleSub(this,'yes');" class="ui-gone">
  	              		<strong class="ui-onemenutext-1">${item.articleTitle}</strong><i class="ui-icon-arrow"></i>
  	              		<input type="hidden" class="ui-labelid" name="articleId" value="${item.articleId}" />
  	              	</a>
  	              	<span class="ui-gthree">
  	              		<a class="ui-toggle-add ui-menuoptmargin oneMenuText" href="javascript:;" data-leve="2" onclick="showAddDlg(this,'dlgList2',${item.articleId});"></a>
                      <input type="button" value="编辑" class="ui-btn-green ui-menuoptmargin onemenu-editor" data-leve="1" />
                      <input type="button" value="删除" class="ui-btn-org ui-menuoptmargin ui-levedelete" data-leve="1"/>
  	              	</span>
  	              </div>
                	<div class="ui-guarant-tab" width='100%' id="menuContentOne">
                  <!--二级菜单start-->
                  <#list item.childArticleList as item2>
                	  <div class="ui-guarant-tit ui-toggle-menubg ui-rowcontent">
                        <a href="javascript:;" onclick="toggleSub(this,'yes');" class="ui-gone ui-onemenuindent">
                          <strong class="ui-twomenutext-2">${item2.articleTitle1}</strong><i class="ui-icon-arrow ui-icon-arrow-up"></i>
                          <input type="hidden" class="ui-labelid" name="articleId2" value="${item2.articleId}" />
                          <input type="hidden" class="ui-labelid2" name="articleId1" value="${item.articleId}" />
                        </a>
                        <span class="ui-gthree">
                          <a class="ui-toggle-add ui-menuoptmargin" href="${base}/content/toAddArticles?articleId2=${item2.articleId}&type=add" data-mask="TwoOne"></a>
                          <input type="button" value="编辑" class="ui-btn-green ui-menuoptmargin onemenu-editor" data-leve="2"/>
                          <input type="button" value="删除" class="ui-btn-org ui-menuoptmargin ui-levedelete" data-leve="2"/>
                        </span>
                      </div>
                      <table class="ui-guarant-tab" width='100%' id="menuContentTwoOne">
                      	<#list item2.childArticleList as item3>
	                        <tr class="ui-rowcontent">
	                          <td width="366" class="ui-td-fir ui-twomenuindent ui-menutext">
	                          	<a href="${base}/content/toAddArticles?articleId2=${item3.articleId}&type=sel">${item3.articleTitle2}</a>
	                          	<input type="hidden" class="ui-labelid" name="articleId4" value="${item3.articleId}" />
	                          	<input type="hidden" class="ui-labelid" name="articleId3" value="${item2.articleId}" />
	                          </td>
	                          <td>
	                            <a class="ui-btn-green ui-contentmargin ui-editor-pages" 
	                            	href="javascript:void(0)" onclick="toUpd(${item3.articleId})">编辑</a>
	                            <input type="button" value="删除" class="ui-btn-org ui-contentmargin ui-levedelete" data-leve="3"/>
	                          </td>
	                        </tr>
                        </#list>
                      </table>
                  <!--二级菜单end-->
				    </#list>
				   </div>
				   </li>
			   </#list>
			 </div>
		   </li>
		 </ul>
       </form>
  	</div>

<!--一级菜单新增内容弹框-->  
<form id="dlgList" class="easyui-dialog ui-dlg-list ui-tree-dialog"  data-options="modal:true,closed: true">
	<ul class="ui-dlg-ins-list" >
		<li class="ui-dlg-ins-item">
			<label>栏目名称:</label>
			<input type="text" class="easyui-validatebox ui-info-input" id="benName" name="articlesVoMap[1].articleTitle"
			data-options="required:true,validType:['chinese','length[1,10]']" missingMessage="请输入栏目名称"/>
			<a class="ui-guarant-addfir insurance-add" href="javascript:;" data-changename="2" ></a>
		</li>
	</ul>
	<div class="ui-dlg-submit">
		<input type="button" class="ui-dlgOk-btn" value="确认" id="checkMenuName"/>
		<input type="button" class="ui-dlgCancel-btn" value="取消"/>
	</div> 
</form>
<!--二级菜单新增内容弹框-->  
  <form id="dlgList2" class="easyui-dialog ui-dlg-list ui-tree-dialog"  data-options="modal:true,closed: true">
    <ul class="ui-dlg-ins-list" >
		<li class="ui-dlg-ins-item">
			<label>栏目名称:</label>
			<span id="ins-oneType"></span>
			<input type="hidden" name="parentId" id="parentId" value="">
		</li>
	
		<li class="ui-dlg-ins-item ui-info-item-grey ui-inforitem-li">
        <label>栏目分类：</label>
        <input type="text" class="easyui-validatebox ui-info-input" id="benName" name="articlesVoMap[1].articleTitle"
               data-options="required:true,validType:['chinese','length[1,10]']" missingMessage="请输入栏目分类"/>
        <a class="ui-guarant-addfir insurance-add" href="javascript:;" data-changename="2"></a>
      </li>
	</ul>
    <div class="ui-dlg-submit">
      <input type="button" class="ui-dlgOk-btn" value="确认" id="checkTwoMenu"/>
      <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    </div>
  </form>
<!--编辑内容弹框-->
  <div id="dlgEdit" class="easyui-dialog ui-dlg-list ui-tree-dialog"  data-options="modal:true,closed: true">
    <table class="ui-dlg-tab ui-addonemenu" width="100%" id="dlgEditTable">
      <tr class="ui-dgrey">
        <td class="ui-dlgtab-left">栏目名称：</td>
        <td>
          <input type="text" name="articleContent" value="" class="ui-info-input editor-cloumncheck easyui-validatebox ui-cover" 
            id="columnName" data-options="required:true,validType:['chinese','maxlen[10]']" missingMessage="请输入栏目名称" />
          <input type="hidden" id="articleId" name="articleId" value="" />
        </td>
        <td>
          <span class="showMessage"></span>
        </td>
      </tr>
    </table>
    <div class="ui-dlg-submit">
      <input type="button" class="ui-dlgOk-btn" value="确认" id="leve1Conform"/>
      <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    </div>
  </div>
    <div id="dlgEditLeve2" class="easyui-dialog ui-dlg-list ui-tree-dialog"  data-options="modal:true,closed: true">
    <table class="ui-dlg-tab ui-addonemenu" width="100%" id="dlgEditTable">
       <tr class="ui-dgrey">
        <td class="ui-dlgtab-left">栏目名称：</td>
        <td>
           <span id="menuLeve1"></span>
        </td>
      </tr>
      <tr class="ui-dgrey">
        <td class="ui-dlgtab-left">栏目分类：</td>
        <td>
          <input name="articleContent" type="text" value="" class="ui-info-input easyui-validatebox  ui-cover" id="columnLeveName" 
          	data-options="required:true,validType:['chinese','maxlen[10]']" missingMessage="请输入栏目分类" />
          <input type="hidden" id="articleId2" name="articleId" value="" />
        </td>
        <td>
          <span class="showMessage"></span>
        </td>
      </tr>
    </table>
    <div class="ui-dlg-submit">
      <input type="button" class="ui-dlgOk-btn" value="确认" id="leve2Conform"/>
      <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    </div>
  </div>
<!--删除-->  
  <div id="dlgDeleteOpera" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
   <h3 class="ui-dlg-tit">确定删除吗？</h3>
   <input type="button" class="ui-dlgOk-btn" value="确定" id="contentDelete"/>
   <input type="button" class="ui-dlgCancel-btn" value="取消" id="contentCancel"/>
 </div>
 <!--删除-->  
   <div id="dlgLeve" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
   <h3 class="ui-dlg-tit">确定删除吗？</h3>
   <input type="button" class="ui-dlgOk-btn" value="确定" id="leveConfirm"/>
   <input type="button" class="ui-dlgCancel-btn" value="取消"/>
 </div>
 
 <div id="dlgDelete" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
   <h3 class="ui-dlg-tit" id="deleteTit">该栏目下有文章，不可删除</h3>
   <input type="button" class="ui-dlgOk-btn" value="确定" id="operaOver"/>
 </div>
<div id="art" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
   <h3 class="ui-dlg-tit" id="artTit">添加成功!</h3>
 </div>
<div id="error" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit2" >异常情况,操作失败!</h3>
  </div>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script>
   $(function(){
      validExtend();
      changeInsLine();
      var leve1 = null,
          addleve = null;


      //--------3.添加操作-------------

      //弹框的添加
      $("#addMenu").click(function(event) {

        $(this).next().css("display","inline-block").end().hide();
        $("#addMenuName").show();
      });
      $("#reduceMenu").click(function(event) {

          $("#addMenu").show();
          $("#addMenu").next().hide();
          $("#addMenuName").hide();
      });


       //弹框的添加
      $("#addMenu2").click(function(event) {

        $(this).next().css("display","inline-block").end().hide();
        $("#addMenuName2").show();
      });
      $("#reduceMenu2").click(function(event) {

          $("#addMenu2").show();
          $("#addMenu2").next().hide();
          $("#addMenuName2").hide();
      });



      //新增一级菜单
      $("#newOneMenu").click(function(event) {

        //清空操作
        $("#menuClomuName").val("");
        $("#menuClomuName2").val("")
        showAlert("dlgList");
      });

      //添加二级菜单
      //$(".oneMenuText").click(function(event) {
          // var addleve = $(this).data("leve"),
             // value = $(this).parents(".ui-guarant-tit").find(".ui-onemenutext-1").text();

          //leve1 = $(this).parents(".ui-menu-item");
         // $("#twomenuClomuName").val("");
          //$("#twomenuClomuName2").val("");
          //$("#oneMenuName").text(value);
          //showAlert("dlgList2");
      // });
      

      //一级菜单确认验证
      $("#checkMenuName").click(function(event) {
       	<#--
          var  columnname =$("#menuClomuName"),
                subtitle = $("#menuClomuName2"),
               onemenu = $(".ui-onemenutext-1"),
              isflag = inforCheck(onemenu,columnname),
              iscopy = subtitle.is(":visible") ? inforCheck(onemenu,subtitle): true;


          if(isflag && iscopy){
            if(subtitle.is(":visible")){
              alert($("#menuClomuName2").val().substring(0,10));
            }
            alert($("#menuClomuName").val().substring(0,10));
             $(".showMessage").text("");
            $("#dlgOneMenuAdd").dialog("close");
          }
		-->
			$.ajax( {
				url : "${base}/content/addArticleType",
				dataType : "json",
				type : "post",
				data: $("#dlgList").serialize(),
				// 成功后调用
				success : function(data) {
				    if(data.succ){
		         		showAlert('art');
		         		window.setInterval( function () {
			         		window.location.reload();
						}, 500 );
		         	} else {
		         		$("#deleteTit").text(data.entity);
				    	showAlert('dlgDelete');
				    	return false;
		         	}
				},
				error:function(data){
				   showAlert('error');
				}
			});
       });
       
      //二级菜单确认验证
      $("#checkTwoMenu").click(function(event) {
      <#--
      var  columnname =$("#twomenuClomuName"),
            subtit = $("#twomenuClomuName2"),
           twomenu = leve1.find(".ui-twomenutext-2"),
           isflag = inforCheck(twomenu,columnname),
          iscopy = subtit.is(":visible") ? inforCheck(twomenu,subtit): true;
        
      if(isflag && iscopy){
        if(subtit.is(":visible")){
           alert($("#twomenuClomuName2").val().substring(0,10));
        }
          alert($("#twomenuClomuName").val().substring(0,10));
          $(".showMessage").text("");
        $("#dlgTwoMenu").dialog("close");
      }
		//得到ID的字符串
		var id = titid.substring(0,titid.length-1);
	-->       
		
		$.ajax( {
				url : "${base}/content/addArticleType",
				dataType : "json",
				type : "post",
				data: $("#dlgList2").serialize(),
				// 成功后调用
				success : function(data) {
				    if(data.succ){
				    	showAlert('art');
		         		window.setInterval( function () {
					    	window.location.reload();
						}, 500 );
				    } else {
				    	$("#deleteTit").text(data.entity);
				    	showAlert('dlgDelete');
				    	return false;
				    }
				},
				error:function(data){
				   showAlert('error');
				}
			});
     });
     
      function inforCheck(compare,target){
        var val = target.val();
            showcontent = target.parents("tr").find(".showMessage");
            isSave = true,
            rule = /^[\u4e00-\u9fa5]+$/;
      <#-- 
        $.each(compare,function(i,v){
          
            if($(v).text() == val){
               isSave = false;
              showcontent.text("该栏目名称已存在")
            }
        }) 
       -->
        return isSave;
     }

      //--------2.编辑操作-------------
      //点击一级二级的编辑
     $(".onemenu-editor").click(function(event) {
         var value = $(this).data("leve");   
             columnname = '',
             leve2 = null,
             namesort = '',
             artId = null;

         if(value == 1){
            artId = $(this).parents(".ui-guarant-tit").find(".ui-labelid").val(); 
            columnname = $(this).parents(".ui-guarant-tit").find(".ui-onemenutext-1").text();
            $("#columnName").val(columnname);
            $("#articleId").attr("value",artId);
            showAlert("dlgEdit");
         }else if(value == 2){
           artId = $(this).parents(".ui-guarant-tit").find(".ui-labelid").val(); 
           columnname = $(this).parents(".ui-guarant-tit").find(".ui-twomenutext-2").text();
           leve1 = $(this).parents(".ui-menu-item");
           namesort = leve1.find(".ui-onemenutext-1").text();
          $("#menuLeve1").text(namesort);
          $("#columnLeveName").val(columnname);
          $("#articleId2").val(artId);
            showAlert('dlgEditLeve2');
         }  
     });

     //一级编辑
     $("#leve1Conform").click(function(event) {
      var name = $("#columnName");
      var columnname = $("#columnName").val().substring(0,10);
      var articleId = $("#articleId").val();
      var onemenu = $(".ui-onemenutext-1");
      var isflag = inforCheck(onemenu,name);
	      if(isflag){
	        $.ajax( {
				url : "${base}/content/updArticleType",
				dataType : "json",
				type : "post",
				data: {"articleId":articleId, "articleTitle":columnname},
				// 成功后调用
				success : function(data) {
				    if(data.succ){
				    	$("#artTit").text(data.entity);
				    	showAlert('art');
			            $(".showMessage").text("");
				        $("#dlgEdit").dialog("close");
		         		window.setInterval( function () {
					    	window.location.reload();
						}, 500 );
				    } else {
				    	$("#deleteTit").text(data.entity);
				    	showAlert('dlgDelete');
				    	return false;
				    }
				},
				error:function(data){
				   showAlert('error');
				}
			});
	      }
     });

     //编辑的取消
      $(".ui-dlgCancel-btn").click(function(event) {
         $(".showMessage").text("");
       });

     
     //二级编辑
     $("#leve2Conform").click(function(event) {
      	var  columnname =$("#columnLeveName"),
      
           twomenu = leve1.find(".ui-twomenutext-2"),
           isflag = inforCheck(twomenu,columnname);

	       if(isflag){
	            var columnname = $("#columnLeveName").val().substring(0,10);
	            var articleId = $("#articleId2").val();
		        $.ajax( {
					url : "${base}/content/updArticleType",
					dataType : "json",
					type : "post",
					data: {"articleId":articleId, "articleTitle":columnname},
					// 成功后调用
					success : function(data) {
					    if(data.succ){
				            $("#artTit").text(data.entity);
				    		showAlert('art');
					    	window.setInterval( function () {
					    		window.location.reload();
							}, 500 );
					    } else {
					    	$("#deleteTit").text(data.entity);
					    	showAlert('dlgDelete');
					    	return false;
					    }
					},
					error:function(data){
					   showAlert('error');
					}
				});
	       }

     });

     //1.删除操作
 	deleteList();        
         
      //确定删除
      $("#contentDelete").click(function(event) {
        $("#artTit").text("删除成功！");
        showAlert("art");
    	window.setInterval( function () {
	        window.location.reload();
		}, 1000 );
      });
	});

   	function toUpd(articleId){
   		if(articleId == null || articleId == ""){
   			alert("文章不存在!");
   			//$("#delStartTit2").text(result.entity);
			//showAlert('error');
   			return false;
   		}
   		window.location.href="${base}/content/toAddArticles?articleId2="+articleId+"&type=upd";
   	}
   	//清空搜索框
  	function clearVal(){
  		$("#articleTitle").attr("value","");
  		$("#articleTitle").attr("placeholder","");
  	}
	</script>
</body>
</html>