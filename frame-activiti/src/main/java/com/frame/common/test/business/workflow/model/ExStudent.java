/*
 * 版权声明 .
 * 此文档的版权归通联支付网络服务有限公司所有
 * Powered By [Allinpay-Boss-framework]
 */

package com.frame.common.test.business.workflow.model;

import javax.persistence.Table;

import com.frame.common.core.framework.annotation.Description;
import com.frame.common.core.framework.repository.mybatis.model.MyBatisBaseModel;
import org.apache.ibatis.type.Alias;

@Table(name="ex_student")
@Alias(value="ExStudent")
public class ExStudent extends  MyBatisBaseModel {
	private static final long serialVersionUID = -1621820692L;
	
	/** 变量 BIRTHDAY . */
	@Description(value="生日开始")
	private String birthdayBegin;
	@Description(value="生日结束")
	private String birthdayEnd;
	
	//columns START
	/** 变量 stuId . */
	@Description(value="stuId")
	private String stuId;
	/** 变量 name . */
	@Description(value="姓名")
	private String name;
	/** 变量 birthday . */
	@Description(value="生日")
	private java.util.Date birthday;
	/** 变量 sex . */
	@Description(value="姓别")
	private Integer sex;
	/** 变量 desc . */
	@Description(value="描述")
	private String desc;
	//columns END

	/**
	* ExStudent 的构造函数
	*/
	public ExStudent() {
	}
	/**
	* ExStudent 的构造函数
	*/
	public ExStudent(
		String stuId
	) {
		this.stuId = stuId;
	}


	public void setStuId(String value) {
		this.stuId = value;
	}
	
	public String getStuId() {
		return this.stuId;
	}
	
	public String getPk() {
		return this.stuId;
	}

	public void setName(String value) {
		this.name = value;
	}
	
	public String getName() {
		return this.name;
	}
	
		public void setBirthdayBegin(String value) {
			this.birthdayBegin = value;
		}
		
		public String getBirthdayBegin() {
			return this.birthdayBegin;
		}
		public void setBirthdayEnd(String value) {
			this.birthdayEnd = value;
		}
		
		public String getBirthdayEnd() {
			return this.birthdayEnd;
		}

	public void setBirthday(java.util.Date value) {
		this.birthday = value;
	}
	
	public java.util.Date getBirthday() {
		return this.birthday;
	}
	

	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	

	public void setDesc(String value) {
		this.desc = value;
	}
	
	public String getDesc() {
		return this.desc;
	}
	

}

