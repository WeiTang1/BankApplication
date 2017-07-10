package com.bank.controller;

import com.bank.dao.TransactionHibernateDAO;
import com.bank.model.Transaction;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.*;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.MediaType;
import java.util.Iterator;
import java.util.List;

/**
 * Created by danieltang on 7/5/17.
 */
@RestController
@RequestMapping("/service")
public class QuickViewController {
//    @RequestMapping(method = RequestMethod.GET,consumes = MediaType.APPLICATION_JSON_VALUE)
//    @ResponseBody
//    public List quickview(@RequestParam("account_id") int id){
//        System.out.println("I am in quickview controller");
//        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
//        TransactionHibernateDAO transactionDao = (TransactionHibernateDAO) context.getBean("transactionDAO");
//        List list = transactionDao.list_account_transaction(id);
//        return list;
//    }

    @RequestMapping(value = "/transforaccount/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON)
    public Response listTrans(@PathVariable("id") int id) {
        System.out.println("I am here in QuickViewController");
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        TransactionHibernateDAO transactionDao = (TransactionHibernateDAO) context.getBean("transactionDAO");
        List list = transactionDao.list_account_transaction(id);
        for(Iterator iterator = list.iterator();iterator.hasNext();){
            Transaction transaction = (Transaction) iterator.next();
            transaction.setAccount(null);
        }
        GenericEntity<List<Transaction>> list1 = new GenericEntity<List<Transaction>>(list) {
        };
        return Response.ok(list1).build();
    }


}
