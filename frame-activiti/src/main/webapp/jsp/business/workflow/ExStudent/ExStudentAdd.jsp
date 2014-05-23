<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ExStudentAdd
  Detail   :  该页用于 ExStudent管理-ExStudent新增
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
<form method="post" action="activitiTest/saveExStudentAction?navTabId=activitiTest&callbackType=closeCurrent" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
	 	<dl>
			<label>姓名</label>
			<input type="text" name="name" class="required" maxlength="128"/>
		</dl>
	 	<dl>
			<label>生日</label>
				<input type="text" name="birthday" class="date" maxlength="19" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
		</dl>
	 	<dl>
			<label>姓别</label>
				<input type="text" name="sex" class="" maxlength="5"/>
		</dl>
	 	<dl>
			<label>描述</label>
				<input type="text" name="desc" class="" maxlength="65535"/>
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

