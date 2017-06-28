package com.bank.dao;

import com.bank.model.User;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by danieltang on 6/28/17.
 */
public class UserHibernateDAO extends HibernateDaoSupport implements DAO{
    @Transactional
    public void save(Object obj) {
        if (obj instanceof User){
            getHibernateTemplate().save(obj);
        }
    }
    @Transactional
    public void update(Object obj, int id) {
        if(obj instanceof User){
            ((User) obj).setId(id);
            getHibernateTemplate().update(obj);
        }
    }

    @Transactional
    public void delete(Object obj) {
        if (obj instanceof User) {
            getHibernateTemplate().delete(obj);
        }
    }

    @Transactional
    public void delete(int id) {
        User user = new User();
        user.setId(id);
        delete(user);
    }
    @Transactional(readOnly = true)
    public Object get(int id) {
        List list = getHibernateTemplate().find("From User where id =?",id);
        return list.get(0);
    }

    public List list() {
        List list = getHibernateTemplate().loadAll(User.class);
        return list;
    }
}
