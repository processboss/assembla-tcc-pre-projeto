package br.com.tcc.estudos.gpb.core.model.persistence.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDAO<T, ID extends Serializable> {  
    T findById(ID id);  
    List<T> listAll();  
    T save(T entity);  
    void delete(T entity);  
} 
