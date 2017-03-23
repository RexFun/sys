<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/inc_header.jsp"%>
<!-- 主内容面板 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>${param.menuName}</h1>
		<ol class="breadcrumb">
			<li><a href="${ctx}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li class="active">${param.menuName}</li>
		</ol>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-9">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title"><small><i class="glyphicon glyphicon-th-list"></i></small></h3>
					</div>
					<div class="box-body">
						<!-- toolbar
						======================================================================================================= -->
						<div id="toolbar">
						<button type="button" class="btn btn-default" id="bar_btn_add" pbtnId="pbtn_add"><i class="glyphicon glyphicon-plus"></i></button>
						<button type="button" class="btn btn-default" id="bar_btn_del" pbtnId="pbtn_del"><i class="glyphicon glyphicon-remove"></i></button>
						<button type="button" class="btn btn-default" id="bar_btn_query" pbtnId="pbtn_query" data-toggle="modal" data-target="#modal_form_query"><i class="glyphicon glyphicon-search"></i></button>
						</div>
						<!-- data list
						======================================================================================================= -->
						<table id="tb_list"></table>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title"><small><i class="glyphicon glyphicon-equalizer"></i></small></h3>
					</div>
					<div class="box-body">
						<input type="checkbox" id="expandAll"/><label for="expandAll">&nbsp;展开</label>
						<ul id="permitTree" class="ztree" style="overflow:auto;padding-left:0px"></ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- query form modal ======================================================================================================= -->
<form id="form_query">
<div id="modal_form_query" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modal_label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title" id="modal_label">筛选条件</h4>
			</div>
			<div class="modal-body">
				<!-- queryForm -->
				<div class="form-group">
					<label for="f_tc_code">代号：</label><input type="text" class="form-control input-sm" id="f_tc_code"/>
					<label for="f_tc_name">名称：</label><input type="text" class="form-control input-sm" id="f_tc_name"/>
					<label for="f_tc_p_name">父节点名称：</label><input type="text" class="form-control input-sm" id="f_tc_p_name"/>
					<label for="f_tc_app_id">应用：</label>
					<select class="form-control input-sm" id="f_tc_app_id">
						<option value="">全部</option>
						<c:forEach var="o" items="${appList}"><option value="${o.m.id}">${o.m.tc_name}</option></c:forEach>
					</select>
					<label for="f_tc_type">类型：</label>
					<select class="form-control input-sm" id="f_tc_type" name="po.m.tc_type">
						<option value="">全部</option>
						<option value="0">应用</option>
						<option value="1">菜单</option>
						<option value="2">按钮</option>
						<option value="3">请求</option>
					</select>
				</div>
			</div>
			<div class="modal-footer">
			   <button type="reset" class="btn btn-default"><i class="glyphicon glyphicon-repeat"></i></button>
			   <button type="button" class="btn btn-primary" id="form_query_btn"><i class="glyphicon glyphicon-ok"></i></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</form>
