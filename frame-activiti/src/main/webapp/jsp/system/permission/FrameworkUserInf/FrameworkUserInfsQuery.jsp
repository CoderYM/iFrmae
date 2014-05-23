<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  FrameworkUserInfsQuery
  Detail   :  该页用于 BOSS操作员基本信息表管理-BOSS操作员基本信息表查询
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var userPermCodeList = getPermCodeListByUser();
//if(userPermCodeList.length > 0){
	//for(var i=0;i<userPermCodeList.length;i++){
		//alert(userPermCodeList.lists[i].permName+" : "+userPermCodeList.lists[i].permCode);
	//}
	
//}
</script>

<form id="pagerForm" method="post" action="sysuser" onsubmit="return navTabSearch(this)">
	<input type="hidden" name="pageNum" value="${page.pageIndex}" /> <input type="hidden"
		name="numPerPage" value="${page.pageSize}" />

	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>操作员名称</label> 
				<input type="text" name="userName" value="${userInf.userName }" /></li>

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
			<li><a class="add" target="navTab" rel="bookNav"
				href="sysuser/addFrameworkUserInfToPage" title="添加"><span>添加</span></a></li>
			<li><a class="delete" target="selectedTodo" rel="orderIndexs"
					postType="string" href="sysuser/deleteAll" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>


	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="50"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				  	<th width="130" align="center">操作员名称</th>
				  	<th width="130" align="center">操作员真实姓名</th>
				  	<th width="130" align="center">手机号码</th>
				  	<th width="130" align="center">座机号码</th>
				  	<th width="130" align="center">邮箱</th>
				  	<th width="130" align="center">操作员描述</th>
				  	<th width="130" align="center">创建时间</th>
				  	<th width="130" align="center">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${page.result}" varStatus="s">
			<tr target="slt_objId" rel="${item.id }">
				<td width="50"><input name="orderIndexs" value="${item.id }" type="checkbox"></td>
				   
				  	<td width="130">${item.userName}</td>
				   
				  	<td width="130">${item.realName}</td>
				   
				  	<td width="130">${item.mobile}</td>
				   
				  	<td width="130">${item.contactPhone}</td>
				   
				  	<td width="130">${item.contactEmail}</td>
				   
				  	<td width="130">${item.userDesc}</td>
				   
					<td><fmt:formatDate value="${item.rowCrtTs}" pattern="yyyy-MM-dd"/></td>
				  	<td width="130">
						<a class="btnDel" href="sysuser/delete/${item.id }" target="ajaxTodo" title="你确定要删除吗?">删除</a>
						<a class="btnEdit" href="sysuser/modify/${item.id }" target="navTab" rel="bookNav" title="编辑">编辑</a>
				   </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<c:import url="/jsp/system/panelBar.jsp"></c:import>
</div>

