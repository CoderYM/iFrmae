package com.frame.common.test.business.workflow.model;

import com.frame.common.core.framework.repository.mybatis.model.MyBatisBaseModel;

public class AuTaskModel extends MyBatisBaseModel {

	private static final long serialVersionUID = -6434456621542453904L;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
