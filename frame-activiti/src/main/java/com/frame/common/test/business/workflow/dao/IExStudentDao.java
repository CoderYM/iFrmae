/*
 * 版权声明 .
 * 此文档的版权归通联支付网络服务有限公司所有
 * Powered By [Allinpay-Boss-framework]
 */

package com.frame.common.test.business.workflow.dao;

import com.frame.common.core.framework.repository.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import com.frame.common.test.business.workflow.model.ExStudent;

/**
 * 其中@MyBatisRepository是我们创建的新的注解。
 * Dao中的方法名和TestMapper.xml中的id值必须一致。
 * 从而实现省略不必要的代码
 * @return
 */
@MyBatisRepository 
public interface IExStudentDao  {

	/**根据自定义的对象查询,返回对象集合
	 */
	public List<ExStudent> findListByObj(ExStudent exStudent);
	public  ExStudent findByPKId(@Param("pk_Id") String pk_Id);

	/**
	 * 查询所有集合
	 */
	public List<ExStudent> selectAllExStudent();
	
	/**
	 * 统计在某个条件下的数量
	 * @param bossCnlProperties
	 * @return
	 */
	public Long select_ExStudentsCount(ExStudent exStudent);
	
	public String getNextID();
}

