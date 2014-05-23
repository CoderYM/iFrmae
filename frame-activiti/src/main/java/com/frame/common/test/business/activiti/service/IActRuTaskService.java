
/**
 * @author yangmin .
 * @version 1.0
 * @since 1.0
 */

package com.frame.common.test.business.activiti.service;

import java.util.List;
import com.frame.common.core.framework.utils.Page;
import com.frame.common.test.business.activiti.model.ActRuTask;
public interface IActRuTaskService{
	
	/**
	 * 新增
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String add(ActRuTask actRuTask);
	
	/**
	 * 删除
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String delete(String pk_id);
	
	/**
	 * 新增修改
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String update(ActRuTask actRuTask);
	
	/**
	 * 分页查询
	 * @param  POJO对象
	 * @param  pageIndex          当前页页数
	 * @param  pageSize           每页记录数
	 * @return Page
	 */
	public Page findActRuTasks(ActRuTask actRuTask,
			int pageIndex,
			int pageSize);
	
	/**
	 * 根据主键对象获取信息
	 * 
	 * @param  POJO对象
	 * @return ActRuTask
	 */
	public List<ActRuTask> getActRuTaskListByObj(ActRuTask actRuTask);
	
	/**
	 * 根据主键获取信息
	 * 
	 * @param  POJO对象
	 * @return ActRuTask
	 */
	public ActRuTask getActRuTaskByPk(String pk_Id);
	
	/**
	 * 查询所有
	 */
	public List<ActRuTask> findAll();
	
	/**
	 * 统计在某个条件下的数量
	 * @param bossCnlProperties
	 * @return
	 */
	public int getCountByObj(ActRuTask actRuTask);
	
}