package com.bank.dao;

import com.bank.model.Transaction;
import com.bank.model.TransactionStatus;
import com.bank.model.TransactionType;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by danieltang on 6/28/17.
 */
public class TransactionStatusHibernateDAO extends HibernateDaoSupport implements DAO {
    @Transactional
    public void save(Object obj) {
        if (obj instanceof TransactionStatus){
            getHibernateTemplate().save(obj);
        }
    }
    @Transactional
    public void update(Object obj, int id) {
        if(obj instanceof com.bank.model.TransactionStatus){
            ((com.bank.model.TransactionStatus) obj).setId(id);
            getHibernateTemplate().update(obj);
        }
    }
    @Transactional
    public void delete(Object obj) {
        if(obj instanceof TransactionStatus){
            getHibernateTemplate().delete(obj);
        }
    }

    public void delete(int id) {

    }
    @Transactional(readOnly = true)
    public Object get(int id) {
        List list = getHibernateTemplate().find("From TransactionStatus where id = ?",id);
        return list.get(0);
    }
    @Transactional
    public List list() {
        return getHibernateTemplate().loadAll(TransactionType.class);
    }
}
