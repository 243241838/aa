<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>运营管理-营销策略管理-专题管理</title>
    <link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
    <link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
    <script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>


    <script type="text/javascript" src="${base}/resource/js/base.js"></script>


</head>

<body style="">
<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    <#include "/common/include/power.ftl">
    </div>
    <div class="ui-datagrid-wrap">
        <!-- 搜索 -->
        <div class="search-wrap">
            <form id="search-ff" class="ui-search-form">
                <ul class="search-list fn-clear">
                    <li>
                        <label class="name operate-item-label">活动编号</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text"
                                                         name="promotionId" value="" maxlength=6/>
							</span>
                    </li>
                    <li>
                        <label class="name" style="width:75px;">活动名称</label>
                        <span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"
                                                     name="promotionName" value=""/></span>
                    </li>
                    <li>
                        <label class="name">活动状态</label>
                        <select class="ui-combobox" name="domainStatus" id="couponType">
                            <option value="">全部</option>
                            <option value="1">未进行</option>
                            <option value="2">进行中</option>
                            <option value="3">已结束</option>
                        </select>
                    </li>
                </ul>
                <ul class="search-list fn-clear">
                    <li class="date">
                        <label class="name ui-change-item-label">活动时间：</label>
                        <input id="startTime" name="effTimestr" class="easyui-datebox" data-options="editable:false"
                               vlaue="" validType="md['#endTime']">
                        <em class="ui-channel-titcolor">至</em>
                        <input id="endTime" name="expTimestr" class="easyui-datebox" data-options="editable:false"
                               vlaue="" validType="md['#startTime']">
                    </li>
                    <li>
                        <label class="name operate-item-label">产品ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text"
                                                         name="productId" value="" maxlength=6/>
							</span>
                    </li>
                    <li>
                        <label class="name operate-item-label">优惠券编号</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text"
                                                         id="couponsid" name="couponId" value="${couponId}"
                                                         maxlength=6/>
							</span>
                    </li>

                    <li class="btn-group">
                        <a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
                        <a href="javascript:void(0)" class="search-btn" onclick="clearForms()">重置</a>
                    </li>
                </ul>
            </form>
        </div>
        <!-- 搜索end -->
        <!-- 列表 -->
        <div class="list-item fn-clear">
            <a href="${base}/coupons/addActivityCoupons" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增优惠劵活动</a>
            <table id="dg-list" class="ebao-datagrid" style="margin-right:10px;">
            </table>
        </div>
        <!-- 列表end -->
    </div>
</div>
<#---保障期限的弹框-->
<iframe id="dlg-box" class="dlg-box" scrolling="auto" frameborder="0"  style="width:1000px;height:500px;"></iframe>

<script>
    $(function () {
        validExtend();
        //列表
        $("#dg-list").datagrid({
            url: '${base}/coupons/findactivitylist',
            method: 'post',
            fitColumns: true,
            rownumbers: true,
            nowrap: true,//当数据长度超出列宽时将会自动截取
            resizable: false,
            checkOnSelect: false,
            pagination: true,
            pageSize: 10,
            idField: 'couponId',
            columns: [[
                {
                    field: 'promotionId', align: 'center', width: "8%", title: '活动编号',
                    formatter: function (value, rec) {
                        var url = '${base}/coupons/promotionEditInfo';
                        return '<a class="operation-link" href="' + url + '?promotionId=' + rec.promotionId + '">' + rec.promotionId + '</a>';
                    }
                },
                {field: 'promotionName', align: 'center', width: "15%", title: '活动名称'},

                {
                    field: 'effTime', align: 'center', width: "12%", title: '开始时间',
                    formatter: function (value, rec) {
                        return formatTimestamp(rec.effTime);
                    }
                },
                {
                    field: 'expTime', align: 'center', width: "12%", title: '结束时间',
                    formatter: function (value, rec) {
                        return formatTimestamp(rec.expTime);
                    }
                },

                {
                    field: 'domainStatus', align: 'center', width: "8%", title: '活动状态',
                    formatter: function (value, rec) {
                        var str = "其他";
                        if (rec.domainStatus == 1) {
                            str = "未进行";
                        }
                        if (rec.domainStatus == 2) {
                            str = "进行中";
                        }
                        if (rec.domainStatus == 3) {
                            str = "已结束";
                        }
                        return str;
                    }
                },
                {
                    field: 'proId', align: 'center', width: "15%", title: '产品ID',
                    formatter: function (value, rec) {
                        var pid = '';
                        var url = '${base}/product/toProductDetailMsgs?productId=';
                        var str = rec.proId.split(",");
                        for (var i = 0; i < str.length; i++) {
                            pid += '<a href=' + url + str[i] + "> " + str[i] + '</a>';
                        }
                        return pid;


                    }
                },
                {
                    field: 'tagId', align: 'center', width: "15%", title: '优惠劵编号',
                    formatter: function (value, rec) {
                        var pid = '';
                        var url = '${base}/coupons/toEditCoupons?couponId=';
                        var str = rec.tagId.split(",");
                        for (var i = 0; i < str.length; i++) {
                            pid += '<a href=' + url + str[i] + "> " + str[i] + '</a>';
                        }
                        return pid;
                    }
                },
                {
                    field: 'couponCodeCountFlag', align: 'center', width: "13%", title: '操作',
                    formatter: function (value, rec) {
                        if (rec.couponCodeCountFlag) {
                            return '<a class="operation-link" href="javascript:void(0);" onclick="searchCoupon(' + rec.promotionId + ',[' + rec.tagId + '],\''+rec.promotionName +'\')">生成优惠劵码</a>';
                        }
                        return '<a class="operation-link" href="javascript:void(0);" onclick="searchCoupon(' + rec.promotionId + ',[' + rec.tagId + '],\''+rec.promotionName +'\')">查看优惠劵码</a>';
                    }
                }
            ]],

            queryParams: eb.form2Json("search-ff"),
            loadFilter: function (data) {
                return eb.loadFilter(data);    //自定义过滤方法
            },
            onLoadSuccess: function () {
                pageCls();
                sortCell(['effTime', 'expTime']);//排序要显示箭头的，以数组形式传
            }
        });
        //分页
        pageAction();


    });


    function clearForms() {
        clearForm();
        document.getElementById("couponsid").value = "";

    }
    //显示弹框
    function searchCoupon(promotionId, couponIds, productName) {
        var url = '${base}/coupons/findPromotionCoupons?promotionId=' + promotionId + '&couponIds=' + couponIds.join() + '&productName=' + productName;
        list_dialog(url, '保障利益');
    }
</script>
</body>
</html>