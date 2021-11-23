package com.example.delta.dto;

import com.example.delta.domain.Client;
import com.example.delta.dto.ClientDto;
import com.example.delta.domain.Equipment;
import com.example.delta.domain.Os;

import java.io.Serializable;

public class OsDto implements Serializable {

    private String brand;
    private String model;
    private String serial;
    private String value;
    private String defectForRepair;
    private String  name;
    private String email;
    private String cpf;

    private Integer idClient;
    private Integer idEquipment;
    private Integer idOs;

    public Integer getIdClient() {
        return idClient;
    }

    public void setIdClient(Integer idClient) {
        this.idClient = idClient;
    }

    public Integer getIdEquipment() {
        return idEquipment;
    }

    public void setIdEquipment(Integer idEquipment) {
        this.idEquipment = idEquipment;
    }

    public Integer getIdOs() {
        return idOs;
    }

    public void setIdOs(Integer idOs) {
        this.idOs = idOs;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }

    public String  value() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDefectForRepair() {
        return defectForRepair;
    }

    public void setDefectForRepair(String defectForRepair) {
        this.defectForRepair = defectForRepair;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Os build(OsDto osDto){
     Client c = new Client();
     c.setId(idClient);
     c.setEmail(email);
     c.setCpf(cpf);
     Equipment e = new Equipment();
     e.setId(idEquipment);
     c.setName(name);
     e.setBrand(brand);
     e.setSerial(serial);
     e.setModel(model);
     if(value!=null&& !value.equals("")){
         String aux = value.replace(",",".");

         Double v = Double.parseDouble(aux);
         e.setCostValue(v);
     }
     Os os = new Os();
     os.setId(idOs);
     os.setClient(c);
     os.setEquipment(e);
     return os;
    }
}
