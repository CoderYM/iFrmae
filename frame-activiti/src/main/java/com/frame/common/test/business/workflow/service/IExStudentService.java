/*
 * 版权声明 .
 * 此文档的版权归通联支付网络服务有限公司所有
 * Powered By [Allinpay-Boss-framework]
 */

package com.frame.common.test.business.workflow.service;

import java.util.List;
import com.frame.common.core.framework.utils.Page;
import com.frame.common.test.business.workflow.model.ExStudent;
public interface IExStudentService{
	
	/**
	 * 新增
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String add(ExStudent exStudent);
	
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
	public String update(ExStudent exStudent);
	
	/**
	 * 分页查询
	 * @param  POJO对象
	 * @param  pageIndex          当前页页数
	 * @param  pageSize           每页记录数
	 * @return Page
	 */
	public Page findExStudents(ExStudent exStudent,
			int pageIndex,
			int pageSize);
	
	/**
	 * 根据主键对象获取信息
	 * 
	 * @param  POJO对象
	 * @return ExStudent
	 */
	public List<ExStudent> getExStudentListByObj(ExStudent exStudent);
	
	/**
	 * 根据主键获取信息
	 * 
	 * @param  POJO对象
	 * @return ExStudent
	 */
	public ExStudent getExStudentByPk(String pk_Id);
	
	/**
	 * 查询所有
	 */
	public List<ExStudent> findAll();
	
	/**
	 * 统计在某个条件下的数量
	 * @param bossCnlProperties
	 * @return
	 */
	public int getCountByObj(ExStudent exStudent);
	
}