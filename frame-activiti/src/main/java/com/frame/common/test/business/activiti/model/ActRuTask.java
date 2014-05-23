
/**
 * @author yangmin .
 * @version 1.0
 * @since 1.0
 */

package com.frame.common.test.business.activiti.model;

import javax.persistence.Table;

import com.frame.common.core.framework.annotation.Description;
import com.frame.common.core.framework.repository.mybatis.model.MyBatisBaseModel;
import org.apache.ibatis.type.Alias;

@Table(name="act_ru_task")
@Alias(value="ActRuTask")
public class ActRuTask extends  MyBatisBaseModel {
	private static final long serialVersionUID = 723000378L;
	
	/** 变量 CREATE_TIME . */
	@Description(value="createTime开始")
	private String createTimeBegin;
	@Description(value="createTime结束")
	private String createTimeEnd;
	/** 变量 DUE_DATE . */
	@Description(value="dueDate开始")
	private String dueDateBegin;
	@Description(value="dueDate结束")
	private String dueDateEnd;
	
	//columns START
	/** 变量 id . */
	@Description(value="id")
	private String id;
	/** 变量 rev . */
	@Description(value="rev")
	private Integer rev;
	/** 变量 executionId . */
	@Description(value="executionId")
	private String executionId;
	/** 变量 procInstId . */
	@Description(value="procInstId")
	private String procInstId;
	/** 变量 procDefId . */
	@Description(value="procDefId")
	private String procDefId;
	/** 变量 name . */
	@Description(value="name")
	private String name;
	/** 变量 parentTaskId . */
	@Description(value="parentTaskId")
	private String parentTaskId;
	/** 变量 description . */
	@Description(value="description")
	private String description;
	/** 变量 taskDefKey . */
	@Description(value="taskDefKey")
	private String taskDefKey;
	/** 变量 owner . */
	@Description(value="owner")
	private String owner;
	/** 变量 assignee . */
	@Description(value="assignee")
	private String assignee;
	/** 变量 delegation . */
	@Description(value="delegation")
	private String delegation;
	/** 变量 priority . */
	@Description(value="priority")
	private Integer priority;
	/** 变量 createTime . */
	@Description(value="createTime")
	private java.util.Date createTime;
	/** 变量 dueDate . */
	@Description(value="dueDate")
	private java.util.Date dueDate;
	/** 变量 category . */
	@Description(value="category")
	private String category;
	/** 变量 suspensionState . */
	@Description(value="suspensionState")
	private Integer suspensionState;
	/** 变量 tenantId . */
	@Description(value="tenantId")
	private String tenantId;
	//columns END

	/**
	* ActRuTask 的构造函数
	*/
	public ActRuTask() {
	}
	/**
	* ActRuTask 的构造函数
	*/
	public ActRuTask(
		String id
	) {
		this.id = id;
	}


	public void setId(String value) {
		this.id = value;
	}
	
	public String getId() {
		return this.id;
	}
	
	public String getPk() {
		return this.id;
	}

	public void setRev(Integer value) {
		this.rev = value;
	}
	
	public Integer getRev() {
		return this.rev;
	}
	

	public void setExecutionId(String value) {
		this.executionId = value;
	}
	
	public String getExecutionId() {
		return this.executionId;
	}
	

	public void setProcInstId(String value) {
		this.procInstId = value;
	}
	
	public String getProcInstId() {
		return this.procInstId;
	}
	

	public void setProcDefId(String value) {
		this.procDefId = value;
	}
	
	public String getProcDefId() {
		return this.procDefId;
	}
	

	public void setName(String value) {
		this.name = value;
	}
	
	public String getName() {
		return this.name;
	}
	

	public void setParentTaskId(String value) {
		this.parentTaskId = value;
	}
	
	public String getParentTaskId() {
		return this.parentTaskId;
	}
	

	public void setDescription(String value) {
		this.description = value;
	}
	
	public String getDescription() {
		return this.description;
	}
	

	public void setTaskDefKey(String value) {
		this.taskDefKey = value;
	}
	
	public String getTaskDefKey() {
		return this.taskDefKey;
	}
	

	public void setOwner(String value) {
		this.owner = value;
	}
	
	public String getOwner() {
		return this.owner;
	}
	

	public void setAssignee(String value) {
		this.assignee = value;
	}
	
	public String getAssignee() {
		return this.assignee;
	}
	

	public void setDelegation(String value) {
		this.delegation = value;
	}
	
	public String getDelegation() {
		return this.delegation;
	}
	

	public void setPriority(Integer value) {
		this.priority = value;
	}
	
	public Integer getPriority() {
		return this.priority;
	}
	
		public void setCreateTimeBegin(String value) {
			this.createTimeBegin = value;
		}
		
		public String getCreateTimeBegin() {
			return this.createTimeBegin;
		}
		public void setCreateTimeEnd(String value) {
			this.createTimeEnd = value;
		}
		
		public String getCreateTimeEnd() {
			return this.createTimeEnd;
		}

	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	
		public void setDueDateBegin(String value) {
			this.dueDateBegin = value;
		}
		
		public String getDueDateBegin() {
			return this.dueDateBegin;
		}
		public void setDueDateEnd(String value) {
			this.dueDateEnd = value;
		}
		
		public String getDueDateEnd() {
			return this.dueDateEnd;
		}

	public void setDueDate(java.util.Date value) {
		this.dueDate = value;
	}
	
	public java.util.Date getDueDate() {
		return this.dueDate;
	}
	

	public void setCategory(String value) {
		this.category = value;
	}
	
	public String getCategory() {
		return this.category;
	}
	

	public void setSuspensionState(Integer value) {
		this.suspensionState = value;
	}
	
	public Integer getSuspensionState() {
		return this.suspensionState;
	}
	

	public void setTenantId(String value) {
		this.tenantId = value;
	}
	
	public String getTenantId() {
		return this.tenantId;
	}
	

}

