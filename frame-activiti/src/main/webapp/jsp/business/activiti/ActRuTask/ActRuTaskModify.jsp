<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ActRuTaskModify
  Detail   :  该页用于 ActRuTask管理-ActRuTask修改
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
<form method="post" action="activitiTest/modifyActRuTaskAction?navTabId=activitiTest&callbackType=closeCurrent" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
			
	<input type="hidden" name="id" value="${infos.id}"/>
	<div class="pageFormContent" layoutH="56">
	 	<dl>
			<label>rev</label>
				<input type="text" name="rev" value="${infos.rev}" class="" maxlength="10"/>
		</dl>
	 	<dl>
			<label>executionId</label>
				<input type="text" name="executionId" value="${infos.executionId}" class="" maxlength="64"/>
		</dl>
	 	<dl>
			<label>procInstId</label>
				<input type="text" name="procInstId" value="${infos.procInstId}" class="" maxlength="64"/>
		</dl>
	 	<dl>
			<label>procDefId</label>
				<input type="text" name="procDefId" value="${infos.procDefId}" class="" maxlength="64"/>
		</dl>
	 	<dl>
			<label>name</label>
				<input type="text" name="name" value="${infos.name}" class="" maxlength="255"/>
		</dl>
	 	<dl>
			<label>parentTaskId</label>
				<input type="text" name="parentTaskId" value="${infos.parentTaskId}" class="" maxlength="64"/>
		</dl>
	 	<dl>
			<label>description</label>
				<input type="text" name="description" value="${infos.description}" class="" maxlength="4000"/>
		</dl>
	 	<dl>
			<label>taskDefKey</label>
				<input type="text" name="taskDefKey" value="${infos.taskDefKey}" class="" maxlength="255"/>
		</dl>
	 	<dl>
			<label>owner</label>
				<input type="text" name="owner" value="${infos.owner}" class="" maxlength="255"/>
		</dl>
	 	<dl>
			<label>assignee</label>
				<input type="text" name="assignee" value="${infos.assignee}" class="" maxlength="255"/>
		</dl>
	 	<dl>
			<label>delegation</label>
				<input type="text" name="delegation" value="${infos.delegation}" class="" maxlength="64"/>
		</dl>
	 	<dl>
			<label>priority</label>
				<input type="text" name="priority" value="${infos.priority}" class="" maxlength="10"/>
		</dl>
	 	<dl>
			<label>createTime</label>
			<input type="text" name="createTime" value="${infos.createTime}" class="required" maxlength="19"/>
		</dl>
	 	<dl>
			<label>dueDate</label>
				<input type="text" name="dueDate" value="<fmt:formatDate value="${infos.dueDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>" class="date" maxlength="19" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
		</dl>
	 	<dl>
			<label>category</label>
				<input type="text" name="category" value="${infos.category}" class="" maxlength="255"/>
		</dl>
	 	<dl>
			<label>suspensionState</label>
				<input type="text" name="suspensionState" value="${infos.suspensionState}" class="" maxlength="10"/>
		</dl>
	 	<dl>
			<label>tenantId</label>
				<input type="text" name="tenantId" value="${infos.tenantId}" class="" maxlength="255"/>
		</dl>
	</div>

	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>

