<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  FrameworkActionLogDetail
  Detail   :  该页用于 系统日志记录表管理-系统日志记录表明细信息
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
<form method="post" action="" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
	 	<p>
			<label>ID<seq>  </label>
			<input type="text" name="id" value="${infos.id}" class="required" maxlength="20"/>
		</p>
	 	<p>
			<label>操作时间</label>
				<input type="text" name="logTime" value='<fmt:formatDate value="${infos.logTime}" pattern="yyyy-MM-dd" type="date"/>' class="date" maxlength="20"/>
				
		</p>
	 	<p>
			<label>操作人员</label>
				<input type="text" name="logUser" value="${infos.logUser}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>操作类型</label>
				<input type="text" name="logOperate" value="${infos.logOperate}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>操作内容</label>
				<input type="text" name="logContent" value="${infos.logContent}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>备注    </label>
				<input type="text" name="remark" value="${infos.remark}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>版本号  </label>
				<input type="text" name="version" value="${infos.version}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>操作对象名</label>
				<input type="text" name="logOperateClass" value="${infos.logOperateClass}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>操作对象方法</label>
				<input type="text" name="logOperateMethod" value="${infos.logOperateMethod}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>操作结果</label>
				<input type="text" name="logOperateResult" value="${infos.logOperateResult}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>日志类型</label>
				<input type="text" name="logType" value="${infos.logType}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>授权是否通过</label>
				<input type="text" name="isAuthed" value="${infos.isAuthed}" class="" maxlength="20"/>
		</p>
	 	<p>
			<label>操作action名字</label>
				<input type="text" name="logOperateActionName" value="${infos.logOperateActionName}" class="" />
		</p>
	 	<p>
			<label>捕捉到的参数信息</label>
			<textarea id="changeTableInfo" name="changeTableInfo" readonly="true" cols="75" rows="2">${infos.changeTableInfo}</textarea>
		</p>
	</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>
