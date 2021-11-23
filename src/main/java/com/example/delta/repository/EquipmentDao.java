package com.example.delta.repository;

import com.example.delta.domain.Equipment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EquipmentDao extends CrudRepository<Equipment, Integer> {
}
