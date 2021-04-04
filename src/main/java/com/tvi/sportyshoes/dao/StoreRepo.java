package com.tvi.sportyshoes.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tvi.sportyshoes.model.Shoes;

public interface StoreRepo extends JpaRepository<Shoes, Integer> {
	
	List<Shoes> findById(int id);

	@Query("SELECT DISTINCT s.brand from Shoes s")
	List<String> findByBrand();
	
	@Query("from Shoes where brand=?1 order by size")
	List<Shoes> findByBrandSorted(String brand);
}
