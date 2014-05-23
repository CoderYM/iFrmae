<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ActRuTaskDetail
  Detail   :  该页用于 ActRuTask管理-ActRuTask明细信息
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
<form method="post" action="" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
	 	<dl>
			<label>rev</label>
				<input type="text" name="rev" value="${infos.rev}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>executionId</label>
				<input type="text" name="executionId" value="${infos.executionId}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>procInstId</label>
				<input type="text" name="procInstId" value="${infos.procInstId}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>procDefId</label>
				<input type="text" name="procDefId" value="${infos.procDefId}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>name</label>
				<input type="text" name="name" value="${infos.name}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>parentTaskId</label>
				<input type="text" name="parentTaskId" value="${infos.parentTaskId}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>description</label>
				<input type="text" name="description" value="${infos.description}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>taskDefKey</label>
				<input type="text" name="taskDefKey" value="${infos.taskDefKey}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>owner</label>
				<input type="text" name="owner" value="${infos.owner}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>assignee</label>
				<input type="text" name="assignee" value="${infos.assignee}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>delegation</label>
				<input type="text" name="delegation" value="${infos.delegation}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>priority</label>
				<input type="text" name="priority" value="${infos.priority}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>createTime</label>
			<input type="text" name="createTime" value="${infos.createTime}" class="required"  readonly/>
		</dl>
	 	<dl>
			<label>dueDate</label>
				<input type="text" name="dueDate" value='<fmt:formatDate value="${infos.dueDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>' class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"  />
		</dl>
	 	<dl>
			<label>category</label>
				<input type="text" name="category" value="${infos.category}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>suspensionState</label>
				<input type="text" name="suspensionState" value="${infos.suspensionState}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>tenantId</label>
				<input type="text" name="tenantId" value="${infos.tenantId}" class=""  readonly/>
		</dl>
	</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>
