package com.tvi.sportyshoes.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Component
@Entity
public class Shoes {
	
	@Id
	private int id;
	private String shoename;
	private String brand;
	private int size;
	public Shoes() {
		super();
	}
	public Shoes(int id, String shoename, String brand, int size) {
		super();
		this.id = id;
		this.shoename = shoename;
		this.brand = brand;
		this.size = size;
	}

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getShoename() {
		return shoename;
	}
	public void setShoename(String shoename) {
		this.shoename = shoename;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	

}
