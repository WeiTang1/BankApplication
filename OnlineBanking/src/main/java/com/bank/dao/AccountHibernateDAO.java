package com.bank.dao;

import com.bank.model.Account;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by danieltang on 6/28/17.
 */
public class AccountHibernateDAO extends HibernateDaoSupport implements DAO {
    @Transactional
    public void save(Object obj) {
        if(obj instanceof Account){
            getHibernateTemplate().save(obj);
        }
    }
    @Transactional
    public void update(Object obj, int id) {
        if(obj instanceof Account){
            ((Account) obj).setId(id);
            getHibernateTemplate().update(obj);
        }
    }
    @Transactional
    public void delete(Object obj) {
        if(obj instanceof Account){
            getHibernateTemplate().delete(obj);
        }
    }
    @Transactional
    public void delete(int id) {
        Account account = new Account();
        account.setId(id);
        delete(account);
    }

    public Object get(int id) {
        List list = getHibernateTemplate().find("from Account where id = ?",id);
        return list.get(0);
    }

    public List list() {
        return getHibernateTemplate().loadAll(Account.class);

    }
}
