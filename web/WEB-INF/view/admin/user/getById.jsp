<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/inc_header.jsp"%>
<!-- 主内容面板 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>${param.menuName}<small>明细</small></h1>
		<ol class="breadcrumb">
			<li><a href="${ctx}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="get.action?menuId=${param.menuId}&menuName=${param.menuName}">${param.menuName}</a></li>
			<li class="active">明细</li>
		</ol>
	</section>
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title"><small><i class="glyphicon glyphicon-info-sign"></i></small></h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" id="back"><i class="glyphicon glyphicon-arrow-left"></i></button>
				</div>
			</div>
			<div class="box-body">
				<form class="dataForm" id="dataForm" role="form">
					<div class="row">
						<div class="col-md-6 column">
							<fieldset>
							<legend>基础信息</legend>
								<div class="form-group"><label class="control-label" for="id">ID：</label><input type="text" class="form-control input-sm" id="id" name="m['id']" value="${po.m.id}" readonly="readonly"/></div>
								<div class="form-group"><label class="control-label" for="tc_code">代号：</label><input type="text" class="form-control input-sm" id="tc_code" name="m['tc_code']" value="${po.m.tc_code}" readonly="readonly"/></div>
								<div class="form-group"><label class="control-label" for="tc_name">名称：</label><input type="text" class="form-control input-sm" id="tc_name" name="m['tc_name']" value="${po.m.tc_name}" readonly="readonly"/></div>
								<div class="form-group"><label class="control-label" for="tc_email">邮箱：</label><input type="text" class="form-control input-sm" id="tc_email" name="m['tc_email']" value="${po.m.tc_email}" readonly="readonly"/></div>
								<div class="form-group"><label class="control-label" for="tc_add_time">创建时间：</label><input type="text" class="form-control input-sm" id="tc_add_time" name="m['tc_add_time']" value="${po.m.tc_add_time}" readonly="readonly"/></div>
							</fieldset>
						</div>
						<div class="col-md-6 column">
							<fieldset>
							<legend>角色</legend>
								<input type="checkbox" id="expandAll"/><label for="expandAll">&nbsp;展开</label>
								<ul id="roleTree" class="ztree" style="overflow:auto"></ul>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
			<div class="box-footer">
			&nbsp;
			</div>
		</div>
	</section>
</div>
<%@ include file="/common/inc_footer.jsp"%>
<!-- ======================================================================================================= -->
<link rel="stylesheet" type="text/css" href="/static/res/ztree/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="/static/res/ztree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="/static/res/chok/js/chok.view.getById.js"></script>
<script type="text/javascript">
/**********************************************************/
/* 全局函数 */
/**********************************************************/
$(function(){
	$chok.view.fn.selectSidebarMenu("${param.menuId}","${param.menuName}");
	// 返回列表页
	$("#back").click(function(){
		location.href = "get.action?"+$chok.view.fn.getUrlParams("${queryParams}");
	});
	// zTree的初始化
    zTreeObj = $.fn.zTree.init($("#roleTree"), setting);
    // 全部展开/折叠
    $("#expandAll").click(function(){
    	var zTree = $.fn.zTree.getZTreeObj("roleTree");
        if($(this).prop("checked")==true){
        	zTree.expandAll(true);
        }else{
        	zTree.expandAll(false);
        }
    });
});
/**********************************************************/
/* zTree配置 */
/**********************************************************/
// zTree 的参数配置
var zTreeObj;
var setting = 
{
	check: 
	{
		enable: true
	},
	async: 
	{
		enable: true,
		url:"getRoleTreeNodesByUserId.action?tc_user_id=${po.m.id}"
	},
	data: 
	{
		key: 
		{
			name:"tc_name"
		},
		simpleData: 
		{
			idKey:"id",
			pIdKey:"pid",
			enable: true
		}
	},
	callback: {
		onCheck: function (event, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("roleTree")
		    var nodes = zTree.getCheckedNodes(true);
	    	var ids = [];
	    	for(var i=0; i<nodes.length; i++) {
	    		ids.push(nodes[i].id);
	    	}
	    	$("#tc_role_ids").val(ids);
		}
	}
};
</script>