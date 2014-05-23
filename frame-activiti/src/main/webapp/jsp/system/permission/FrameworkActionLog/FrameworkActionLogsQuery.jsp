<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  FrameworkActionLogsQuery
  Detail   :  该页用于 系统日志记录表管理-系统日志记录表查询
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<form id="pagerForm" method="post" action="aclog" onsubmit="return navTabSearch(this)">
	<input type="hidden" name="pageNum" value="${page.pageIndex}" /> <input type="hidden"
		name="numPerPage" value="${page.pageSize}" />

	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>操作人员</label> 
					<input type="text" name="logUser" value="${frameworkActionLog.logUser}" /></li>
			  	<li>
			  		<label>操作时间起始：</label>
	      			<input type="text" name="logTimeBegin" value="${frameworkActionLog.logTimeBegin}"  class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
				</li>
			   	 <li>
			  		<label>操作时间截止：</label>
	      			<input type="text" name="logTimeEnd" value="${frameworkActionLog.logTimeEnd}"  class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
				</li>
				
			</ul>
			</ul>
			<div class="subBar">
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

	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="50"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				  	
				  	<th width="130" align="center">操作IP</th>
				  	<th width="130" align="center">操作人员</th>
				  	<th width="130" align="center">操作触发Acion名称</th>
				  	<th width="130" align="center">操作结果</th>
				  	<th width="130" align="center">授权是否通过</th>
				  	<th width="130" align="center">操作时间</th>
				  <th width="130" align="center">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${page.result}" varStatus="s">
			<tr target="slt_objId" rel="${item.id }">
				<td width="50"><input name="orderIndexs" value="${item.id }" type="checkbox"></td>
				   
				    <td width="130">${item.remark}</td>
				    <td width="130">${item.logUser}</td>
				    <td width="130">${item.logOperateActionName}</td>
				  	<td width="130">
				  		<c:if test="${item.logOperateResult == '00'}">操作成功</c:if>
				  		<c:if test="${item.logOperateResult == '01'}">操作失败</c:if>
				  	</td>
				  	<td width="130">
				  	<c:if test="${item.isAuthed == 'true'}">通过授权</c:if>
				  	<c:if test="${item.isAuthed == 'false'}">未通过授权</c:if>
				  	</td>
				  	<td><fmt:formatDate value="${item.logTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				  	<td width="50">
				  		<a class="btnInfo" href="aclog/showinfo/${item.id }" target="navTab" title="查看详情">查看</a>
				   </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<c:import url="/jsp/system/panelBar.jsp"></c:import>
</div>

