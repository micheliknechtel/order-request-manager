package com.example.delta.service;



import com.example.delta.domain.Equipment;
import com.example.delta.repository.EquipmentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquipmentService {
    @Autowired
    private EquipmentDao equipmentDao;

    public Equipment create(Equipment equipment){
        return equipmentDao.save(equipment);
    }

    public Equipment findById(Integer id){
        return equipmentDao.findById(id).orElse(null);
    }
    public Equipment merge(Equipment equipment){
        return equipmentDao.save(equipment);
    }

}
