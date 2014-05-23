<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ActRuTasksQuery
  Detail   :  该页用于 ActRuTask管理-ActRuTask查询
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
					<label>rev：</label> 
					<input type="text" name="rev" value="${actRuTask.rev}" />
				</li>
			   	 
				<li>
					<label>executionId：</label> 
					<input type="text" name="executionId" value="${actRuTask.executionId}" />
				</li>
			   	 
				<li>
					<label>procInstId：</label> 
					<input type="text" name="procInstId" value="${actRuTask.procInstId}" />
				</li>
			   	 	</ul>
			   	 	<ul class="searchContent">
			   	 
				<li>
					<label>procDefId：</label> 
					<input type="text" name="procDefId" value="${actRuTask.procDefId}" />
				</li>
			   	 
				<li>
					<label>name：</label> 
					<input type="text" name="name" value="${actRuTask.name}" />
				</li>
			   	 
				<li>
					<label>parentTaskId：</label> 
					<input type="text" name="parentTaskId" value="${actRuTask.parentTaskId}" />
				</li>
			   	 	</ul>
			   	 	<ul class="searchContent">
			   	 
				<li>
					<label>description：</label> 
					<input type="text" name="description" value="${actRuTask.description}" />
				</li>
			   	 
				<li>
					<label>taskDefKey：</label> 
					<input type="text" name="taskDefKey" value="${actRuTask.taskDefKey}" />
				</li>
			   	 
				<li>
					<label>owner：</label> 
					<input type="text" name="owner" value="${actRuTask.owner}" />
				</li>
			   	 	</ul>
			   	 	<ul class="searchContent">
			   	 
				<li>
					<label>assignee：</label> 
					<input type="text" name="assignee" value="${actRuTask.assignee}" />
				</li>
			   	 
				<li>
					<label>delegation：</label> 
					<input type="text" name="delegation" value="${actRuTask.delegation}" />
				</li>
			   	 
				<li>
					<label>priority：</label> 
					<input type="text" name="priority" value="${actRuTask.priority}" />
				</li>
			   	 	</ul>
			   	 	<ul class="searchContent">
			   	 
			  	<li>
			  		<label>createTime：</label>
	      			<input type="text" name="createTime" value="${actRuTask.createTime}"  class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
	      			<a class="inputDateButton" href="#">选择</a>
				</li>
			   	 
			  	<li>
			  		<label>dueDate：</label>
	      			<input type="text" name="dueDate" value="${actRuTask.dueDate}"  class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
	      			<a class="inputDateButton" href="#">选择</a>
				</li>
			   	 
				<li>
					<label>category：</label> 
					<input type="text" name="category" value="${actRuTask.category}" />
				</li>
			   	 	</ul>
			   	 	<ul class="searchContent">
			   	 
				<li>
					<label>suspensionState：</label> 
					<input type="text" name="suspensionState" value="${actRuTask.suspensionState}" />
				</li>
			   	 
				<li>
					<label>tenantId：</label> 
					<input type="text" name="tenantId" value="${actRuTask.tenantId}" />
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
			<li><a class="add" target="navTab" rel="activitiTestNav"
				href="activitiTest/addActRuTaskToPage" title="添加"><span>添加</span></a></li>
			<li><a class="delete" target="selectedTodo" rel="orderIndexs"
					postType="string" href="activitiTest/deleteAll" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>


	<table class="table" width="100%" layoutH="188">
		<thead>
			<tr>
				<th width="50"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				  		<th width="130" align="center">rev</th>
				  		<th width="130" align="center">executionId</th>
				  		<th width="130" align="center">procInstId</th>
				  		<th width="130" align="center">procDefId</th>
				  		<th width="130" align="center">name</th>
				  		<th width="130" align="center">parentTaskId</th>
				  		<th width="130" align="center">description</th>
				  		<th width="130" align="center">taskDefKey</th>
				  		<th width="130" align="center">owner</th>
				  		<th width="130" align="center">assignee</th>
				  		<th width="130" align="center">delegation</th>
				  		<th width="130" align="center">priority</th>
				  		<th width="130" align="center">createTime</th>
				  		<th width="130" align="center">dueDate</th>
				  		<th width="130" align="center">category</th>
				  		<th width="130" align="center">suspensionState</th>
				  		<th width="130" align="center">tenantId</th>
				  <th width="130" align="center">操作</th>
			</tr>
		</thead>
		<tbody>
			
		<c:forEach var="item" items="${page.result}" varStatus="s">
			<tr target="slt_objId" rel="${item.id}">
				<td width="50"><input name="orderIndexs" value="${item.id }" type="checkbox"></td>
				   
				  	<td width="130" align="center">${item.rev}</td>
				   
				  	<td width="130" align="center">${item.executionId}</td>
				   
				  	<td width="130" align="center">${item.procInstId}</td>
				   
				  	<td width="130" align="center">${item.procDefId}</td>
				   
				  	<td width="130" align="center">${item.name}</td>
				   
				  	<td width="130" align="center">${item.parentTaskId}</td>
				   
				  	<td width="130" align="center">${item.description}</td>
				   
				  	<td width="130" align="center">${item.taskDefKey}</td>
				   
				  	<td width="130" align="center">${item.owner}</td>
				   
				  	<td width="130" align="center">${item.assignee}</td>
				   
				  	<td width="130" align="center">${item.delegation}</td>
				   
				  	<td width="130" align="center">${item.priority}</td>
				    
					<td width="150"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				    
					<td width="150"><fmt:formatDate value="${item.dueDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				   
				  	<td width="130" align="center">${item.category}</td>
				   
				  	<td width="130" align="center">${item.suspensionState}</td>
				   
				  	<td width="130" align="center">${item.tenantId}</td>
				  
				  	<td width="130">&nbsp;
				  		<a class="btnInfo" href="activitiTest/showinfo/${item.id }" target="navTab" title="查看详情">查看</a>
						<a class="btnDel" href="activitiTest/delete/${item.id }" target="ajaxTodo" title="你确定要删除吗?">删除</a>
						<a class="btnEdit" href="activitiTest/modify/${item.id }" target="navTab" rel="activitiTestNav" title="编辑">编辑</a>
				   </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<c:import url="/jsp/system/panelBar.jsp"></c:import>
</div>

