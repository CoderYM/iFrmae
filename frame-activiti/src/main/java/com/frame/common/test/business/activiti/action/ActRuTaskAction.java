
/**
 * @author yangmin .
 * @version 1.0
 * @since 1.0
 */

package com.frame.common.test.business.activiti.action;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.frame.common.test.business.activiti.model.ActRuTask;
import com.frame.common.test.business.activiti.service.IActRuTaskService;
import com.frame.common.core.framework.utils.Page;
import com.frame.common.core.framework.utils.SessionUtil;
import com.frame.common.core.system.BaseAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;



@Controller
@RequestMapping("/myTasks")
public class ActRuTaskAction  extends BaseAction{
	@Autowired
	private IActRuTaskService actRuTaskService;
	
	/**
	 * 解决页面上日期类型转换问题
	 * @param request
	 * @param binder
	 * @throws Exception
	 */
	@InitBinder
    protected void initBinder(HttpServletRequest request,
            ServletRequestDataBinder binder) throws Exception {
         binder.registerCustomEditor(Date.class, new CustomDateEditor(
                    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
       }
	
	/**
	 * 列表信息查询
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping("")
	public String findActRuTasks(Model springModel,@ModelAttribute("actRuTask") ActRuTask model)  {
		Page page = actRuTaskService.findActRuTasks(model, model.getPageNum(),  model.getNumPerPage());
		springModel.addAttribute(page);
		return "business/activiti/ActRuTask/ActRuTasksQuery";
	}
	
	
	/**
	 * 新增页面
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/addActRuTaskToPage")
	public String addActRuTask(Model model)  {

		return "business/activiti/ActRuTask/ActRuTaskAdd";
	}
	/**
	 * 新增保存
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping(value="/saveActRuTaskAction",method = RequestMethod.POST)
	public ModelAndView saveActRuTask(ActRuTask model,HttpServletRequest request)  {
		@SuppressWarnings({ "unchecked", "unused" })
		Map<String,Object> userInfMap = (Map<String, Object>) request.getSession().getAttribute(SessionUtil.USER_MAP);
//		model.setCreateOperator(SessionUtil.getLoginUserName(userInfMap));
//		model.setLastUpdateOperator(SessionUtil.getLoginUserName(userInfMap));
		actRuTaskService.add(model);
		return ajaxDoneSuccess("成功");
	}
	/**
	 * 删除
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/delete/{pk_Id}")
	public ModelAndView deleteActRuTask(@PathVariable("pk_Id") String pk_Id)  {
		actRuTaskService.delete(pk_Id);
		return ajaxDoneSuccess("成功");
	}
	
	/**
	 * 批量删除
	 * @param orderIndexs
	 * @return
	 */
	@RequestMapping("/deleteAll")
	public ModelAndView deleteAll(@RequestParam("orderIndexs") String orderIndexs) {
		if (orderIndexs != null && orderIndexs.length()> 0 ){
			String[] ids= orderIndexs.split(",");
			for( int i=0; i<ids.length; i++){
				if (ids[i].length()>0){
					actRuTaskService.delete(ids[i]);
				}
			}
		}
		return ajaxDoneSuccess("成功");
	}
	
	
	/**
	 * 修改初始化
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/modify/{pk_Id}")
	public String initModifyActRuTask(@PathVariable("pk_Id") String pk_Id,Model springModel) {
		ActRuTask actRuTask = actRuTaskService.getActRuTaskByPk(pk_Id);
		springModel.addAttribute("infos",actRuTask);
		return "business/activiti/ActRuTask/ActRuTaskModify";
	}
	
	/**
	 * 修改
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping(value="/modifyActRuTaskAction",method = RequestMethod.POST)
	public ModelAndView modifyActRuTask(ActRuTask model,HttpServletRequest request)  {
		@SuppressWarnings({ "unchecked", "unused" })
		Map<String,Object> userInfMap = (Map<String, Object>) request.getSession().getAttribute(SessionUtil.USER_MAP);
//		model.setLastUpdateOperator(SessionUtil.getLoginUserName(userInfMap));
		actRuTaskService.update(model);
		return ajaxDoneSuccess("成功");
	}
	
	/**
	 * 明细信息查找
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping("/showinfo/{pk_Id}")
	public String findActRuTask(@PathVariable("pk_Id") String pk_Id,Model springModel)  {
		ActRuTask actRuTask = actRuTaskService.getActRuTaskByPk(pk_Id);
		springModel.addAttribute("infos",actRuTask);
		return "business/activiti/ActRuTask/ActRuTaskDetail";
	}
	

}
