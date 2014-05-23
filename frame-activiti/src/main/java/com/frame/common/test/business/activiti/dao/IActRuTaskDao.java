
/**
 * @author yangmin .
 * @version 1.0
 * @since 1.0
 */

package com.frame.common.test.business.activiti.dao;

import com.frame.common.core.framework.repository.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import com.frame.common.test.business.activiti.model.ActRuTask;

/**
 * 其中@MyBatisRepository是我们创建的新的注解。
 * Dao中的方法名和TestMapper.xml中的id值必须一致。
 * 从而实现省略不必要的代码
 * @return
 */
@MyBatisRepository 
public interface IActRuTaskDao  {

	/**根据自定义的对象查询,返回对象集合
	 */
	public List<ActRuTask> findListByObj(ActRuTask actRuTask);
	public  ActRuTask findByPKId(@Param("pk_Id") String pk_Id);

	/**
	 * 查询所有集合
	 */
	public List<ActRuTask> selectAllActRuTask();
	
	/**
	 * 统计在某个条件下的数量
	 * @param bossCnlProperties
	 * @return
	 */
	public Long select_ActRuTasksCount(ActRuTask actRuTask);
	
	public String getNextID();
}

