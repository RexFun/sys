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
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i></h3>
			</div>
			<div class="box-body">
				<form class="dataForm" id="pwdForm" role="form" action="updPwd2.action" method="post">
					<div class="form-group"><label class="control-label" for="old_password">原密码：</label><input type="password" class="form-control input-sm" id="old_password" value="" validate validate-rule-required/></div>
					<div class="form-group"><label class="control-label" for="new_password">新密码：</label><input type="password" class="form-control input-sm" id="new_password" value="" validate validate-rule-required/></div>
					<input type="hidden" id="id" value="${po.m.id}"/>
				</form>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-block btn-success btn-flat pull-right" id="save"><i class="glyphicon glyphicon-floppy-save"></i></button>
			</div>
		</div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="msgModalTitle">提示</h4>
					</div>
					<div class="modal-body alert-danger" id="msgModalText"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</section>
</div>
<%@ include file="/common/inc_footer.jsp"%>
<!-- ======================================================================================================= -->
<script type="text/javascript">
$(function(){
	$chok.view.fn.selectSidebarMenu("","${param.menuName}");
	$('input').keypress(function (e) { //这里给function一个事件参数命名为e，叫event也行，随意的，e就是IE窗口发生的事件。
	    var key = e.which; //e.which是按键的值
	    if (key == 13) {
	    	$("#save").click();
	    }
	});
	$("#save").click(function(){
		if(!$chok.validator.check()) return; 
		var url = $("#pwdForm").attr('action');
		$.post(
			url, 
			{'id':$("#id").val(),'old_password':$("#old_password").val(),'new_password':$("#new_password").val()},
		  	function(data) {
				if(data.success){
					alert('密码修改成功');
				}else{
					$('#msgModalText').html(data.msg);
					$('#msgModal').modal('show');
				}
			}
		);
	});
});
</script>