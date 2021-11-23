package com.example.delta.service;

import com.example.delta.domain.Client;
import com.example.delta.repository.ClientDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Autowired
    private ClientDao clientDao;

    public Client create(Client client){
        return clientDao.save(client);
    }
    public Client findById(Integer id){
        return clientDao.findById(id).orElse(null);
    }
}
