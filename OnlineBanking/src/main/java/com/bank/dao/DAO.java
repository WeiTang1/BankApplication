package com.bank.dao;

import java.util.List;

/**
 * Created by danieltang on 6/28/17.
 */
public interface DAO {
    void save(Object obj);
    void update(Object obj, int id);
    void delete(Object obj);
    void delete(int id);
    Object get(int id);
    List list();

}
