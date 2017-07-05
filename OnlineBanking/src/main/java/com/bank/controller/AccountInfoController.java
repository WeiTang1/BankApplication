package com.bank.controller;

import com.bank.dao.TransactionHibernateDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by danieltang on 7/5/17.
 */
@Controller
@RequestMapping("/account_information")
@SessionAttributes("transactions")
public class AccountInfoController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView displayAccountInfo(@RequestParam("account_id") int id){
        System.out.println("I am in AccountInfo Controller");
        System.out.println("account id is "+ id);
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        TransactionHibernateDAO transactionDao = (TransactionHibernateDAO) context.getBean("transactionDAO");
        ModelAndView model = new ModelAndView();
        List list = transactionDao.list_account_transaction(id);
        model.addObject("transactions",list);
        model.setViewName("account_information");
        return model;

    }
}
