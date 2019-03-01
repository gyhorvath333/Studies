package com.gyuri.zenekerdoiv2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="county")
public class County {

	
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="county")
	private String county;

	public County() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	@Override
	public String toString() {
		return "County [id=" + id + ", county=" + county + "]";
	}



}
