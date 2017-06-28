package com.bank.dao;
import com.bank.model.Address;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by danieltang on 6/28/17.
 */
public class AddressHibernateDAO extends HibernateDaoSupport implements DAO{
    @Transactional
    public void save(Object obj) {
        if(obj instanceof Address){
            System.out.println("insert new address:");
            getHibernateTemplate().save(((Address)obj));
            System.out.println("Successfully inserted");
        }
    }

    @Transactional
    public void update(Object obj, int id) {
        if(obj instanceof Address){
            System.out.println("I am in address update:");
            ((Address) obj).setId(id);
            getHibernateTemplate().update(obj);
            System.out.println("Successfully updated");
        }
    }
    @Transactional
    public void delete(Object obj) {
        if( obj instanceof  Address){
            System.out.println("I am in Address delete(Object obj)");
            getHibernateTemplate().delete(obj);
        }
    }
    @Transactional
    public void delete(int id) {
        Address address = new Address();
        address.setId(id);
        delete(address);
    }
    @Transactional(readOnly = true)
    public Object get(int id) {
        List list = getHibernateTemplate().find("From Address where id =?",id);
        System.out.println(((Address)list.get(0)));
        return list.get(0);
    }

    public List list() {
        List list = getHibernateTemplate().loadAll(Address.class);
        return list;
    }

}