<%@ include file="/common/inc_footer.jsp"%>
<!-- ======================================================================================================= -->
<%@ include file="/common/inc_js_btn_permit.jsp"%>
<link rel="stylesheet" type="text/css" href="/static/res/ztree/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="/static/res/ztree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="/static/res/chok/js/chok.view.get.js"></script>
<script type="text/javascript">
/**********************************************************/
/* 全局函数 */
/**********************************************************/
$(function() {
	$chok.view.fn.selectSidebarMenu("${param.menuId}","${param.menuName}");
	$chok.view.get.init.toolbar();
	$chok.view.get.init.modalFormQuery();
	$chok.view.get.init.table("${queryParams.f_page}","${queryParams.f_pageSize}");
	initBtnPermit("${sessionScope.CUR_MENU_PERMIT_ID}");
});
/**********************************************************/
/* 初始化配置 */
/**********************************************************/
$chok.view.get.config.setPreFormParams = function(){
 	$("#f_tc_app_id").val(typeof("${queryParams.f_tc_app_id}")=="undefined"?"":"${queryParams.f_tc_app_id}");
 	$("#f_tc_p_name").val(typeof("${queryParams.f_tc_p_name}")=="undefined"?"":"${queryParams.f_tc_p_name}");
	$("#f_tc_code").val(typeof("${queryParams.f_tc_code}")=="undefined"?"":"${queryParams.f_tc_code}");
	$("#f_tc_name").val(typeof("${queryParams.f_tc_name}")=="undefined"?"":"${queryParams.f_tc_name}");
	$("#f_tc_type").val(typeof("${queryParams.f_tc_type}")=="undefined"?"":"${queryParams.f_tc_type}"); 
};
$chok.view.get.config.formParams = function(p){
	p.tc_app_id = $("#f_tc_app_id").val();
	p.tc_code = $("#f_tc_code").val();
	p.tc_name = $("#f_tc_name").val();
	p.tc_type = $("#f_tc_type").val();
	p.tc_p_name = $("#f_tc_p_name").val();
    return p;
};
$chok.view.get.config.urlParams = function(){
	return {f_tc_app_id : $("#f_tc_app_id").val(),
		   	f_tc_code : $("#f_tc_code").val(),
		   	f_tc_name : $("#f_tc_name").val(),
		   	f_tc_type : $("#f_tc_type").val(),
			f_tc_p_name : $("#f_tc_p_name").val()};
};
$chok.view.get.config.tableColumns = 
[
	{title:'ID', field:'m.id', align:'center', valign:'middle', sortable:false},
    {title:'PID', field:'m.pid', align:'center', valign:'middle', sortable:false},
	{title:'代号', field:'m.tc_code', align:'center', valign:'middle', sortable:false},
    {title:'名称', field:'m.tc_name', align:'center', valign:'middle', sortable:false},
    {title:'类型', field:'m.tc_type_name', align:'center', valign:'middle', sortable:false},
    {title:'URL', field:'m.tc_url', align:'center', valign:'middle', sortable:false},
    {title:'排序', field:'m.tc_order', align:'center', valign:'middle', sortable:false},
    {title:'应用', field:'m.tc_app_name', align:'center', valign:'middle', sortable:false}
];
$chok.view.get.callback.delRows = function(){
	//zTreeObj.reAsyncChildNodes(null, "refresh"); // 刷新zTree
	initTree();
};
$chok.view.get.callback.onLoadSuccess = function(){
	//zTreeObj.reAsyncChildNodes(null, "refresh"); // 刷新zTree
	initTree();
	initBtnPermit("${sessionScope.CUR_MENU_PERMIT_ID}");
};
/**********************************************************/
/* zTree配置 */
/**********************************************************/
// zTree 的参数配置
var zTreeObj;
var setting = 
{
	view: 
	{
		selectedMulti: false
	},
	edit: 
	{
		enable: false//,
		/* editNameSelectAll: true,
		showRemoveBtn: showRemoveBtn,
		showRenameBtn: showRenameBtn */
	},
	check: 
	{
		enable: false
	},
	async: 
	{
		enable: true,
		url:function(){return "${ctx}/dict/getPermitTreeNodes.action?tc_app_id="+$("#f_tc_app_id").val();}
	},
	data: 
	{
		key: 
		{
			name:"tc_name2"
		},
		simpleData: 
		{
			idKey:"id",
			pIdKey:"pid",
			enable: true
		}
	},
	callback: {
	}
};
// zTree的初始化
function initTree() {
    zTreeObj = $.fn.zTree.init($("#permitTree"), setting);
    // 全部展开/折叠
    $("#expandAll").click(function(){
    	var zTree = $.fn.zTree.getZTreeObj("permitTree");
        if($(this).prop("checked")==true){
        	zTree.expandAll(true);
        }else{
        	zTree.expandAll(false);
        }
    });
}
</script>