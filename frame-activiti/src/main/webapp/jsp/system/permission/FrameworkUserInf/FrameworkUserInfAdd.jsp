<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  FrameworkUserInfAdd
  Detail   :  该页用于 BOSS操作员基本信息表管理-BOSS操作员基本信息表新增
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

function checkBeforeSubmit(){
	var flag = false;
	$('input[name="roleIds"]').each(function(){
		if($(this).attr("checked")=='checked'){
			flag = true;
		}
	});
	if(flag){
		$('#userInfForm').submit();
	}else{
		alertMsg.warn("请至少选中一个角色");
	}
}

</script>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
	<form method="post" id="userInfForm"
		action="sysuser/saveFrameworkUserInfAction?navTabId=sysuser&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone);">
		<div class="pageFormContent nowrap" layoutH="56">
			<dl>
				<dt>操作员名称：</dt>
				<dd>
					<input type="text" name="userName" maxlength="18" class="required" />
				</dd>
			</dl>
			<dl>
				<dt>密码:</dt>
				<dd>
					<input id="w_validation_pwd" type="password" name="userPassword"
						class="required alphanumeric" minlength="6" maxlength="20"
						alt="字母、数字、下划线 6-20位" />
				</dd>
			</dl>
			<dl>
				<dt>确认密码:</dt>
				<dd>
					<input type="password" name="rep_userPassword" class="required"
						equalto="#w_validation_pwd" />
				</dd>
			</dl>
			<dl>
				<dt>操作员真实姓名</dt>
				<dd>
					<input type="text" name="realName" class="required" maxlength="20" />
				</dd>
			</dl>
			<dl>
				<dt>手机号码</dt>
				<dd>
					<input type="text" name="mobile" class="required phone" maxlength="15" />
				</dd>
			</dl>
			<dl>
				<dt>座机号码</dt>
				<dd>
					<input type="text" name="contactPhone" class="required phone" maxlength="15" />
				</dd>
			</dl>
			<dl>
				<dt>邮箱</dt>
				<dd>
					<input type="text" name="contactEmail" class="required email" maxlength="60" />
				</dd>
			</dl>
			<dl>
				<dt>操作员描述</dt>
				<dd>
					<input type="text" name="userDesc" class="" maxlength="100" />
				</dd>
			</dl>
			<dl >
				<fieldset>
				<legend>系统角色:<font color=red>*</font></legend>
				   <c:forEach items="${sysRoleList}" var="role" >
			           <lable><input type="checkbox" name="roleIds" value="${role.id }"/>${role.sysRoleName }</lable> &nbsp;&nbsp;
			       </c:forEach>
			           
				</fieldset>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onClick="checkBeforeSubmit();" >保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

