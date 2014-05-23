<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  FrameworkSysPermissionsQuery
  Detail   :  该页用于 FrameworkSysPermission管理-FrameworkSysPermission查询
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
		<form id="pagerForm" method="post" action="permission/findByMenu" onsubmit="return divSearch(this,'page_menu_list')">
			<input type="hidden" name="pageNum" value="${page.pageIndex}" /> 
			<input type="hidden" name="numPerPage" value="${page.pageSize}" /> 

			<div class="pageHeader">
				<div class="searchBar">
					<ul class="searchContent">
						<li><label>权限编码</label> <input type="text" name="permissionCode" 
							value="${syspermModel.permissionCode}" />
							 <input type="hidden" name="sysMenuId"
							value="${syspermModel.sysMenuId}" /> </li>
					</ul>
					<div class="subBar">
						<span style="margin-left: 5px; line-height: 25px; float: left">总数:
							<strong>${page.totalRecord}</strong>
						</span>
						<ul>
							<li><div class="buttonActive">
									<div class="buttonContent">
										<button type="submit">搜索</button>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</form>
		<div class="pageContent">

			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" target="dialog"  mask="true"
						href="permission/addFrameworkSysPermissionToPage?sysMenuId=${syspermModel.sysMenuId}" title="添加"><span>添加</span></a></li>
					<li><a class="delete" target="selectedTodo" rel="orderIndexs"
						postType="string" href="permission/deleteAll?rel=page_menu_list" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
					<li class="line">line</li>
				</ul>
			</div>


			<table class="table" width="100%" layoutH="138">
				<thead>
					<tr>
						<th width="50"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
						<th width="130" align="center">菜单ID</th>
						<th width="130" align="center">权限编码</th>
						<th width="130" align="center">权限名</th>
						<th width="130" align="center">权限描述</th>
						<th width="130" align="center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${page.result}" varStatus="s">
						<tr target="slt_objId" rel="${item.id }">
							<td width="50"><input name="orderIndexs" value="${item.id}" type="checkbox"></td>

							<td width="130">${item.sysMenuId}</td>

							<td width="130">${item.permissionCode}</td>

							<td width="130">${item.permissionName}</td>

							<td width="130">${item.permissionDescription}</td>

							<td width="130">
								<a class="btnDel" href="permission/delete/${item.id }?rel=page_menu_list"  target="ajaxTodo"  title="你确定要删除吗?">删除</a>
								<a class="btnEdit" href="permission/modify/${item.id }" target="dialog" mask="true"  title="编辑">编辑</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
</div>
			<div class="panelBar">
	<div class="pages">
		<span>显示</span>
		<select name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value},'page_menu_list')">
			<c:forEach begin="10" end="40" step="10" varStatus="s">
				<option value="${s.index}" ${page.pageSize eq s.index ? 'selected="selected"' : ''}>${s.index}</option>
			</c:forEach>
		</select>
		<span>条，共: ${page.totalRecord}</span>
	</div>
	
	<div class="pagination" targetType="navTab" rel="page_menu_list" totalCount="${page.totalRecord}" numPerPage="${page.pageSize}" pageNumShown="10" currentPage="${page.pageIndex}"></div>
