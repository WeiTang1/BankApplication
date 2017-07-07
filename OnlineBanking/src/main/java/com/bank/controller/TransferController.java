package com.bank.controller;

import com.bank.dao.AccountHibernateDAO;
import com.bank.dao.TransactionHibernateDAO;
import com.bank.model.Account;
import com.bank.model.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Enumeration;

/**
 * Created by danieltang on 7/6/17.
 */
@Controller
public class TransferController {
    @RequestMapping(value = "/transfercontrol",method = RequestMethod.POST)
    public ModelAndView transfer( HttpSession session, HttpServletRequest request){
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        AccountHibernateDAO accountHibernateDAO = (AccountHibernateDAO) context.getBean("accountDAO");
        TransactionHibernateDAO transactionHibernateDAO = (TransactionHibernateDAO) context.getBean("transactionDAO");
        ModelAndView model = new ModelAndView();
        System.out.println("i am in Transfer Controller");
        Enumeration e = session.getAttributeNames();
        while(e.hasMoreElements()){
            String name = (String) e.nextElement();
            String value = session.getAttribute(name).toString();
            System.out.println("Name: "+name+ "    value: "+value);
        }

        int transfer_id = Integer.parseInt(request.getParameter("transfer"));
        int recipient_id = Integer.parseInt(request.getParameter("recipient"));
        double amount = Double.parseDouble(request.getParameter("amount"));

        System.out.println("Perform transfer from :"+transfer_id+ "" +
                " to " +recipient_id+
                " amount = " + amount
                );
        Account transfer = (Account) accountHibernateDAO.get(transfer_id);
        Account recipient = (Account) accountHibernateDAO.get(recipient_id);
        transfer.transfer(amount);
        recipient.deposite(amount);
        accountHibernateDAO.update(transfer,transfer_id);
        accountHibernateDAO.update(recipient,recipient_id);
        Transaction transfer_transaction = new Transaction();
        transfer_transaction.setAccount(transfer);
        transfer_transaction.setAmount(amount);
        transfer_transaction.setAvailableBalance(transfer.getBalance());
        Date date = new Date();
        transfer_transaction.setDate(date);
        transfer_transaction.setDescription("transfer");
        transfer_transaction.setTransactionStatusId(1);
        transfer_transaction.setTransactionTypeId(1);
        transactionHibernateDAO.save(transfer_transaction);
        transfer_transaction.setAccount(recipient);
        transfer_transaction.setAvailableBalance(recipient.getBalance());
        transactionHibernateDAO.save(transfer_transaction);
        return model;
    }
}
