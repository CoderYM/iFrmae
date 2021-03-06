<script src="${web_root}/js/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${web_root}/js/dwz/speedup.js" type="text/javascript"></script>
<script src="${web_root}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
<script src="${web_root}/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
<script src="${web_root}/js/jquery/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${web_root}/js/dwz/xheditor/xheditor-1.1.14-zh-cn.min.js" type="text/javascript"></script>
<script src="${web_root}/js/dwz/swfobject.js" type="text/javascript"></script>
<script src="${web_root}/css/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>
<script src="${web_root}/js/dwz/underscore-min.js" type="text/javascript"></script>
<script src="${web_root}/js/dwz/dwz.min.js" type="text/javascript"></script>
<script src="${web_root}/js/dwz/dwz.regional.zh.js" type="text/javascript"></script>
<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="${web_root}/js/chart/raphael-min.js"></script>
<script type="text/javascript" src="${web_root}/js/chart/g.raphael.js"></script>
<script type="text/javascript" src="${web_root}/js/chart/g.bar.js"></script>
<script type="text/javascript" src="${web_root}/js/chart/g.line.js"></script>
<script type="text/javascript" src="${web_root}/js/chart/g.pie.js"></script>
<script type="text/javascript" src="${web_root}/js/chart/g.dot.js"></script>
<script type="text/javascript">
var web_root = "${web_root}";

	$(function(){
		DWZ.init("${web_root}/js/dwz/dwz.frag.xml", {
			loginUrl:"login_dialog.html",  loginTitle:"登录",	// 弹出登录对话框
			statusCode:{ok:200, error:300, timeout:301}, //【可选】
			pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
			debug:false,	// 调试模式 【true|false】
			callback:function(){
				initEnv();
				$("#themeList").theme({themeBase:"${web_root}/css/themes"}); // themeBase 相对于index页面的主题base路径
			}
		});
		
	});
	
(function(a) {
//取用户的权限编码到前台进行元素过滤
	getPermCodeListByUser = function(){
		var permList = new Object();
		  $.ajax( {
				url : web_root+'/getPermissionByUser',
				data: {},
		   		dataType : "json",
				type : 'POST',
				success : function(backdata) {
		   			permList = backdata;
				},
				async: false
			});
		return permList;
	};
	loadDWZComBox = function(){
		$("[id=combox_w_combox_common_select]").each(function(i){
			$(this).hide();
		});
		$("a",$("#op_combox_w_combox_common_select").children()[1]).click();
	};
	//inputName:div的id,jsonUrl:获取多选框的json请求
	checkBoxListByJson = function (inputName,jsonUrl){
		 var div_obj = $("#"+inputName+"_div");
		 div_obj.empty();
		 $.ajax({url:jsonUrl+"&"+ new Date(),data:{},dataType:"json",type:"POST",async: false,success:function(backdata){
					var mapLength = backdata.length;
					if(Number(mapLength) > 0){
						var txTypeHtml = "<table><tr>";
						var n=0;
						$.each(backdata.maps, function(key,value) {
							txTypeHtml += '<td nowrap style="width: 150px;word-break : break-all;">';
							txTypeHtml += '<input type="checkbox" id="'+inputName+'" name="'+inputName+'" value="'+key+'">'+value+'</input></td>';
							if(n != 0){
								if((n+1)%6 == 0){
									txTypeHtml += '</tr><tr>';
								}
							}
							n++;
						});
						txTypeHtml +="</table>";
						div_obj.html(txTypeHtml);
					}
		 		}
			});
	};
	//inputName: 属性name,type:查询界面(select),其他(''),jsonUrl:获取数据的请求url,initValue:下拉框初始化值
	selectListByJson = function(inputName,type,jsonUrl,initValue){
		var div_obj;
		if(arguments.length > 4){
			if(arguments[4] == 'dialog'){
				div_obj = $("select[name='"+inputName+"']",$.pdialog.getCurrent());                
			}else{
		  		div_obj = arguments[4].find("select[name='"+inputName+"']");
			}
		}else{
		  	div_obj = $("select[name='"+inputName+"']",navTab.getCurrentPanel());
		}
		$.getJSON(jsonUrl,function(backdata) {
				div_obj.empty();
				var sOpt;
				if(type == 'select'){
					sOpt = $('<option value="">全部</option>');
				}else if(type == 'false'){
					sOpt = $("");
				}else{
					sOpt = $('<option value="">请选择</option>');
				}
				div_obj.append(sOpt);
				var mapLength = backdata.length;
				if(Number(mapLength) > 0){
					$.each(backdata.maps, function(key,value) {
						sOpt = $('<option>'+value+'</option>').val(key);
						div_obj.append(sOpt);
						
					});
					div_obj.val(initValue);
				}
		});
		
		
	};
	//根据后台数据库的多选框的值将页面上的多选框打勾
	//inputName:属性name,arrayObj:以逗号分割的多选框的值 例如:setComBoxCheckedByData("businessType","${infos.businessType}");
	setComBoxCheckedByData = function(inputName,values){
		var arrayObj = new Array();
		arrayObj = values.split(",");
		$("input:checkbox[name='"+inputName+"']").each(function(k){
			for(var i = 0;i<arrayObj.length;i++){
				if($(this).val() == arrayObj[i]){
					$(this).attr("checked","true");
				}
			}
		});
	};
	//当在查询界面上执行ajax请求时,需要将form表单数据一并提交的情况下调用此方法即可
	setPageFormDataToAjaxSubmit = function(idName,url){
			var v_query_curr = $("#"+idName,navTab.getCurrentPanel());
			var _$form_ = $("#pagerForm",navTab.getCurrentPanel());
			v_query_curr.attr("href","");
			v_query_curr.attr("href",url+(url.indexOf('?') == -1 ? "?" : "&")+_$form_.serialize()) ;
	};
	setCheckBoxIdsToForm = function(inputName){
			var ids = "";
			navTab.getCurrentPanel().find("input:checked").filter("[name='orderIndexs']").each(function(i){
				var val = $(this).val();
				ids += i==0 ? val : ","+val;
			});
			$("#"+inputName,navTab.getCurrentPanel()).val(ids);
	};
})(jQuery);
</script>