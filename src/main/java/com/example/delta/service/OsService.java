package com.example.delta.service;

import com.example.delta.domain.Client;
import com.example.delta.domain.Equipment;
import com.example.delta.domain.Os;
import com.example.delta.repository.OsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class OsService {

    @Autowired
    private OsDao osDao;
    @Autowired
    private ClientService clientService;
    @Autowired
    private UserService userService;
    @Autowired
    private EquipmentService equipmentService;

    public Os create(Os os) {
        if (os == null) {
            os = new Os();
        }
        Client c = clientService.create(os.getClient());
        Equipment e = equipmentService.create(os.getEquipment());

        os.setClient(c);
        os.setEquipment(e);
        return osDao.save(os);
    }

    public List<Os> findAll(){
        return (List<Os>) osDao.findAll();
    }
    public Os findById(Integer id){
        return  osDao.findById(id).orElse(null);
    }

    public Os edit(Os os){
        Client c =clientService.findById(os.getClient().getId());
        Equipment e =equipmentService.findById(os.getEquipment().getId());
        c.setName(os.getClient().getName());
        c.setEmail(os.getClient().getEmail());
        c.setCpf(os.getClient().getCpf());
        e.setBrand(os.getEquipment().getBrand());
        e.setSerial(os.getEquipment().getSerial());
        e.setModel(os.getEquipment().getModel());
        e.setCostValue(os.getEquipment().getCostValue());
        clientService.create(c);
        equipmentService.merge(e);
        os =  osDao.save(os);
        return os;
    }
}
