<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  FrameworkSysPermissionsQuery
  Detail   :  该页用于 FrameworkSysPermission管理-FrameworkSysPermission查询
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	//传入json菜单数据拼装成菜单数
	function getMenuTree(data, pId) {
		var tree;
		if (pId == 0) {
			tree = '<ul class="tree treeFolder expand">';
		} else {
			tree = '<ul>';
		}
		for ( var i in data) {
			var v_id = data[i].id;
			var v_pid = data[i].pid;
			var v_isLeaf = data[i].is_leaf;
			var v_sys_menu_name = data[i].sys_menu_name;
			if (v_pid == pId) {
				if(v_isLeaf == '1' ){
					
				tree += "<li><a href='permission/findByMenu?sysMenuId=" + v_id+"' target='ajax'  rel='page_menu_list' >"
						+ v_sys_menu_name + "</a>";
				}else{
					tree += "<li><a href='#'  rel='page_menu_list' title='请在根节点上操作!'>"
					+ v_sys_menu_name + "</a>";
				}
				tree += getMenuTree(data, v_id);
				tree += "</li>";
			}
		}
		return tree + "</ul>";
	}

	var menuData;

	$(document).ready(
			function() {
				$.ajax({
					url : web_root + '/permission/menuList',
					data : {},
					type : 'POST',
					dataType : "json",
					success : function(backdata) {
						menuData = backdata.lists;
					},
					async : false
				});
				$("#left_menu_tree").append(
						getMenuTree(menuData, 0).replaceAll("<ul></ul>", ""));

				$('[id=left_menu_tree]').each(function(i) {
					if (i > 0) {
						$(this).remove();
					}
				});
				
				initData();
			});
	
	function initData(){
		var menuId = $('#sysMenuId').val();
		if(menuId !=""){
			//异步刷新div
			var permissionCode = $('#permissionCode').val();
			var numPerPage = $('#numPerPage').val();
			$("#page_menu_list").loadUrl(web_root + '/permission/findByMenu?sysMenuId='+menuId+'&permissionCode='+permissionCode+'&numPerPage='+numPerPage,{}, null);
		}
	}
	
	
</script> 
	<input type="hidden" id="sysMenuId" value="${syspermModel.sysMenuId}"/>
	<input type="hidden" id="permissionCode" value="${syspermModel.permissionCode}"/>
	<input type="hidden" id="numPerPage" value="${page.pageSize}" />
<div 	>
	<div layoutH="146" id="left_menu_tree"
		style="float: left; display: block; margin: 10px; overflow: auto; width: 200px; height: 500px; border: solid 1px #CCC; line-height: 21px; background: #FFF;">
		<p>系统菜单</p>
	</div>
	<div id="page_menu_list" class="unitBox" style="margin-left:246px;">
		
	</div>
</div>
