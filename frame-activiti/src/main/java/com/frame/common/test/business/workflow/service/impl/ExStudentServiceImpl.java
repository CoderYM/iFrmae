/*
 * 版权声明 .
 * 此文档的版权归通联支付网络服务有限公司所有
 * Powered By [Allinpay-Boss-framework]
 */

package com.frame.common.test.business.workflow.service.impl;


import javax.annotation.Resource;
import java.util.List;
import com.frame.common.core.framework.utils.Page;
import com.frame.common.test.business.workflow.dao.IExStudentDao;
import com.frame.common.test.business.workflow.dao.impl.ExStudentDaoImpl;
import com.frame.common.test.business.workflow.model.ExStudent;
import com.frame.common.test.business.workflow.service.IExStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
//默认将类中的所有函数纳入事务管理.
@Transactional
public class ExStudentServiceImpl implements IExStudentService{
	@Autowired
	private IExStudentDao exStudentDao;
	@Resource
	private ExStudentDaoImpl myBatisDao;
	
	
	/**
	 * 新增
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String add(ExStudent exStudent) {
		// 保存申请信息
		myBatisDao.save(exStudent);
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
	 * 有唯一主键，且主键自动生成不可编辑时
	 * @param  POJO对象
	 * @return String
	 */
//	public String saveOrUpdate(ExStudent exStudent) {
//		
//    	// 保存申请信息
//		if(exStudent.getPk() != null)
//			exStudentDao.update(exStudent);
//		else 		
//			exStudentDao.save(exStudent);
//		
//		return null;
//	}
	
	/**
	 * 新增修改
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String update(ExStudent exStudent) {
    	// 保存申请信息
		myBatisDao.update(exStudent);
		
		return null;
	}
	
	/**
	 * 分页查询
	 * @param  POJO对象
	 * @param  pageIndex          当前页页数
	 * @param  pageSize           每页记录数
	 * @return Page
	 */
	public Page findExStudents(ExStudent exStudent,
			int pageIndex,
			int pageSize) {
		return myBatisDao.pageBy(null, null, exStudent, pageIndex, pageSize);
	}
	
	/**
	 * 根据主键对象获取信息
	 * 
	 * @param  POJO对象
	 * @return ExStudent
	 */
	public List<ExStudent> getExStudentListByObj(ExStudent exStudent) {
		return exStudentDao.findListByObj(exStudent);
	}
	
	/**
	 * 根据主键获取信息
	 * 
	 * @param  POJO对象
	 * @return ExStudent
	 */
	public ExStudent getExStudentByPk(String pk_Id) {
		return exStudentDao.findByPKId(pk_Id);
	}
	
	/**
	 * 根据条件获取信息
	 * 
	 * @param  POJO对象
	 * @return ExStudent返回第一个符合条件的对象，适合条件能唯一定位记录的应用场景
	 *	public List<ExStudent> getExStudentListBySql(ExStudent exStudent) {
	 *		return exStudentDao.findListBySqlId("selectPage_ExStudents",exStudent);
	 *	}
	 */
	
	/**
	 * 查询所有
	 */
	public List<ExStudent> findAll(){
		return exStudentDao.selectAllExStudent();
	}
	
	/**
	 * 统计在某个条件下的数量
	 * @param bossCnlProperties
	 * @return
	 */
	public int getCountByObj(ExStudent exStudent){
		return exStudentDao.select_ExStudentsCount(exStudent).intValue();
	}
	
}
