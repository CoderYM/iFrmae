/*
 * 版权声明 .
 * 此文档的版权归通联支付网络服务有限公司所有
 * Powered By [Allinpay-Boss-framework]
 */

package com.frame.common.test.business.workflow.action;


import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Task;
import org.junit.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.frame.common.core.framework.utils.Page;
import com.frame.common.core.framework.utils.SessionUtil;
import com.frame.common.core.system.BaseAction;
import com.frame.common.test.business.workflow.model.ExStudent;
import com.frame.common.test.business.workflow.service.IExStudentService;



@Controller
@RequestMapping("/activitiTest")
public class ExStudentAction  extends BaseAction{
	@Autowired
	private IExStudentService exStudentService;
	@Resource
	private RepositoryService repositoryService;
	@Resource
	private RuntimeService runtimeService;
	@Resource 
	TaskService taskService;
	
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
	public String findExStudents(Model springModel,@ModelAttribute("exStudent") ExStudent model)  {
		Page page = exStudentService.findExStudents(model, model.getPageNum(),  model.getNumPerPage());
		springModel.addAttribute(page);
		return "business/workflow/ExStudent/ExStudentsQuery";
	}
	
	
	/**
	 * 新增页面
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/addExStudentToPage")
	public String addExStudent(Model model)  {

		return "business/workflow/ExStudent/ExStudentAdd";
	}
	/**
	 * 新增保存
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping(value="/saveExStudentAction",method = RequestMethod.POST)
	public ModelAndView saveExStudent(ExStudent model,HttpServletRequest request)  {
		@SuppressWarnings({ "unchecked", "unused" })
		Map<String,Object> userInfMap = (Map<String, Object>) request.getSession().getAttribute(SessionUtil.USER_MAP);
//		model.setCreateOperator(SessionUtil.getLoginUserName(userInfMap));
//		model.setLastUpdateOperator(SessionUtil.getLoginUserName(userInfMap));
		model.setStuId(UUID.randomUUID().toString());
		exStudentService.add(model);
		return ajaxDoneSuccess("成功");
	}
	/**
	 * 删除
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/delete/{pk_Id}")
	public ModelAndView deleteExStudent(@PathVariable("pk_Id") String pk_Id)  {
		exStudentService.delete(pk_Id);
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
					exStudentService.delete(ids[i]);
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
	public String initModifyExStudent(@PathVariable("pk_Id") String pk_Id,Model springModel) {
		ExStudent exStudent = exStudentService.getExStudentByPk(pk_Id);
		springModel.addAttribute("infos",exStudent);
		return "business/workflow/ExStudent/ExStudentModify";
	}
	
	/**
	 * 修改
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping(value="/modifyExStudentAction",method = RequestMethod.POST)
	public ModelAndView modifyExStudent(ExStudent model,HttpServletRequest request)  {
		@SuppressWarnings({ "unchecked", "unused" })
		Map<String,Object> userInfMap = (Map<String, Object>) request.getSession().getAttribute(SessionUtil.USER_MAP);
//		model.setLastUpdateOperator(SessionUtil.getLoginUserName(userInfMap));
		exStudentService.update(model);
		return ajaxDoneSuccess("成功");
	}
	
	/**
	 * 明细信息查找
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping("/showinfo/{pk_Id}")
	public String findExStudent(@PathVariable("pk_Id") String pk_Id,Model springModel)  {
		ExStudent exStudent = exStudentService.getExStudentByPk(pk_Id);
		springModel.addAttribute("infos",exStudent);
		return "business/workflow/ExStudent/ExStudentDetail";
	}
	
	@RequestMapping("/workflowTest")
	public ModelAndView workflowTest() throws IOException{
		InputStream is=readXmlFile();
		Assert.assertNotNull(is);
		//发布流程
		Deployment deployment=repositoryService.createDeployment().addInputStream("bpmn20.xml", is).name("holidayRequest").deploy();
		Assert.assertNotNull(deployment);
		System.out.println("deployId:" + deployment.getId());
		//查询流程定义
		ProcessDefinition processDefinition=repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).singleResult();
		
		Long businessKey=new Double(1000000*Math.random()).longValue();
		//启动流程
		runtimeService.startProcessInstanceById(processDefinition.getId(),businessKey.toString());
		//查询任务实例
		List<Task> taskList=taskService.createTaskQuery().processDefinitionId(processDefinition.getId()).list();
		Assert.assertNotNull(taskList==null);
		Assert.assertTrue(taskList.size()>0);
		for(Task task:taskList){
			System.out.println("task name is " + task.getName() + " ,task key is " + task.getTaskDefinitionKey());
		}
		return ajaxDoneSuccess("activiti发布成功");
	}
	
	private InputStream readXmlFile() throws IOException{
		String filePath="bpmn/holidayRequest.bpmn";
		return getClass().getResource("/"+filePath).openStream();
	}

}
