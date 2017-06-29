package com.bank.dao;

import com.bank.model.Account;
import com.bank.model.AccountType;
import org.hibernate.Hibernate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by danieltang on 6/28/17.
 */
public class AccountTypeHibernateDAO extends HibernateDaoSupport implements DAO {
    @Transactional
    public void save(Object obj) {
        if (obj instanceof AccountType){
            getHibernateTemplate().save(obj);
        }
    }
    @Transactional
    public void update(Object obj, int id) {
        if(obj instanceof AccountType){
            ((AccountType) obj).setId(id);
            getHibernateTemplate().update(obj);
        }
    }
    @Transactional
    public void delete(Object obj) {
        if (obj instanceof AccountType){
            getHibernateTemplate().delete(obj);
        }
    }


    public void delete(int id) {

    }

    @Transactional(readOnly = true)
    public Object get(int id) {
        List list = getHibernateTemplate().find("From AccountType where id = ?",id);
        return list.get(0);
    }
    @Transactional
    public List list() {
        return getHibernateTemplate().loadAll(AccountType.class);
    }
}
