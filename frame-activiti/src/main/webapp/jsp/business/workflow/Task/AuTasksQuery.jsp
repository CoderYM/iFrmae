<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ExStudentsQuery
  Detail   :  该页用于 ExStudent管理-ExStudent查询
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function resetAll(){
	$(document).find("input[type=text],select").each(function(){
		$(this).val('');
	});
}
</script>
<form id="pagerForm" method="post" action="activitiTest" onsubmit="return navTabSearch(this)">
	<input type="hidden" name="pageNum" value="1" /> 
	<input type="hidden" name="numPerPage" value="${page.pageSize}" />

	<div class="pageHeader">
		<div class="searchBar">
			   	 	<ul class="searchContent">
			   	 
				<li>
					<label>姓名：</label> 
					<input type="text" name="name" value="${auTask.name}" />
				</li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">搜索</button>
							</div>
						</div></li>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="button" onclick="resetAll();">清空</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</form>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
		</ul>
	</div>


	<table class="table" width="100%" layoutH="188">
		<thead>
			<tr>
				<th width="50"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				  		<th width="130" align="center">姓名</th>
				  		<th width="130" align="center">生日</th>
				  		<th width="130" align="center">姓别</th>
				  		<th width="130" align="center">描述</th>
				  <th width="130" align="center">操作</th>
			</tr>
		</thead>
		<tbody>
			
		<c:forEach var="item" items="${page.result}" varStatus="s">
			<tr target="slt_objId" rel="${item.stuId}">
				<td width="50"><input name="orderIndexs" value="${item.stuId }" type="checkbox"></td>
				   
				  	<td width="130" align="center">${item.name}</td>
				    
					<td width="150"><fmt:formatDate value="${item.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				   
				  	<td width="130" align="center">${item.sex}</td>
				   
				  	<td width="130" align="center">${item.desc}</td>
				  
				  	<td width="130">&nbsp;
				  		<a class="btnInfo" href="activitiTest/showinfo/${item.stuId }" target="navTab" title="查看详情">查看</a>
						<a class="btnDel" href="activitiTest/delete/${item.stuId }" target="ajaxTodo" title="你确定要删除吗?">删除</a>
						<a class="btnEdit" href="activitiTest/modify/${item.stuId }" target="navTab" rel="activitiTestNav" title="编辑">编辑</a>
				   </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<c:import url="/jsp/system/panelBar.jsp"></c:import>
</div>

