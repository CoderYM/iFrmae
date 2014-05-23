
/**
 * @author yangmin .
 * @version 1.0
 * @since 1.0
 */

package com.frame.common.test.business.activiti.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.frame.common.core.framework.utils.Page;
import com.frame.common.test.business.activiti.dao.IActRuTaskDao;
import com.frame.common.test.business.activiti.dao.impl.ActRuTaskDaoImpl;
import com.frame.common.test.business.activiti.model.ActRuTask;
import com.frame.common.test.business.activiti.service.IActRuTaskService;

@Service
//默认将类中的所有函数纳入事务管理.
@Transactional
public class ActRuTaskServiceImpl implements IActRuTaskService{
	@Autowired
	private IActRuTaskDao actRuTaskDao;
	@Resource
	private ActRuTaskDaoImpl myBatisDao;
	@Resource 
	TaskService taskService;
	
	/**
	 * 新增
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String add(ActRuTask actRuTask) {
		myBatisDao.save(actRuTask);
		return null;
	}
	
	
	/**
	 * 删除
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String delete(String pk_id) {
		myBatisDao.deleteById(pk_id);
		return null;
	}
	
	/**
	 * 新增修改
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String update(ActRuTask actRuTask) {
		myBatisDao.update(actRuTask);
		return null;
	}
	
	/**
	 * 分页查询
	 * @param  POJO对象
	 * @param  pageIndex          当前页页数
	 * @param  pageSize           每页记录数
	 * @return Page
	 */
	public Page findActRuTasks(ActRuTask actRuTask,
			int pageIndex,
			int pageSize) {
		List<Task> taskList = taskService.createTaskQuery().taskAssignee("").list();
		Page page = new Page(taskList.size(), pageIndex, pageSize, taskList);
		return page;
	}
	
	/**
	 * 根据主键对象获取信息
	 * 
	 * @param  POJO对象
	 * @return ActRuTask
	 */
	public List<ActRuTask> getActRuTaskListByObj(ActRuTask actRuTask) {
		return actRuTaskDao.findListByObj(actRuTask);
	}
	
	/**
	 * 根据主键获取信息
	 * 
	 * @param  POJO对象
	 * @return ActRuTask
	 */
	public ActRuTask getActRuTaskByPk(String pk_Id) {
		return actRuTaskDao.findByPKId(pk_Id);
	}
	
	/**
	 * 查询所有
	 */
	public List<ActRuTask> findAll(){
		return actRuTaskDao.selectAllActRuTask();
	}
	
	/**
	 * 统计在某个条件下的数量
	 * @param bossCnlProperties
	 * @return
	 */
	public int getCountByObj(ActRuTask actRuTask){
		return actRuTaskDao.select_ActRuTasksCount(actRuTask).intValue();
	}
	
}
