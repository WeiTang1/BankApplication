package com.bank.dao;

import com.bank.model.Credential;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by danieltang on 6/28/17.
 */
public class CredentialHibernateDAO extends HibernateDaoSupport implements DAO {
    @Transactional
    public void save(Object obj) {
        if(obj instanceof Credential){
            getHibernateTemplate().save(obj);
        }
    }
    @Transactional
    public void update(Object obj, int id) {
        if(obj instanceof Credential){
            ((Credential) obj).setId(id);
            getHibernateTemplate().update(obj);
        }
    }
    @Transactional
    public void delete(Object obj) {
        if (obj instanceof Credential) {
            getHibernateTemplate().delete(obj);
        }
    }

    public void delete(int id) {

    }

    @Transactional(readOnly = true)
    public Object get(int id) {
        List list = getHibernateTemplate().find("From Credential where id =?",id);
        System.out.println(((Credential)list.get(0)));
        return list.get(0);
    }
    @Transactional(readOnly = true)
    public List login(Credential credential){
        List list = getHibernateTemplate().find("From Credential where loginId=? and password=?",credential.getLoginId(),credential.getPassword());
        return list;
    }

    public List list() {
        return getHibernateTemplate().loadAll(Credential.class);
    }
}
