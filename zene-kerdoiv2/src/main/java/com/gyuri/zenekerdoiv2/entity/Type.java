package com.gyuri.zenekerdoiv2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="type")
public class Type {

	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="type")
	private String type;

	public Type() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "TypeOfSettlement [id=" + id + ", type=" + type + "]";
	}
	
	
}
