<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ExStudentDetail
  Detail   :  该页用于 ExStudent管理-ExStudent明细信息
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
<form method="post" action="" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
	 	<dl>
			<label>姓名</label>
			<input type="text" name="name" value="${infos.name}" class="required"  readonly/>
		</dl>
	 	<dl>
			<label>生日</label>
				<input type="text" name="birthday" value='<fmt:formatDate value="${infos.birthday}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>' class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"  />
		</dl>
	 	<dl>
			<label>姓别</label>
				<input type="text" name="sex" value="${infos.sex}" class=""  readonly/>
		</dl>
	 	<dl>
			<label>描述</label>
				<input type="text" name="desc" value="${infos.desc}" class=""  readonly/>
		</dl>
	</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>
